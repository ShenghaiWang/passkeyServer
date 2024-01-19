import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: RegisterController())
    try app.register(collection: AuthenticateController())

    app.get(".well-known", "apple-app-site-association") { req -> Response in
        let responseString =
            """
            {
                "webcredentials": {
                    "apps": [
                        "HBBLSCM2ZS.com.timwang.PasskeyAppiOSDemo"
                    ]
                }
            }
            """
        let response = try await responseString.encodeResponse(for: req)
        response.headers.contentType = HTTPMediaType(type: "application", subType: "json")
        return response
    }
}
