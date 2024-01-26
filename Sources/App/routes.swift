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

    app.get(".well-known", "assetlinks.json") { req -> Response in
        let responseString =
            """
            [{
                "relation" : [
                    "delegate_permission/common.handle_all_urls",
                    "delegate_permission/common.get_login_creds"
                ],
                "target" : {
                    "namespace" : "android_app",
                    "package_name" : "com.timwang.PasskeyAppAndroidDemo",
                    "sha256_cert_fingerprints" : [
                        "26:98:BB:58:51:1D:63:5D:AC:B0:61:E9:A6:9C:E1:84:1B:19:2D:1F:67:4C:4E:97:26:9B:6C:3F:DC:FA:4B:B4"
                    ]
                }
            }]
            """
        let response = try await responseString.encodeResponse(for: req)
        response.headers.contentType = HTTPMediaType(type: "application", subType: "json")
        return response
    }
}
