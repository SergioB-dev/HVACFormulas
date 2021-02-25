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
        let answer: Double = 6750
        XCTAssertEqual(vm.calculateFanLaw1(firstEntry: firstVar, secondEntry: secondVar, rpm: thirdVar), answer, accuracy: 1)
    }
}


class StudentTest: XCTestCase {
    
    /// There should be no GPA for students with no grades
    func testGPAWithNoGrades() {
        let student = Student(name: "test", grades: [])
        XCTAssertNil(student.gpa)
    }
    
    func testSoloGradeEqualsGPA() {
        let student = Student(name: "Billy", grades: [4])
        XCTAssertEqual(student.gpa, 4)
    }
    
    func testGPAWith10Grades() {
        let student = Student(name: "10Grades", grades: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        XCTAssertEqual(student.gpa, 5.5)
    }///
}


class SchoolTest: XCTestCase {
        private let student1 = Student(name: "#1", grades: [2.0, 3.5, 4.0])
       private let student2 = Student(name: "#2", grades: [4.0, 4.0, 4.0])
       private let student3 = Student(name: "#3", grades: [1.0, 1.5])
       private let student4 = Student(name: "#4", grades: [])
       private let student5 = Student(name: "#5", grades: [4.0, 4.0, 4.0])
    
    func testTopStudentsWithNoStudents() {
        let school = School(students: [])
        XCTAssertTrue(school.topStudents.isEmpty)
    }
}



// The calculation should work for students with only one grade
// The calculation should work for students with many grades
