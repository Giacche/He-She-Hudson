//
//  mainViewController.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 28/03/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCrashlytics
import FirebaseAnalytics
import SVProgressHUD
import Alamofire
import AlamofireImage

class mainViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var mainSlider: UIScrollView!
    @IBOutlet weak var dotsControl: UIPageControl!
    @IBOutlet weak var catCollView: UICollectionView!
    @IBOutlet weak var loadViewText: UILabel!
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var orderBtnPos: NSLayoutConstraint!
    
    
    
    var indexForProduct: Int!
    
    var nameCatMain: String!
    
    var filteredMain = [product]()
    
    var categoriesArray: [RootClass] = []
    
    var sliderImages: [UIImage] = [
        UIImage(named: "s04")!,
        UIImage(named: "s03")!,
        UIImage(named: "s02")!,
        UIImage(named: "s05")!,
        UIImage(named: "s06")!,
        UIImage(named: "s07")!,
        UIImage(named: "s08")!,
        UIImage(named: "s01")!
    ]
    
    var productArray: [product] = []
    
    var productSaleArray: [product] = []
    
    var filteredOne: [product] = []
    
    var filteredTwo: [product] = []
    
    // MARK: - Headers
    var headers: HTTPHeaders = [:]
    
    let Url: String = "https://gidaar.com.ar/he-she/wp-json/wc/v3/products/categories"
    
    let UrlProducts: String = "https://elegancejardin.com.ar/he-she/wp-json/wc/v3/products?per_page=100"
    
    let User: String = "ck_d04c109af588faeb5d40f280a310d561dcf7d382"
    
    let Pass: String = "cs_ebdf89edf14d00d7f973cb91926b3f558841b8a8"
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setBackgroundLayerColor(UIColor.black.withAlphaComponent(0.5))
        SVProgressHUD.show()
        
        orderView.layer.cornerRadius = 10
        
        let modelName = UIDevice.modelName
        
        if(modelName == "iPhone5") || (modelName == "iPhone6") || (modelName == "iPhone6s") || (modelName == "iPhone7") || (modelName == "iPhone8") || (modelName == "iPhoneSE"){
            orderBtnPos.constant = 115
        }
                
        getCategories()
        getProducts()
        
    }
    
    // MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        filteredOne.removeAll()
        filteredTwo.removeAll()
        filteredMain.removeAll()
    }
    
    // MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadSlider()
    }
    
    // MARK: - Send categories to categoriesViewController
    @IBAction func seeCategories(_ sender: Any) {
        performSegue(withIdentifier: "catArray", sender: self)
    }
    
    @IBAction func startOrder(_ sender: Any) {
        performSegue(withIdentifier: "catArray", sender: self)
        
        Analytics.logEvent("heshe_start_order", parameters: [:])
    }
    
    @IBAction func seeProducts(_ sender: Any) {
        performSegue(withIdentifier: "prodArray", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if(segue.identifier == "catArray"){
            let vc = segue.destination as! categoriesViewController
            vc.categoriesArrayList = self.categoriesArray
            vc.productArrayCat = self.productArray
        }else{
            if(segue.identifier == "prodArray"){
                let vcTwo = segue.destination as! productsViewController
                vcTwo.prodArrayList = self.productArray
            }else{
                if(segue.identifier == "prodArrayMain"){
                    let vc = segue.destination as! productsViewController
                    vc.prodArrayList = filteredMain
                    vc.segueName = nameCatMain
                }
            }
        }
    }
    
    // MARK: - Load Main Slider
    func loadSlider(){
        self.mainSlider.delegate = self
        
        for i in 0..<self.sliderImages.count{
            let imageView = UIImageView()
            imageView.image = self.sliderImages[i]
            
            imageView.contentMode = .scaleToFill
            
            let xPosition = view.frame.width * CGFloat(i)
            
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainSlider.frame.width, height: self.mainSlider.frame.height)
            
            self.mainSlider.contentSize.width = self.mainSlider.frame.width * CGFloat(i + 1)
            self.mainSlider.addSubview(imageView)
        }
    }
    
    // MARK: - Get Categories
    func getCategories(){

        if let authorizationHeader = Request.authorizationHeader(user: User, password: Pass) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }

        Alamofire.request("https://www.gidaar.com.ar/he-she/wp-json/wc/v3/products/categories?per_page=100&consumer_key=ck_d04c109af588faeb5d40f280a310d561dcf7d382&consumer_secret=cs_ebdf89edf14d00d7f973cb91926b3f558841b8a8", method: .get, headers: headers).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                print(response)
                
                if let result = response.result.value{
                    if let JSONObject = result as? NSArray{
                        for json in JSONObject{
                            let categorie = RootClass(fromDictionary:json as! [String : Any])
                            if(categorie.name != "-"){
                                self.categoriesArray.append(categorie)
                            }
                        }
                    }
                }
                
                self.categoriesArray = self.categoriesArray.sorted(by: {$0.slug! < $1.slug!})
                self.catCollView.reloadData()
                self.loadViewText.isHidden = true
                                                                    
            case .failure(let error):
                print("no")
            }
            //SVProgressHUD.dismiss()
        }
    }
    
    // MARK: - Get Products
    func getProducts(){

        if let authorizationHeader = Request.authorizationHeader(user: User, password: Pass) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }

        Alamofire.request("https://www.gidaar.com.ar/he-she/wp-json/wc/v3/products?per_page=100&consumer_key=ck_d04c109af588faeb5d40f280a310d561dcf7d382&consumer_secret=cs_ebdf89edf14d00d7f973cb91926b3f558841b8a8", method: .get, headers: headers).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                print(response)
                
                if let result = response.result.value{
                    if let JSONObject = result as? NSArray{
                        for json in JSONObject{
                            let productItem = product(fromDictionary:json as! [String : Any])
                            self.productArray.append(productItem)
                        }
                    }
                }
                                                
            case .failure(let error):
                print("no")
            }
            SVProgressHUD.dismiss()
        }
    }
    
    // MARK: - Category Slider
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoriesArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCollectionViewCell", for: indexPath) as! catCollectionViewCell
            
            if(categoriesArray.count != 0){
                cell.catImage.image = UIImage(named: "camera_hover_big")
                cell.catImage.af_setImage(withURL: URL(string: self.categoriesArray[indexPath.row].image.src)!)
                cell.catName.text = self.categoriesArray[indexPath.row].name
            }
            
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        for i in 0..<self.productArray.count{
            for y in 0..<self.productArray[i].categories.count{
                if(self.productArray[i].categories[y].slug == self.categoriesArray[indexPath.row].slug){
                    filteredMain.append(self.productArray[i])
                }
            }
        }
        
        let parameter = ["heshe_category_name": self.categoriesArray[indexPath.row].name!] as [String : Any]
        Analytics.logEvent("heshe_category", parameters: parameter)
            
        nameCatMain = self.categoriesArray[indexPath.row].name!
        self.performSegue(withIdentifier: "prodArrayMain", sender: self)
         
    }

}

extension mainViewController{
    
    
    func scrollViewDidScroll(_ mainSlider: UIScrollView) {
        dotsControl.currentPage = Int(mainSlider.contentOffset.x / mainSlider.frame.size.width)
    }
    
    func scrollViewDidEndDecelerating(_ mainSlider: UIScrollView) {
        let pageNumber = round(mainSlider.contentOffset.x / mainSlider.frame.size.width)
        dotsControl.currentPage = Int(pageNumber)
    }
}
