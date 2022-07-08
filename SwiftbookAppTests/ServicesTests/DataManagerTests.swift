//
//  DataManagerTests.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 04.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import SwiftbookApp

class DataManagerTests: XCTestCase {
    var sut: DataManagerProtocol!

    override func setUp() {
        super.setUp()
        sut = DataManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDataManagerReturnsStatusForValidCourseName() {
        let courseName = "Our first iOS apps"
        let status = sut.getFavoriteStatus(for: courseName)
        
        XCTAssert(status == true || status == false, "Data manager failed to load favorite status")
    }
    
    
    func testDataManagerSavedFavoriteStatusForCourseName() {
        let courseName = "Our first iOS apps"
        sut.setFavoriteStatus(for: courseName, with: true)
        let status = sut.getFavoriteStatus(for: courseName)
        
        XCTAssert(status == true, "Manager failed to save status")
    }
}
