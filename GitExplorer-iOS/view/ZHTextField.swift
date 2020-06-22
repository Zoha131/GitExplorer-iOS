//
//  ZHTextField.swift
//  GitExplorer-iOS
//
//  Created by Zoha on 6/22/20.
//  Copyright © 2020 Zoha. All rights reserved.
//

import UIKit

class ZHTextField: UITextField {
  
  var data: [String] = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Sunday",
    "Monday",
    "Sunday",
    "Monday",
  ]
  var onDataSelect: (String) -> Void = {value in  print(value)}
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupPicker()
    setup()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupPicker()
    setup()
  }
  
  func setup(){
    
    textColor = secondaryColor
    tintColor = UIColor.clear
    text = "Trial ehhlo"
    
  }
  
  func setupPicker() {
    let picker = UIPickerView()
    picker.delegate = self
    picker.dataSource = self
    
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ZHTextField.dismissKeyboard))
    
    toolbar.setItems([doneButton], animated: false)
    toolbar.isUserInteractionEnabled = true
    
    inputView = picker
    inputAccessoryView = toolbar
  }
  
  @objc func dismissKeyboard() {
    resignFirstResponder()
  }
  
}

extension ZHTextField: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return data.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return data[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    onDataSelect(data[row])
  }
}

