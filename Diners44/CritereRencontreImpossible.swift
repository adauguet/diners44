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
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [37, 35, 19]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [24, 22, 21, 27]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [2, 15, 29]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [12, 1, 36]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [23, 11]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [8, 4, 6]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [20, 34]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [16, 9, 14]).rencontres())
//
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [35, 22, 2]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [37, 20, 4]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [36, 27, 16, 8]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [21, 14]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [34, 15, 23, 24]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [11, 29, 9, 1]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [6, 12]).rencontres())
//
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [27, 34, 1]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [4, 16, 15]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [8, 21, 9]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [6, 11, 37, 22]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [29, 24, 14, 35]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [19, 23, 2, 12]).rencontres())
//
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [35, 23]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [22, 12, 16]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [1, 19, 8, 20]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [9, 2, 6, 36]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [15, 27, 37]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [29, 21]).rencontres())
//        self.duosImpossibles = self.duosImpossibles.union(Diner(numeros: [14, 4, 11, 34]).rencontres())
        
        // Edition 2017-2018
        let edition20172018 = [
            [14, 41, 23],
            [54, 7, 39, 48],
            [27, 52],
            [40, 32, 17],
            [34, 44, 25],
            [47, 31, 42],
            [3, 49, 48],
            [57, 18, 36],
            [6, 22, 53, 37],
            [51, 26],
            
            [42, 27, 57, 54],
            [15, 41, 34],
            [25, 26, 47],
            [39, 17, 6, 3],
            [53, 48, 18],
            [44, 32],
            [37, 14, 51, 31],
            [23, 22],
            [49, 52, 7],
            [40, 36],
            
            [25, 15, 32],
            [22, 54],
            [7, 37, 17],
            [48, 44],
            [26, 36, 52, 41],
            [34, 47, 6],
            [48, 14, 57],
            [53, 42, 49],
            [23, 3, 51],
            [31, 40],
            [27, 18, 39],
            
            [52, 54, 34],
            [41, 51, 40, 22],
            [15, 31, 26],
            [32, 48, 37, 27],
            [36, 48, 42],
            [17, 49, 25, 23],
            [57, 53],
            [18, 47, 3],
            [44, 39],
            [6, 14],
            ]
        self.duosImpossibles = edition20172018
            .map(Diner.init)
            .map({ $0.rencontres() })
            .flatMap({ $0 })
            .apply(Set.init)
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

extension Array {
    func apply<T>(_ block: ([Element]) -> T) -> T {
        return block(self)
    }
}
