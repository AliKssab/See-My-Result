//
//  Diagnose_Illness0.swift
//  See My Result
//
//  Created by mac on 12/31/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class Diagnose_Illness0: UIViewController , UIWebViewDelegate {
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
          super.viewDidLoad()
          checkCurrentLanguage()
      }
      
      func getCurrentLanguage() -> String {
          let locale = Locale.current
          guard let languageCode = locale.languageCode else { return "de_DE" }
          return languageCode
      }
      
      func checkCurrentLanguage(){
          switch getCurrentLanguage() {
          case "en":
              print("your device language is English")
             let url = URL(string: "https://seemyresult.com/easydoctor/index_en.html")
                                 webview.loadRequest(URLRequest(url: url!))
          case "ar":
              print("your device language is Arabic")
    let url = URL(string: "https://seemyresult.com/easydoctor/index_ar.html")
    webview.loadRequest(URLRequest(url: url!))
          default:
              break
          }
      }
        
        
    

    
    
    @IBAction func backbutton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
//        self.modalPresentationStyle = .fullScreen
    }
}
