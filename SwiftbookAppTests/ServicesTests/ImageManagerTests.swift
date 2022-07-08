//
//  ImageManagerTests.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 04.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import SwiftbookApp

class ImageManagerTests: XCTestCase {
    
    var sut: ImageManagerProtocol!

    override func setUp() {
        super.setUp()
        sut = ImageManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testImageManagerReturnsDataFromValidURL() {
        guard let url = URL(string: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg") else { return }
        let imageData = sut.fetchImageData(from: url)
        
        XCTAssert(imageData != nil, "Manager returned imageData")
    }
    
    func testImageManagerReturnsNilFromInvalidURL() {
        guard let url = URL(string: "https://swiftbook.ru/wp") else { return }
        let imageData = sut.fetchImageData(from: url)
        
        XCTAssert(imageData == nil, "Manager returned nil")
    }
}
