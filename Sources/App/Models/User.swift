//
//  User.swift
//  
//
//  Created by Tim Wang on 19/1/2024.
//

import Vapor

struct User: Content {
    let name: String
    let id: String

    init(name: String, id: String = UUID().uuidString) {
        self.name = name
        self.id = id
    }
}
