//
//  CritereRencontreUnique.swift
//  Diners44
//
//  Created by Claire DAUGUET on 05/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

class CritereRencontreUnique : Critere {
    
    // Renvoie le nombre total de rencontres doubles
    func nombreTotalDeConflits(_ solution: Solution) -> Int {
        var nombreTotalDeConflits = Int()
        for binome in solution.binomes {
            nombreTotalDeConflits += nombreDeConflits(solution, binome: binome)
        }
        return nombreTotalDeConflits
    }
    
    // Renvoie le nombre de rencontres doubles pour un binôme donné
    func nombreDeConflits(_ solution: Solution, binome: Binome) -> Int {
        return solution.soirees.count * (nombreDeBinomesParDiner - 1) - solution.binomesRencontres(binome).count
    }
}
