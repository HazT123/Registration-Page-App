//
//  PersonalDetailsViewController.swift
//  LoginTest
//
//  Created by Codenation10 on 19/07/2018.
//  Copyright © 2018 Codenation. All rights reserved.
//

import UIKit

class PersonalDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var DayPicker: UITextField!
    @IBOutlet weak var MonthPicker: UITextField!
    @IBOutlet weak var YearPicker: UITextField!
    @IBOutlet weak var ContactNumberField: UITextField!
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var monthDatePicker: UIPickerView!
    @IBOutlet weak var yearDatePicker: UIPickerView!

    @IBAction func presentNextView() {
        let textfields = [DayPicker, MonthPicker, YearPicker, ContactNumberField]
        if !validateEmptyFields(textFields: textfields as! [UITextField]) {
            performSegue(withIdentifier: "BillingSegue", sender: self)
        }
    }
    
    let days = (1...31).map { String($0) }
    let months = ["January","Febrary","March","April","May","June","July","August","September","October","November","December"]
    let years = (2017...2100).map { String($0) }
    
    //returns 1 picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // amount of selections available in picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return days.count
        } else if pickerView.tag == 1 {
            return months.count
        } else {
            return years.count
        }
    }
    
    //title for each pick
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //resigns any keyboard
        self.view.endEditing(true)
        if pickerView.tag == 0 {
            return days[row]
        } else if pickerView.tag == 1 {
            return months[row]
        } else {
            return years[row]
        }
    }
    
    //upon selected pick set textfield to value of current pick and hide picker view
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            self.DayPicker.text = self.days[row]
            self.datePicker.isHidden = true
        } else if pickerView.tag == 1 {
            self.MonthPicker.text = self.months[row]
            self.monthDatePicker.isHidden = true
        } else {
            self.YearPicker.text = self.years[row]
            self.yearDatePicker.isHidden = true
        }
    }
    
    //show picker view but don't allow keyboard input
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField != ContactNumberField {
            if textField == DayPicker {
                self.datePicker.isHidden = false
            } else if textField === MonthPicker {
                self.monthDatePicker.isHidden = false
            } else {
                self.yearDatePicker.isHidden = false
            }
            //hides keyboard
            textField.endEditing(true)
        }
    }
 
    // keyboard shows
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == ContactNumberField {
            moveTextField(textField: textField, moveDistance: -220, up: false)
        }
        return true
    }
    
    // keyboard hidden
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if textField == ContactNumberField {
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        self.hideKeyboardWhenTappedAnywhere()
        self.datePicker.isHidden = true
        self.monthDatePicker.isHidden = true
        self.yearDatePicker.isHidden = true
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
    
}
