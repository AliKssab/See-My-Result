//
//  back.swift
//  See My Result
//
//  Created by mac on 1/21/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class back: UIViewController {
    @IBAction func cancel(_ sender: Any) {
         self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func ok(_ sender: Any) {
        let calender = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as? SWRevealViewController
        calender?.modalPresentationStyle = .fullScreen
        self.present(calender!, animated: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
