//
//  MyResults.swift
//  See My Result
//
//  Created by mac on 1/9/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SafariServices
struct Contact {

    var name: String
    
}

class MyResults: UIViewController  , UIWebViewDelegate{
    var ali : String = "eeeee"
  override func viewDidLoad() {
      super.viewDidLoad()
      checkCurrentLanguage()
    
    
  }
    

   
//  weak var delegate: MonthViewDelegate?
  func getCurrentLanguage() -> String {
      let locale = Locale.current
      guard let languageCode = locale.languageCode else { return "de_DE" }
      return languageCode
  }
    
    
  
  func checkCurrentLanguage(){
      switch getCurrentLanguage() {
      case "en":
       
ali = "lol"
          print("your device language is English")

         let url = URL(string: "https://seemyresult.com/patient/login")
                             web.loadRequest(URLRequest(url: url!))
      case "ar":
//        ali = "bbb"
          print("your device language is Arabic")
let url = URL(string: "https://seemyresult.com/patient/login")
web.loadRequest(URLRequest(url: url!))
      default:
          break
      }
  }
    
    
    
    
    
    
    
    
    
    
    @IBAction func BACK(_ sender: Any) {
           self.dismiss(animated: false, completion: nil)
        print(ali)
       }

    @IBOutlet weak var web:  UIWebView!
}




