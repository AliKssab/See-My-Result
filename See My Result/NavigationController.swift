//
//  NavigationController.swift
//  See My Result
//
//  Created by mac on 1/11/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
