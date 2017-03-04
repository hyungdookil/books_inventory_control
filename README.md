# Build

Install Redis-Serever
```
brew install redis
redis-server
```

Clone project
```bash
git clone git@github.com:hyungdookil/books_inventory_control.git
```

Build the application
```bash
cd books_inventory_control
swift build
```

Building within Xcode
```
swift package generate-xcodeproj
```

Run the built executable
```
.build/debug/books_inventory_control
```

Now, open a browser pointing at http://localhost:8090
