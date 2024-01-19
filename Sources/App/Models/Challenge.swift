//
//  Challenge.swift
//
//
//  Created by Tim Wang on 19/1/2024.
//

import Vapor

struct Challenge: Content {
    let challenge: Data
}

extension Challenge {
    init(user: User) {
        let challenge = (user.name + UUID().uuidString).data(using: .utf8) ?? Data()
        self.init(challenge: challenge)
    }
}
