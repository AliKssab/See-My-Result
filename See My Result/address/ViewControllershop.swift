//
//  ViewControllershop.swift
//  See My Result
//
//  Created by mac on 1/23/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

//import Kingfisher

import Alamofire
import SwiftyJSON
import WebKit


struct Hero1 : Decodable  {
  let name: String
  let address: String
  let city : String
  let photo : String
}


extension UIImageView {
  func downloaded1(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
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
  func downloaded1(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
    guard let url = URL(string: link) else { return }
    downloaded(from: url, contentMode: mode)
  }
}

class ViewControllershop: UIViewController  ,UITableViewDelegate,UITableViewDataSource , UISearchBarDelegate{
  var searchedCountry = [String]()
  var inSearchMode: Bool {
    return searchKeyword != nil
  }
  var searchKeyword: String? {
    didSet {
      if let searchKeyword = searchKeyword {
        self.filteredHeroes = heroes.filter({ $0.name.lowercased().contains(searchKeyword) || $0.city.lowercased().contains(searchKeyword) })
      } else {
        self.filteredHeroes = []
      }
      self.tableView.reloadData()
    }
  }
  var heroes = [Hero1]()
  var filteredHeroes = [Hero1]()
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var buttoN: UIButton!
  @IBOutlet weak var searchBar: UISearchBar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.keyboardDismissMode = .onDrag
    tableView.alwaysBounceVertical = true
    searchBar.delegate = self
    searchBar.returnKeyType = .search
    fetchData()
  }
  
  private func fetchData() {
    let url = URL(string: "https://seemyresult.com/api/labs")
    URLSession.shared.dataTask(with: url!) { [weak self] (date, response, errer) in
      if errer == nil {
        do {
          self?.heroes = try JSONDecoder().decode([Hero1].self , from: date!)
        } catch {
          print("prent errer")
        }
        DispatchQueue.main.async {
          self?.tableView.reloadData()
        }
      }
    } .resume()
  }
  
  func heroFor(indexPath: IndexPath) -> Hero1 {
    return inSearchMode ? filteredHeroes[indexPath.row] : heroes[indexPath.row]
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return inSearchMode ? filteredHeroes.count : heroes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cel = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! celladdress
    
    let hero = heroFor(indexPath: indexPath)
    cel.labelcite.text = hero.address.capitalized
    cel.labeladdres.text = hero.city.capitalized
    cel.labelname.text = hero.name.capitalized
    //        cel.images.contentMode =  .scaleAspectFill
    let defoltlink = "https://seemyresult.com"
    let comblenLing = defoltlink + hero.photo
    cel.myimage.downloaded(from: comblenLing)
    
    return cel
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let url = URL(string: "https://seemyresult.com/lab/login") {
      UIApplication.shared.open(url)
    }
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if let searchKeyword = searchBar.text?.lowercased(), !searchKeyword.isEmpty {
      self.searchKeyword = searchKeyword
    } else {
      self.searchKeyword = nil
    }
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchKeyword = nil
    searchBar.text = ""
  }
  
  @IBAction func back(_ sender: Any) {
    self.dismiss(animated: false, completion: nil)
  }
  
}
