//
//  Authenticate.swift
//
//
//  Created by Tim Wang on 19/1/2024.
//

import Vapor

struct AuthenticateController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let authenticate = routes.grouped("authenticate")
        authenticate.post("start", use: start)
        authenticate.post("finish", use: finish)
    }
    
    func start(req: Request) async throws -> Challenge {
        Challenge(challenge: Data())
    }

    func finish(req: Request) async throws -> String {
        ""
    }
}
