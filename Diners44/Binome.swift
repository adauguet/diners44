//
//  Binome.swift
//  Diners44
//
//  Created by Claire DAUGUET on 04/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

class Binome: Hashable, CustomStringConvertible {
    fileprivate let numero: Int
    
    init (numero: Int) {
        self.numero = numero
    }
    
    var hashValue: Int {
        return numero.hashValue
    }
    
    var description: String {
        get {
            let numeroChaine = String(numero)
            return (numeroChaine.characters.count == 1 ? " " + numeroChaine : numeroChaine)
        }
    }
}

func ==(lhs: Binome, rhs: Binome) -> Bool {
    return lhs.numero == rhs.numero
}
