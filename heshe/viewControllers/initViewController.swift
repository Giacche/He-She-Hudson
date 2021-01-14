//
//  initViewController.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 27/03/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit

class initViewController: UIViewController {
    
    @IBOutlet weak var viewBtnLogin: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewBtnSignin: UIView!
    @IBOutlet weak var btnSignin: UIButton!
    
    
    
    
    @IBAction func btnLogin(_ sender: Any) {
    }
    
    @IBAction func btnSignin(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBtnLogin.layer.cornerRadius = 10
        viewBtnSignin.layer.cornerRadius = 10
    }


}

