//
//  Chapters.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/25/21.
//

import Foundation

///Used to display available categories on the root view.
///* content - Populates a scroll view showing sub categories
struct Chapter: Identifiable {
    let id = UUID()
    let name: String
    let content: [String]
    let thumbnail: String
    let category: ChapterCategories
    let inCurrentVersion: Bool
    
    static let allChapters = [
        Chapter(name: "Air Formulas", content: ["Latent Heat", "Sensible Heat", "Total Heat", "Mixed Air"], thumbnail: "", category: .air, inCurrentVersion: true),
        Chapter(name: "Fan Laws", content: ["Fan Law #1", "Fan Law #2"], thumbnail: "", category: .fanLaws, inCurrentVersion: true),
        Chapter(name: "Electricity", content: ["Ohms law", "Voltage", "Current", "Resistance", "Power", "Capacitance", "Inductance"], thumbnail: "", category: .elec, inCurrentVersion: false),
        Chapter(name: "Refrigerant", content: ["Every PT Chart", "More to come"], thumbnail: "", category: .refrigerantFormulas, inCurrentVersion: false)
    ]
    
     enum ChapterCategories: String {
        case air = "Air"
        case elec = "Electricity"
        case fanLaws = "Fan Laws"
        case refrigerantFormulas = "Refrigerant Formulas"
    }
}
