//
//  HVACWORKSTests.swift
//  HVACWORKSTests
//
//  Created by Sergio Bost on 2/23/21.
//

import XCTest
@testable import HVACWORKS


class FormulaTests: XCTestCase {
    func testFanLaw1() {
        let vm = FanLawViewModel()
        let firstVar = "1000"
        let secondVar = "675"
        let thirdVar = "10000"
        let answer  = "6750"
        XCTAssertEqual(vm.calculateFanLaw1(firstEntry: firstVar, secondEntry: secondVar, rpm: thirdVar), answer)
    }
    
    func testFanwLaw2() {
        let vm = FanLawViewModel()
        let firstVar = "1.5"
        let secondVar = "2.8"
        let thirdVar = "14500"
        let answer = "19,810.771"
        XCTAssertEqual(vm.calculateFanLaw2(firstEntry: firstVar, secondEntry: secondVar, thirdEntry: thirdVar, fromCFMtoSP: false), answer)
    }
    
    func testMixedAirTemperature() {
        // Needs calculation func abstracted from the view.
    }
}
