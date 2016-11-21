//
//  SetExtensions.swift
//  Diners44
//
//  Created by Claire DAUGUET on 06/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

extension Set {
    
    func random() -> Element {
        return self[self.index(self.startIndex, offsetBy: Int(arc4random_uniform(UInt32(count))))]
    }
}
