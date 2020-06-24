//
//  ZHTextField.swift
//  GitExplorer-iOS
//
//  Created by Zoha on 6/22/20.
//  Copyright © 2020 Zoha. All rights reserved.
//

import UIKit

class ZHTextField: UITextField {
  
  
  var isFirstSet = false
  let picker = UIPickerView()
  var onDataSelect: (Command) -> Void = {value in  print(value)}
  var data: [Command] = [] {
    didSet{
      self.isFirstSet = true
      picker.selectRow(0, inComponent: 0, animated: false)
    }
  }
  
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
    clipsToBounds = true
    font = font?.withSize(14)
  }
  
  func setupPicker() {
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
    
    if isFirstSet {
      let first = data.first!
      onDataSelect(first)
      text = first.label
    }
    
    isFirstSet = false
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

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    text = data[row].label
    onDataSelect(data[row])
    isFirstSet = false
  }
  
  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 40.0
  }
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let label: UILabel
    
    if let view = view {
      label = view as! UILabel
    }
    else {
      label = UILabel(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width-10, height: 400))
    }
    
    // When User changes the picker fast then
    // sometimes this give Index out of range fatal error
    label.text = data.count > row ? data[row].label : "You're too fast!"
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.textAlignment = .center
    label.minimumScaleFactor = 0.5
    label.adjustsFontSizeToFitWidth = true
    label.sizeToFit()
    
    return label
  }
}

