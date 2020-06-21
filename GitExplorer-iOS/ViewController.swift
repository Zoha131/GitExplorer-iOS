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
  @IBOutlet weak var subHeaderLabel: UILabel!
  @IBOutlet weak var primarySelect: ZHSelectView!
  @IBOutlet weak var secondarySelect: ZHSelectView!
  @IBOutlet weak var usageInfo: ZHInfoView!
  @IBOutlet weak var noteInfo: ZHInfoView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    inputStack.setCustomSpacing(40, after: subHeaderLabel)
    
  }


}

