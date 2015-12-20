//
//  Solution.swift
//  Diners44
//
//  Created by Claire DAUGUET on 04/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

let nombreDeSoirees = 4

class Solution {
    var binomes = Set<Binome>()
    var soirees = [Soiree]()
    
    let critereRencontreUnique = CritereRencontreUnique()
    let critereMenu = CritereMenu()
    let critereRencontreImpossible = CritereRencontreImpossible()

    // Initialise une nouvelle solution avec un set de binômes
    init(binomes : Set<Binome>) {
        self.binomes = binomes
    }
    
    // Renvoie le nombre total de conflits de la solution en tenant compte de tous les critères
    func nombreTotalDeConflits() -> Int {
        var nombreTotalDeConflits = 0
        nombreTotalDeConflits += critereRencontreUnique.nombreTotalDeConflits(self)
        nombreTotalDeConflits += critereMenu.nombreTotalDeConflits(self)
        // nombreTotalDeConflits += critereRencontreImpossible.nombreTotalDeConflits(self)
        return nombreTotalDeConflits
    }
    
    // Renvoie la liste des binômes rencontrés pour un binôme donné
    func binomesRencontres(binome: Binome) -> Set<Binome> {
        var binomesRencontres = Set<Binome>()
        for soiree in soirees {
            if let diner: Diner = soiree.chercheDiner(binome) {
                for binomeDiner in diner.binomes {
                    if binome != binomeDiner {
                        binomesRencontres.insert(binomeDiner)
                    }
                }
            }
        }
        return binomesRencontres
    }
    
    // Renvoie la liste des rencontres
    func rencontres() -> Set<Set<Binome>> {
        var rencontres = Set<Set<Binome>>()
        for soiree in soirees {
            for diner in soiree.diners {
                rencontres = rencontres.union(diner.rencontres())
            }
        }
        return rencontres
    }
    
    var description : String {
        get {
            var description = String()
            for soiree in soirees {
                description += soiree.description
                description += "\n"
            }
            return description
        }
    }
}