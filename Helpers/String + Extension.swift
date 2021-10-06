//
//  String + Extension.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/6/21.
//

import Foundation
extension String {
        func formInitials() -> String {
        return self
            .components(separatedBy: " ")
            .map{String($0[$0.startIndex].uppercased())}
            .joined(separator:"")
        }
}
