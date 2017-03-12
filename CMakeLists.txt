cmake_minimum_required(VERSION 3.4)
project(books_inventory_control)
add_custom_target(books_inventory_control
        COMMAND /opt/swift/usr/bin/swift build
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES Package.swift Sources/main.swift)