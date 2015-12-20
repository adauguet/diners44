//
//  Diner.swift
//  Diners44
//
//  Created by Claire DAUGUET on 04/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

let nombreDeBinomesParDiner = 4

class Diner: Hashable, CustomStringConvertible {
    var binomes: [Binome]
    
    init () {
        binomes = [Binome]()
    }
    
    init (numeros: [Int]) {
        binomes = [Binome]()
        for numero in numeros {
            binomes.append(Binome(numero: numero))
        }
    }
    
    // Renvoie la liste de rencontres individuelles du dîner
    func rencontres() -> Set<Set<Binome>> {
        var rencontres = Set<Set<Binome>>()
        for binome in binomes {
            for binomeRencontre in binomes {
                if (binome != binomeRencontre) {
                    rencontres.insert([binome, binomeRencontre])
                }
            }
        }
        return rencontres
    }
    
    var hashValue: Int {
        return description.hashValue
    }
    
    var description: String {
        get {
            var result = String()
            for binome in binomes {
                result += binome.description
                result += " "
            }
            return result
        }
    }
}

func ==(lhs: Diner, rhs: Diner) -> Bool {
    return lhs.binomes == rhs.binomes
}