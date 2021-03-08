//
//  UIApplication + Extension.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 3/8/21.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
