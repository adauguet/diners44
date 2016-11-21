//
//  Soiree.swift
//  Diners44
//
//  Created by Claire DAUGUET on 04/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import Foundation

class Soiree: Hashable {
    var diners = Set<Diner>()
    var diner1, diner2: Diner?
    var index1, index2: Int?
    
    // Initialise une nouvelle soirée avec un set de binômes, en ajoutant les binômes nécessaires
    init(binomes : Set<Binome>) {
        var binomes = binomes
        diners.insert(Diner())
        repeat {
            let binome = binomes.random()
            ajouterBinome(binome)
            binomes.remove(binome)
        } while binomes.count > 0
    }
    
    // Ajoute un binôme à la soirée en créant un nouveau dîner si nécessaire
    func ajouterBinome(_ binome : Binome) {
        for diner in diners {
            if diner.binomes.count < nombreDeBinomesParDiner {
                diner.binomes.append(binome)
                return
            }
        }
        diners.insert(Diner())
        ajouterBinome(binome)
    }
    
    // Permute deux binômes choisis aléatoirement
    func permuterBinomesAleatoires() {
        repeat {
            diner1 = diners.random()
            diner2 = diners.random()
            index1 = Int(arc4random_uniform(UInt32(diner1!.binomes.count)))
            index2 = Int(arc4random_uniform(UInt32(diner2!.binomes.count)))
        } while diner1!.binomes[index1!] == diner2!.binomes[index2!]
        swap(&diner1!.binomes[index1!], &diner2!.binomes[index2!])
    }
    
    // Remet les deux binômes préalablement permutés à la place
    func remettreBinomes() {
        if let diner1 = diner1, let diner2 = diner2, let index1 = index1, let index2 = index2 {
            swap(&diner1.binomes[index1], &diner2.binomes[index2])
        }
        diner1 = nil
        diner2 = nil
        index1 = nil
        index2 = nil
    }
    
    // Renvoie le dîner d'un binôme
    func chercheDiner(_ binome: Binome) -> Diner? {
        for diner in diners {
            if diner.binomes.contains(binome) {
                return diner
            }
        }
        return nil
    }
    
    var hashValue: Int {
        return description.hashValue
    }
    
    var description : String {
        get {
            var result = String()
            for diner in diners {
                result += diner.description
                result += "\n"
            }
            return result
        }
    }
}

func ==(lhs: Soiree, rhs: Soiree) -> Bool {
    return lhs.diners == rhs.diners
}
