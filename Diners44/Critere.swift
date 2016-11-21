//
//  Critere.swift
//  Diners44
//
//  Created by Claire DAUGUET on 05/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

protocol Critere {
    
    // Renvoie le nombre total de conflit selon un critère donné
    func nombreTotalDeConflits(_ solution: Solution) -> Int
    
}
