//
//  ViewController.swift
//  See My Result
//
//  Created by mac on 12/4/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

//import updateKingfisher

import Alamofire
import SwiftyJSON
import WebKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
struct Hero : Decodable  {
    let photo: String
    let title_en: String
    let title_ar: String
    let date : String
    let original_content_en : String
    let original_content_ar : String
}
class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UIScrollViewDelegate {
    
    @IBOutlet weak var Hometabelview: UITableView!
    @IBOutlet weak var Scroll: UIScrollView!

        
    var heroes  = [Hero]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Hometabelview.delegate = self
        Hometabelview.dataSource = self
        
       
        //table view height
        let constraint = self.Hometabelview.constraints[0]
//        if let vc = self.revealViewController() {
//            self.view.addGestureRecognizer((vc.panGestureRecognizer()))
//
//            self.view.addGestureRecognizer((vc.tapGestureRecognizer()))
//            vc.rearViewRevealWidth = 300
//
//
//
//
//        }
        
        DispatchQueue.main.async {
            let url = URL(string: "https://seemyresult.com/api/articles")
            URLSession.shared.dataTask(with: url!) { (date, response, errer ) in
                if errer == nil {
                    do {
                        
                        self.heroes = try JSONDecoder().decode([Hero].self , from: date!)
                        
                        
                        
                        

                    } catch {
                        
                        print("prent errer")
                    }
                    DispatchQueue.main.async {
                        self.Hometabelview.reloadData()
                        constraint.constant = CGFloat(self.heroes.count * 330)
                       

                    }
                }
                } .resume()
        }

        
    }
    
   
    @IBAction func myres(_ sender: Any) {
        var calender = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HealthTracker") as? HealthTracker
        calender?.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
//
        self.present(calender!, animated: true)
    }
    
    
    
    
    
    
    @IBAction func diagnose(_ sender: Any) {
        let calender = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "aaa") as?  Diagnose_Illness0
        calender?.modalPresentationStyle = .fullScreen
        self.present(calender!, animated: true)
    }
    func getCurrentLanguage() -> String {
             let locale = Locale.current
             guard let languageCode = locale.languageCode else { return "de_DE" }
             return languageCode
         }
 
    @IBAction func siewtminew(_ sender: UIButton) {
        let vC = self.revealViewController()
//        vC?.rightRevealToggle(animated: true)
      
     
              switch getCurrentLanguage() {
              case "en":
                  vC?.revealToggle(animated: true)

                  print("your device language is English")
               case "ar":
                  print("your device language is Arabic")
         vC?.rightRevealToggle(animated: true)
                  
              default:
                break
            }
        
        
        
        
        
    }
    
    
    
    @IBAction func ALIALIALI(_ sender: Any) {
        let calendera = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ali") as?  ContactUsA
        calendera?.modalPresentationStyle = .fullScreen
        self.present(calendera!, animated: true)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }


//
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Hometabelviewcell
        
        
        func getCurrentLanguage() -> String {
            let locale = Locale.current
            guard let languageCode = locale.languageCode else { return "de_DE" }
            return languageCode
        }
//
//        switch getCurrentLanguage() {
//        case "en":
//            print("your device language is English")
//           cel.labeltexst.text = heroes[indexPath.row].title_en.capitalized
//
//        case "ar":
//            print("your device language is Arabic")
//            cel.labeltexst.text = heroes[indexPath.row].title_ar.capitalized
//        default:
//            break
//        }
//
//
        
      
        
        
        switch getCurrentLanguage() {
        case "en":
            print("your device language is English")
           cel.labeltexst.text = heroes[indexPath.row].title_en.capitalized
            
        case "ar":
            print("your device language is Arabic")
            cel.labeltexst.text = heroes[indexPath.row].title_ar.capitalized
        default:
            break
        }
        
//        var string = "<!DOCTYPE html> <html> <body> <h1>My First Heading</h1> <p>My first paragraph.</p> </body> </html>"
//        let str = string.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
//        
//        
//
//
//        func checkCurrentLanguage(){
//              switch getCurrentLanguage() {
//              case "en":
//                  print("your device language is English")
//          cel.labeltexst.text = heroes[indexPath.row].title_en.capitalized
//              case "ar":
//                  print("your device language is Arabic")
//       cel.labeltexst.text = heroes[indexPath.row].title_ar.capitalized
//              default:
//                  break
//              }
//          }

        
        
        
        
        
        
        
//        cel.labeltexst.text = heroes[indexPath.row].title_en.capitalized
//        cel.labeltexst.text = heroes[indexPath.row].title_ar.capitalized
        cel.labelDeat.text = heroes[indexPath.row].date.capitalized
//        cel.images.contentMode =  .scaleToFill
        let defoltlink = "https://seemyresult.com"
        let comblenLing = defoltlink + heroes[indexPath.row].photo
        cel.images.downloaded(from: comblenLing )
        
        return cel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
       
            let calender = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "didtabelview") as! didtabelview
//        var string = "<!DOCTYPE html> <html> <body> <h1>My First Heading</h1> <p>My first paragraph.</p> </body> </html>"
//               let str = string.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        
        func getCurrentLanguage() -> String {
                  let locale = Locale.current
                  guard let languageCode = locale.languageCode else { return "de_DE" }
                  return languageCode
              }
        switch getCurrentLanguage() {
               case "en":
                   print("your device language is English")
                  calender.labels = heroes[indexPath.row].title_en.capitalized
                  calender.labeltexst = heroes[indexPath.row].original_content_en.capitalized
                   
               case "ar":
                   print("your device language is Arabic")
                    calender.labels = heroes[indexPath.row].title_ar.capitalized
                           calender.labeltexst = heroes[indexPath.row].original_content_ar.capitalized
               default:
                   break
               }
               
        
        
        
        
        
        
        
        calender.data = heroes[indexPath.row].date.capitalized
        
       
     
       
         let defoltlink = "https://seemyresult.com"
        let comblenLing = defoltlink + heroes[indexPath.row].photo
        calender.didimags =  defoltlink + heroes[indexPath.row].photo
           
        calender.modalPresentationStyle = .fullScreen
        
        self.present(calender, animated: true)
        
    }
    
    
    
    
    
    
    
    @IBAction func myResuts(_ sender: Any) {
        let calender = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyResults") as? MyResults
        calender?.modalPresentationStyle = .fullScreen

        
        self.present(calender!, animated: true)
    }
    
    
   
    @IBAction func LINKCOMBINE(_ sender: Any) {
        if let url = URL(string: "https://www.alabdelaziz.com") {
            UIApplication.shared.open(url)
        }
    }
   
    
    @IBAction func good(_ sender: Any) {
        let calender = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Contact_usgood") as? Contact_usgood
        calender?.modalPresentationStyle = .fullScreen

        self.present(calender!, animated: true)
    }
    
    @IBAction func shopbootn(_ sender: Any) {
        let calender = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "shop") as? ViewControllershop
        calender?.modalPresentationStyle = .fullScreen

        self.present(calender!, animated: true)
    }
}

//completionHandler: {(data)})
