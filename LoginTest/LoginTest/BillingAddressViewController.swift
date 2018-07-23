//
//  BillingAddressViewController.swift
//  LoginTest
//
//  Created by Codenation10 on 19/07/2018.
//  Copyright © 2018 Codenation. All rights reserved.
//

import UIKit

class BillingAddressViewController: UIViewController {
    @IBOutlet weak var houseName: UITextField!
    @IBOutlet weak var postCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAnywhere()
        addNavBarImage()
        self.houseName.becomeFirstResponder()
    }

    // resigns keyboard when return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}  
