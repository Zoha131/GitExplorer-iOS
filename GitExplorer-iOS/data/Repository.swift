//
//  Repository.swift
//  GitExplorer-iOS
//
//  Created by Zoha on 6/22/20.
//  Copyright © 2020 Zoha. All rights reserved.
//

import Foundation

class Repository {
  static let shared = Repository()
  private init() { generateData() }
  
  private(set) var primaryOption: [Command] = []
  private(set) var secondaryOptions: [String: [Command]] = [:]
  
  private func generateData() {
    
    if let filePath = Bundle.main.path(forResource: "Data", ofType: "json") {
      let fileURL = URL(fileURLWithPath: filePath)
      do {
        let data = try Data(contentsOf: fileURL)
        
        let outData =  try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        outData?.forEach{ key, value in
       
          if let nsArray = value as? NSArray{
            primaryOption = convertToCommandList(nsArray: nsArray)
          }
          
          if let nsDict = value as? NSDictionary {
                        
            nsDict.forEach{ elKey, elValue in
              
              if let nsArray = elValue as? NSArray,
                let nsKey = elKey as? String{
                
                secondaryOptions[nsKey] = convertToCommandList(nsArray: nsArray)
                
              }
            }
          }
        }
        
      } catch let error {
        print("Error in parsing \(error.localizedDescription)")
      }
    }
  }
  
  func convertToCommandList(nsArray: NSArray)-> [Command]{
    
    return nsArray.map{ element in
      
      let nsDict = element as! NSDictionary
      
      let value = nsDict["value"] as! String
      let label = nsDict["label"] as! String
      let usage = nsDict["usage"] as? String
      let nb = nsDict["nb"] as? String
      
      let command = Command(value: value, label: label, usage: usage, nb: nb)
      
      return command
      
    }.sorted { (lhs, rhs) -> Bool in
      lhs.label < rhs.label
    }
  }
}

struct Command {
  let value: String
  let label: String
  let usage: String?
  let nb: String?
}
