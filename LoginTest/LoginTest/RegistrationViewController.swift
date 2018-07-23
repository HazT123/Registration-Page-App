//
//  RegistrationViewController.swift
//  LoginTest
//
//  Created by Codenation10 on 17/07/2018.
//  Copyright © 2018 Codenation. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var salutationTextBox: UITextField!
    @IBOutlet weak var salutationDropDown: UIPickerView!
    @IBOutlet weak var _firstName: UITextField!
    @IBOutlet weak var _Initial: UITextField!
    @IBOutlet weak var _LastName: UITextField!
    @IBOutlet weak var _Email: UITextField!
    @IBOutlet weak var _RetypeEmail: UITextField!
    @IBOutlet weak var _Password: UITextField!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        self.salutationDropDown.isHidden = true
        self.hideKeyboardWhenTappedAnywhere()
        self._firstName.becomeFirstResponder()
        _Password.isSecureTextEntry = true
    }
    
    // >>>>>>>>>>>> PICKER
    let salutations = ["Mr", "Mrs", "Miss", "Ms"]
    //returns 1 picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // amount of selections available in picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return salutations.count
    }
    //title for each pick
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //resigns any keyboard
        self.view.endEditing(true)
        return salutations[row]
    }
    //upon selected pick set textfield to value of current pick and hide picker view
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.salutationTextBox.text = self.salutations[row]
        self.salutationDropDown.isHidden = true
    }
    //show picker view but don't allow keyboard input
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.salutationTextBox {
            self.salutationDropDown.isHidden = false
            //if you dont want the users to use the keyboard type:
            textField.endEditing(true)
        }
    }
    //>>>>>>>>>>>>>
    
    // keyboard shows
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField != salutationTextBox {
            moveTextField(textField: textField, moveDistance: -220, up: false)
        }
        return true
    }
    
    // keyboard hidden
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if textField != salutationTextBox {
            moveTextField(textField: textField, moveDistance: -220, up: true)
        }
    }
    
    // resigns keyboard when return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Animation for text field
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? -moveDistance : moveDistance)
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    // checks wether form fields are empty
    func validateEmptyFields(textFields : [UITextField]) -> Bool {
        var emptyFields = false
        for textField in textFields {
            if (textField.text?.isEmpty)! {
                textField.layer.borderWidth = 1.0
                textField.layer.borderColor = UIColor.red.cgColor
                emptyFields = true
            } else {
                textField.layer.borderWidth = 0.0
            }
        }
        return emptyFields ? true : false
    }
  
    //toggle show/hide password on click
    @IBAction func securePassword(_ sender: UIButton) {
        count += 1
        if count % 2 == 0 {
            sender.isSelected = true
            _Password.isSecureTextEntry = false
        } else {
            sender.isSelected = false
            _Password.isSecureTextEntry = true
        }
    }
    
    // present next view if form validation is okay
    @IBAction func Next(_ sender: Any) {
        let textFields = [salutationTextBox, _firstName, _Initial, _LastName, _Email, _RetypeEmail, _Password]
        if !validateEmptyFields(textFields: textFields as! [UITextField]), emailsMatch() {
            performSegue(withIdentifier: "showPersonalDetails", sender: self)
        }
    }
    
    func emailsMatch() -> Bool {
        if _Email.text != _RetypeEmail.text {
            _Email.layer.borderWidth = 1.0
            _Email.layer.borderColor = UIColor.red.cgColor
            _RetypeEmail.layer.borderWidth = 1.0
            _RetypeEmail.layer.borderColor = UIColor.red.cgColor
            return false
        }
        return true
    }
    
}
