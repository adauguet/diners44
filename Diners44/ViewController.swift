//
//  ViewController.swift
//  Diners44
//
//  Created by Claire DAUGUET on 04/11/2015.
//  Copyright © 2015 Antoine DAUGUET. All rights reserved.
//

import UIKit

let nombreDeBinomes = 36

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var binomes = Set<Binome>()
        for index in 1...nombreDeBinomes {
            binomes.insert(Binome(numero: index))
        }
        
        let solution = Solution(binomes: binomes)
        solution.soirees.append(Soiree(binomes: binomes))
        
        // Première étape d'optimisation : création des soirées
        repeat {
            solution.soirees.append(Soiree(binomes: binomes))
            
            var avant: Int
            var apres: Int
            
            repeat {
                
                // Evaluation de la solution selon les critères de renconte unique et de menu
                avant = solution.nombreTotalDeConflits()
                
                // Permutation d'un binôme aléatoire
                solution.soirees[solution.soirees.count - 1].permuterBinomesAleatoires()
                
                // Evaluation de la solution
                apres = solution.nombreTotalDeConflits()
                
                switch true {
                case apres > avant:
                    solution.soirees[solution.soirees.count - 1].remettreBinomes()
                case apres < avant:
                    print(apres)
                default:
                    break
                }
                
            } while apres > 0
            
        } while solution.soirees.count < nombreDeSoirees
        
        print(solution.description)
        
        var count = 0
        var avant = Int()
        var apres = Int()
        
        // Deuxième étape d'optimisation en fonction du critère de rencontre impossible
        repeat {
            
            avant = solution.critereRencontreImpossible.nombreTotalDeConflits(solution)
            let soiree = solution.soirees.randomElement()
            soiree.permuterBinomesAleatoires()
            apres = solution.critereRencontreImpossible.nombreTotalDeConflits(solution)
            
            if (solution.nombreTotalDeConflits() > 0) {
                soiree.remettreBinomes()
            } else if (apres > avant) {
                soiree.remettreBinomes()
            } else if (apres < avant) {
                print(apres, count)
            }
            
            count += 1
            
        } while count < 1000000 && apres > 0
        
        print(solution.description)
    }
}
