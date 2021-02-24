//
//  Practice.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/23/21.
//

import Foundation


struct Student {
    /// The name of the student.
    let name: String
    /// The list of all grades for the student.
    let grades: [Float]
    /// The current grade point average of the student.
    
    var gpa: Float? {
        guard !grades.isEmpty else { return nil }
        return grades.reduce(0, +) / Float(grades.count)
    }
}

struct School {
    let students: [Student]
    
    var topStudents: [Student] { students(withGPALimit: 4.0) }
}

private extension School {
    func students(withGPALimit GPA: Float) -> [Student] {
        students.filter {
            guard let studentGPA = $0.gpa else { return false }
            return studentGPA >= GPA
        }
    }
}

