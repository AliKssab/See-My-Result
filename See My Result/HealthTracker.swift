//
//  HealthTracker.swift
//  See My Result
//
//  Created by mac on 12/31/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class HealthTracker: UIViewController {
    
    



          func getCurrentLanguage() -> String {
              let locale = Locale.current
              guard let languageCode = locale.languageCode else { return "de_DE" }
              return languageCode
          }
          
          func checkCurrentLanguage(){
              switch getCurrentLanguage() {
              case "en":
                  print("your device language is English")
    if let url = URL(string: "https://seemyresult.com/visitor_en.html") {
                     UIApplication.shared.open(url)
                 }

              case "ar":
                  print("your device language is Arabic")
                if let url = URL(string: "https://seemyresult.com/visitor_ar.html") {
            UIApplication.shared.open(url)
        }

              default:
                  break
              }
          }
            
            

        
  

    @IBAction func webview(_ sender: Any) {

        checkCurrentLanguage()
        
        
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
//          checkCurrentLanguage()
      }
    
    
    

    

    @IBAction func backbutton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}





