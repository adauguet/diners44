//
//  CritereRencontreImpossible.swift
//  Diners44
//
//  Created by Claire DAUGUET on 10/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

class CritereRencontreImpossible {
    
    var duosImpossibles = Set<Set<Binome>>()
    
    init() {
        
        // Edition 2014-2015
        self.duosImpossibles.insert([Binome(numero: 3), Binome(numero: 6)])
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [6, 23, 34]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [1, 5, 14]).rencontres())
        self.duosImpossibles.insert([Binome(numero: 27), Binome(numero: 26)])
        self.duosImpossibles.insert([Binome(numero: 11), Binome(numero: 20)])
        self.duosImpossibles.insert([Binome(numero: 31), Binome(numero: 18)])
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [12, 30, 29]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [13, 9, 22]).rencontres())
        self.duosImpossibles.insert([Binome(numero: 19), Binome(numero: 28)])
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [17, 24, 2, 7]).rencontres())
        self.duosImpossibles.insert([Binome(numero: 8), Binome(numero: 4)])
        
        self.duosImpossibles.insert([Binome(numero: 20), Binome(numero: 23)])
        self.duosImpossibles.insert([Binome(numero: 18), Binome(numero: 1)])
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [29, 27, 11]).rencontres())
        self.duosImpossibles.insert([Binome(numero: 31), Binome(numero: 30)])
        self.duosImpossibles.insert([Binome(numero: 12), Binome(numero: 22)])
        self.duosImpossibles.insert([Binome(numero: 9), Binome(numero: 7)])
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [4, 13, 28, 2]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [6, 19, 24, 8]).rencontres())
        self.duosImpossibles.insert([Binome(numero: 14), Binome(numero: 17)])
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [26, 34, 5]).rencontres())

        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [26, 23, 12]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [30, 20, 1, 9]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [22, 18, 27, 28]).rencontres())
        self.duosImpossibles.insert([Binome(numero: 29), Binome(numero: 24)])
        self.duosImpossibles.insert([Binome(numero: 8), Binome(numero: 34)])
        self.duosImpossibles.insert([Binome(numero: 7), Binome(numero: 13)])
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [5, 4, 19]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [6, 17, 11]).rencontres())
        self.duosImpossibles.insert([Binome(numero: 14), Binome(numero: 31)])
        
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [11, 30, 14, 23]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [31, 22, 26, 1]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [12, 20, 27]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [9, 2, 18]).rencontres())
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [28, 8, 29]).rencontres())
        self.duosImpossibles.insert([Binome(numero: 5), Binome(numero: 13)])
        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [34, 7, 19]).rencontres())
        self.duosImpossibles.insert([Binome(numero: 4), Binome(numero: 17)])

    }
    
    // Renvoie le nombre total rencontres impossibles
    func nombreTotalDeConflits(_ solution: Solution) -> Int {
        
        var nombreTotalDeConflits = 0
        for soiree in solution.soirees {
            for diner in soiree.diners {
                var binomesDiner = Set<Binome>()
                for binome in diner.binomes {
                    binomesDiner.insert(binome)
                }
                for duo in duosImpossibles {
                    if (duo.isSubset(of: binomesDiner)) {
                        nombreTotalDeConflits += 1
                    }
                }
            }
        }
        return nombreTotalDeConflits
    }
}
