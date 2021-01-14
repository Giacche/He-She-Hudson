//
//  signinViewController.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 28/03/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import SVProgressHUD

class signinViewController: UIViewController {
    
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var constTitle: NSLayoutConstraint!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var rePassField: UITextField!
    @IBOutlet weak var viewSigninBtn: UIView!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var constEmail: NSLayoutConstraint!
    
    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sgninBtn(_ sender: Any) {
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setBackgroundLayerColor(UIColor.black.withAlphaComponent(0.5))
        SVProgressHUD.show()
        if (passField.text != rePassField.text){
            let alertController = UIAlertController(title: "Contraseña incorrecta", message: "Por favor escriba su contraseña nuevamente", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            SVProgressHUD.dismiss()
        }else{
            Auth.auth().createUser(withEmail: self.emailField.text!, password: self.passField.text!){ authResult, Error in
                if (Error == nil){
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mainViewController") as! mainViewController
                    nextViewController.modalPresentationStyle = .fullScreen
                    self.present(nextViewController, animated:true, completion:nil)
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Por favor intente nuevamente", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            SVProgressHUD.dismiss()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passField.attributedPlaceholder = NSAttributedString(string: "Contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        rePassField.attributedPlaceholder = NSAttributedString(string: "Repetir Contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        viewSigninBtn.layer.cornerRadius = 10
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

        view.addGestureRecognizer(tap)
        
        // Listen for keyboard appearances and disappearances
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification){
        constTitle.constant = 20
        constEmail.constant = 56
    }

    @objc func keyboardWillHide(_ notification: NSNotification){
        constTitle.constant = 100
        constEmail.constant = 86
    }

}

extension signinViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            textField.resignFirstResponder()
            passField.becomeFirstResponder()
        } else if textField == passField {
            passField.resignFirstResponder()
            rePassField.becomeFirstResponder()
        }else if textField == rePassField {
            rePassField.resignFirstResponder()
        }
        return true
    }

}
