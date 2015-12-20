//
//  CritereMenu.swift
//  Diners44
//
//  Created by Claire DAUGUET on 05/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

class CritereMenu : Critere {
    
    // Renvoie le nombre total de places doubles
    func nombreTotalDeConflits(solution: Solution) -> Int {
        var nombreTotalDeConflits = Int()
        for binome in solution.binomes {
            nombreTotalDeConflits += nombreDeConflits(solution, binome: binome)
        }
        return nombreTotalDeConflits
    }
    
    // Renvoie le nombre de places doubles pour un binôme donné
    func nombreDeConflits(solution: Solution, binome: Binome) -> Int {
        var indexes = Set<Int>()
        for soiree in solution.soirees {
            for diner in soiree.diners {
                for binomeCourant in diner.binomes {
                    if (binomeCourant == binome) {
                        indexes.insert(diner.binomes.indexOf(binome)!)
                    }
                }
            }
        }
        return solution.soirees.count - indexes.count
    }
}