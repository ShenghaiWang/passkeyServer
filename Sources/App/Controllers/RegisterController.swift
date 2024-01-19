import Vapor

struct RegisterController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let authenticate = routes.grouped("register")
        authenticate.post("start", use: start)
        authenticate.post("finish", use: finish)
    }

    func start(req: Request) async throws -> Challenge {
        let user = try req.content.decode(User.self)
        return Challenge(user: user)
    }

    func finish(req: Request) async throws -> String {
        ""
    }
}
