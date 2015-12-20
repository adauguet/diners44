//
//  ArrayExtentions.swift
//  Diners44
//
//  Created by Claire DAUGUET on 06/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

extension Array {
    func randomElement() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}