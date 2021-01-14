//
//  loginViewController.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 28/03/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import SVProgressHUD

class loginViewController: UIViewController {
    
    @IBOutlet weak var dismiss: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewBtnLogin: UIView!
    
    @IBOutlet weak var constTitle: NSLayoutConstraint!
    @IBOutlet weak var constEmail: NSLayoutConstraint!
    @IBOutlet weak var constPass: NSLayoutConstraint!
    
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setBackgroundLayerColor(UIColor.black.withAlphaComponent(0.5))
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: emailField.text!, password: passField.text!){ [weak self] authResult, Error in
            guard let strongSelf = self else { return }
            if (Error == nil){
                SVProgressHUD.dismiss()
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mainViewController") as! mainViewController
                nextViewController.modalPresentationStyle = .fullScreen
                self!.present(nextViewController, animated:true, completion:nil)
            }else{
                SVProgressHUD.dismiss()
                let alertController = UIAlertController(title: "Error", message: "Por favor intente nuevamente", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self!.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        passField.attributedPlaceholder = NSAttributedString(string: "Contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
                
        viewBtnLogin.layer.cornerRadius = 10
        
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
        constTitle.constant = 40
    }

    @objc func keyboardWillHide(_ notification: NSNotification){
        constTitle.constant = 100
    }
}

extension loginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            textField.resignFirstResponder()
            passField.becomeFirstResponder()
        } else if textField == passField {
            passField.resignFirstResponder()
        }
        return true
    }

}
