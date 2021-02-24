import UIKit

var greeting = "Hello, playground"

class Person {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Kid: Person {
    let favoriteToy: String
    init(favoriteToy: String, firstName: String, lastName: String) {
        self.favoriteToy = favoriteToy
        
        super.init(firstName: firstName, lastName: lastName)
    }
}
