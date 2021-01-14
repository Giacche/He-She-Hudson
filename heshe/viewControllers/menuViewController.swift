//
//  menuViewController.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 24/05/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCrashlytics
import FirebaseAnalytics
import CoreTelephony
import CoreLocation

class menuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cellPhone(_ sender: Any) {
        let url: NSURL = URL(string: "TEL://+54335668")! as NSURL
                
        if UIApplication.shared.canOpenURL(url as URL) {
            if let mnc = CTTelephonyNetworkInfo().subscriberCellularProvider?.mobileNetworkCode, !mnc.isEmpty{
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            }else{
                let alertController = UIAlertController(title: "Aviso", message: "Usted no puede realizar llamadas desde este dispositivo.", preferredStyle: .alert)
                let noAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                alertController.addAction(noAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }else{
            let alertController = UIAlertController(title: "Aviso", message: "Usted no puede realizar llamadas desde este dispositivo.", preferredStyle: .alert)
            let noAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            alertController.addAction(noAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        Analytics.logEvent("heshe_call", parameters: [:])
        
    }
    
    
    @IBAction func openWhatsApp(_ sender: Any) {
        let urlWhats = "https://wa.me/5491165005932?text=¡Hola He-She!"
        
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                } else {
                    let alertController = UIAlertController(title: "Aviso", message: "Usted no posee WhatsApp instalada", preferredStyle: .alert)
                    let noAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alertController.addAction(noAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
        Analytics.logEvent("heshe_whatsapp", parameters: [:])
    }
    
    
    @IBAction func locationBtn(_ sender: Any) {
        UIApplication.shared.open(NSURL(string:
        "https://www.google.com.ar/maps/place/He-she/@-34.787609,-58.1631018,17z/data=!3m1!4b1!4m5!3m4!1s0x95a3264bf8cb7277:0xd3511b4e4d8eaadd!8m2!3d-34.787609!4d-58.1609131")! as URL, options: [:], completionHandler: nil)
        
        Analytics.logEvent("heshe_location", parameters: [:])
    }
    
    
    
    @IBAction func goToSite(_ sender: Any) {
        UIApplication.shared.open(URL(string: "http://heshehudson.com.ar/")!, options: [:], completionHandler: nil)
        
        Analytics.logEvent("heshe_web", parameters: [:])
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        let alertController = UIAlertController(title: "Cerrar sesión", message: "¿Desea cerrar sesión?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Si", style: .default, handler: {(action: UIAlertAction!) in
            try! Auth.auth().signOut()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "initViewController")
            vc!.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true, completion: nil)
            Constants.order.orderProducts = []
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    

}
