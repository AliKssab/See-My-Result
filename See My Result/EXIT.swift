//
//  EXIT.swift
//  See My Result
//
//  Created by Ali Wicca on 3/12/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class EXIT: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

   @IBAction func CANCEL (_ sender: UIButton) {
          self.dismiss(animated: false, completion: nil)
         
      }
    @IBAction func OK (_ sender: UIButton) {
              exit(0)
          
       }

}
