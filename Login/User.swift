//
//  Person.swift
//  Login
//
//  Created by Aleksandr on 09.10.2022.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "Aleksandr",
            password: "password",
            person: .getPerson()
        )
        
    }
}

struct Person {
    let name: String
    let surname: String
    let description: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
            Person(
                name: "Aleksandr",
                surname: "Shutkin",
                description: "Жизнерадостный парень, увлекающийся кроссфитом, программированием и мотоциклами",
                image: "ric"
            )
    }
}







