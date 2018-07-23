//
//  ViewController.swift
//  LoginTest
//
//  Created by Codenation10 on 17/07/2018.
//  Copyright © 2018 Codenation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var _username: UITextField!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _login_button: UIButton!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var forgotAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        _username.delegate = self
        _password.delegate = self
        self.hideKeyboardWhenTappedAnywhere()
        forgotPasswordLabel.underline()
        forgotAccountLabel.underline()
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        let username = _username.text
        let password = _password.text
        
        if username == "" || password == "" {
            return
        }
        
        //DoLogin(username!, password!)
    }
    
}

// resigns keyboard when enter is pressed
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

public extension UIViewController {
    func hideKeyboardWhenTappedAnywhere() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

public extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString);   attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
