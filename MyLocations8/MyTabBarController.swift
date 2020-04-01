//
//  MyTabBarController.swift
//  MyLocations8
//
//  Created by Ed Katzman on 3/31/20.
//  Copyright © 2020 TDG. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
