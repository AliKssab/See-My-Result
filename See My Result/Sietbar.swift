//
//  Sietbar.swift
//  See My Result
//
//  Created by mac on 1/11/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import MOLH







class Sietbar: UIViewController {
   
    var contact: Contact?

    @IBOutlet weak var labellogin: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        labellogin.text = ooo
      
    }
      
var ooo = ""

        
    @IBAction func Home (_ sender: UIButton) {
        let calendera = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as?  SWRevealViewController
             calendera?.modalPresentationStyle = .fullScreen

             self.present(calendera!, animated: false )
       
    }
    func getCurrentLanguage() -> String {
            let locale = Locale.current
            guard let languageCode = locale.languageCode else { return "de_DE" }
            return languageCode
        }
    @IBAction func Change (_ sender: UIButton) {

       
                switch getCurrentLanguage() {
                    
                case "en":
                    print("your device language is English")
                   let defaultAction = UIAlertAction(title: "Accept",
                                              style: .default) { (action) in
                          // Respond to user selection of the action.
                                               
                                               MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
                                               MOLH.reset()
                                                  exit(0)
                         }
                         let cancelAction = UIAlertAction(title: "Cancel",
                                              style: .cancel) { (action) in
                          // Respond to user selection of the action.
                                                 
                         }
                         
                         // Create and configure the alert controller.
                         let alert = UIAlertController(title: "",
                               message: "To apply language change option, you should restart the app",
                               preferredStyle: .alert)
                         alert.addAction(defaultAction)
                         alert.addAction(cancelAction)
                              
                         self.present(alert, animated: true) {
                            // The alert was presented
                         }

                   
                case "ar":
                    print("your device language is Arabic")
         let defaultAction = UIAlertAction(title: "موافق",
                                     style: .default) { (action) in
                 // Respond to user selection of the action.
                                      
                                      MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
                                      MOLH.reset()
                                         exit(0)
                }
                let cancelAction = UIAlertAction(title: "إلغاء",
                                     style: .cancel) { (action) in
                 // Respond to user selection of the action.
                                        
                }
                
                // Create and configure the alert controller.
                let alert = UIAlertController(title: "",
                      message: "برجاء إعادة تشغيل التطبيق لتفعيل تغيير اللغة",
                      preferredStyle: .alert)
                alert.addAction(defaultAction)
                alert.addAction(cancelAction)
                     
                self.present(alert, animated: true) {
                   // The alert was presented
                }

          
                default:
                    break
                }
  
          }
        
        
        
  
     
    @IBAction func Login (_ sender: UIButton) {
        
        
        
        
        
        
        let calendera = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyResults") as?
        
        MyResults
calendera?.modalPresentationStyle = .fullScreen
        calendera?.ali =   ooo
        
        
                    self.present(calendera!, animated: false )
              
           
       }
    
    @IBAction func ShareApp (_ sender: UIButton) {
    let items = [URL(string: "https://www.seemyresult.com/app-sharing.html")!]
    let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
    present(ac, animated: true)
    }
    @IBAction func RateApp (_ sender: UIButton) {
        if let url = URL(string: "https://www.seemyresult.com/app-rating.html") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func Exit (_ sender: UIButton) {
//        exit(0)
           
       }
}
