//
//  ZHInfoView.swift
//  GitExplorer-iOS
//
//  Created by Zoha on 6/21/20.
//  Copyright © 2020 Zoha. All rights reserved.
//

import UIKit

@IBDesignable
class ZHInfoView: UIView {

  let leftView = UIView()
  let labelView = UILabel()
  
  private let labelMargin:CGFloat = 10
  
  @IBInspectable var infoText: String = "" {
    didSet {
      labelView.text = infoText
    }
  }
  
  
  override func awakeFromNib() {
     super.awakeFromNib()
     setup()
   }
   
   override func prepareForInterfaceBuilder() {
     super.prepareForInterfaceBuilder()
     setup()
   }
   
  func setup() {
    translatesAutoresizingMaskIntoConstraints = false
    leftView.translatesAutoresizingMaskIntoConstraints = false
    labelView.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(leftView)
    addSubview(labelView)
    
    leftView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    leftView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    leftView.widthAnchor.constraint(equalToConstant: 7).isActive = true
    leftView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
    
    labelView.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 15).isActive = true
    labelView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    labelView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
    self.heightAnchor.constraint(greaterThanOrEqualTo: labelView.heightAnchor, constant: 10).isActive = true
    
    labelView.numberOfLines = 10
    labelView.textColor = .white
    
    leftView.backgroundColor = primaryColor
    
    backgroundColor = secondaryColor
    layer.cornerRadius = 8
    clipsToBounds = true
    
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: bounds.width, height: 40)
  }
  
}
