//
//  SuperheatViewModel.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 5/6/21.
//

import SwiftUI

final class SuperHeatManager: ObservableObject {
    @Published var userSummonedAnswer = false
    @Published var targetSuperheat = 0.0
    
    func findTargetSuperHeat(outdoor drybulb: Double, indoor wetbulb: Double) {
        
      targetSuperheat = ((wetbulb * 3) - 90 - drybulb) / 2
    }
}
