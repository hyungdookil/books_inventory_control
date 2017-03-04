import Kitura
import HeliumLogger
import KituraStencil

// Initialize HeliumLogger
HeliumLogger.use()

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
