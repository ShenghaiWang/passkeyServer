import Vapor
import NIOSSL

public func configure(_ app: Application) async throws {
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.http.server.configuration.hostname = "passkey.timwang.au"
    app.http.server.configuration.port = 443
    app.http.server.configuration.tlsConfiguration = .makeServerConfiguration(
        certificateChain: try NIOSSLCertificate.fromPEMFile("./cert.pem").map { .certificate($0) },
        privateKey: .file("./privatekey.pem")
    )
    try routes(app)
}
