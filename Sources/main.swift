import Kitura
import HeliumLogger
import KituraStencil

import Foundation
import SwiftRedis

// Initialize HeliumLogger
HeliumLogger.use()

let redis = Redis()
redis.connect(host: "localhost", port: 6379) { (redisError: NSError?) in
    if let error = redisError {
        print(error)
    }
    else {
        print("Connected to Redis.")
    }
}

// Create a new router
let router = Router()
router.add(templateEngine: StencilTemplateEngine())
router.setDefault(templateEngine: StencilTemplateEngine())

// Handle HTTP GET requests to /
router.get("/") { request, response, next in
    defer {
        next()
    }
    var context = [
        "auth": [
            "name":"Kil Hyungdoo"
        ]
    ]

    try response.render("main", context: context).end()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
