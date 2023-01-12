//
//  celladdress.swift
//  See My Result
//
//  Created by mac on 1/25/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class celladdress: UITableViewCell {
    @IBOutlet weak var butoon: UIButton!
    
    @IBOutlet weak var labelname: UILabel!
    
    @IBOutlet weak var myimage: UIImageView!
    
    @IBOutlet weak var labelcite: UILabel!
    @IBOutlet weak var labeladdres: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        viewinlabel.isHidden = true
        butoon.clipsToBounds = true
        butoon.layer.borderColor = UIColor.gray.cgColor
        butoon.layer.borderWidth = 0.3
        butoon.layer.cornerRadius = 10
    }
}
