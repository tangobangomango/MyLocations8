//
//  String + AddText.swift
//  MyLocations8
//
//  Created by Ed Katzman on 3/31/20.
//  Copyright © 2020 TDG. All rights reserved.
//

import UIKit

extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}

// mutating because it changes a struct (here String) which is a value type
