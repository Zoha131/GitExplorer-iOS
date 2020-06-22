//
//  ViewController.swift
//  GitExplorer-iOS
//
//  Created by Zoha on 6/21/20.
//  Copyright © 2020 Zoha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var inputStack: UIStackView!
  @IBOutlet weak var headerLabel: UILabel!
  @IBOutlet weak var subHeaderLabel: UILabel!
  @IBOutlet weak var infoStack: UIStackView!
  @IBOutlet weak var primarySelect: ZHSelectView!
  @IBOutlet weak var secondarySelect: ZHSelectView!
  @IBOutlet weak var usageInfo: ZHInfoView!
  @IBOutlet weak var noteInfo: ZHInfoView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    inputStack.setCustomSpacing(30, after: subHeaderLabel)
    infoStack.setCustomSpacing(20, after: usageInfo)
    
    let headerTxt = "Git Command Explorer"
    let myMutableString = NSMutableAttributedString(string: "Git Command Explorer")
    myMutableString.addAttribute(
      NSAttributedString.Key.foregroundColor,
      value: secondaryColor,
      range: NSRange(location:0,length:headerTxt.count)
    )
    
    myMutableString.addAttribute(
      NSAttributedString.Key.foregroundColor,
      value: primaryColor,
      range: NSRange(location:4,length:7)
    )
    
    headerLabel.attributedText = myMutableString
    
    secondarySelect.alpha = 0.0
    
    
    
  }


}

