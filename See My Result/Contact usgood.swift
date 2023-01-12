//
//  Contact usgood.swift
//  See My Result
//
//  Created by mac on 1/3/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import MessageUI

class Contact_usgood: UIViewController ,  MFMailComposeViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func makeAPhoneCall1()  {
        let url: NSURL = URL(string: "TEL://+201018584111")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        print(url)
    }
    func makeAPhoneCall2()  {
        let url: NSURL = URL(string: "TEL://+201018584222")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        print(url)
    }
    @IBAction func firstnamberone(_ sender: UIButton) {
         self.makeAPhoneCall1()
        print("201018584111")
    }
    @IBAction func skandnambertwo(_ sender: Any) {
         self.makeAPhoneCall2()
           print("201018584222")
    }
    
    @IBAction func namberwatsapp(_ sender: Any) {
        let urlWhats = "whatsapp://send?phone=+919789384445&abid=12354&text=Hello"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    UIApplication.shared.openURL(whatsappURL)
                } else {
                    print("Install Whatsapp")
                }
            }
        }
    }
    @IBAction func buttonmil(_ sender: Any) {
       
        sendEmail()
        
    }
    
    
    
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["seemyresult.com@gmail.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
            
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    
    
    
    
    
    
    
    
//    func shomil() {
//
//        guard MFMailComposeViewController.canSendMail() else {
//
//
//            return
//        }
//        let composer = MFMailComposeViewController()
//        composer.mailComposeDelegate = self as! MFMailComposeViewControllerDelegate
//        composer.setToRecipients(["aliwicca788@gmail.com"])
//        composer.setSubject("Helpe")
//        composer.setMessageBody("ssssssss", isHTML: false)
//     present(composer, animated: true)
//    }
    
    
    
    
    
           func getCurrentLanguage() -> String {
                 let locale = Locale.current
                 guard let languageCode = locale.languageCode else { return "de_DE" }
                 return languageCode
             }
             
             func checkCurrentLanguage(){
                 switch getCurrentLanguage() {
                 case "en":
                     print("your device language is English")
              if let url = URL(string: "https://www.alabdelaziz.com") {
                        UIApplication.shared.open(url)
                    }
                 case "ar":
                     print("your device language is Arabic")
           if let url = URL(string: "https://www.alabdelaziz.com/index_ar.html") {
               UIApplication.shared.open(url)
           }
                 default:
                     break
                 }
             }


  
    @IBAction func webview(_ sender: Any) {
       checkCurrentLanguage()
       
    }
    
    @IBAction func back(_ sender: Any) {
          self.dismiss(animated: false, completion: nil)
    }
    

}
//extension Contact_usgood:MFMailComposeViewControllerDelegate {
//
//
//
//
//
//











