//
//  NetworkManagerTests.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 04.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import SwiftbookApp

class NetworkManagerTests: XCTestCase {
    var sut: NetworkManagerProtocol!

    override func setUp() {
        super.setUp()
        sut = NetworkManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchDataReturnsDataWithin5Seconds() {
        var dataToAssert: [Course] = []
        let dataIsLoaded = expectation(description: "Data is loaded")
        self.sut.fetchData { courses in
            dataToAssert = courses
            if !dataToAssert.isEmpty {
                dataIsLoaded.fulfill()
            }
        }
        waitForExpectations(timeout: 5) { error in
            XCTAssert(!dataToAssert.isEmpty)
        }
    }
    
    func testFetchDataDecodesDataToCoursesWithin5Seconds() {
        var dataToAssert: [Course] = []
        let dataContainsCourses = expectation(description: "Data is loaded")
        self.sut.fetchData { courses in
            dataToAssert = courses
            if dataToAssert == courses as [Course] {
                dataContainsCourses.fulfill()
            }
        }
        waitForExpectations(timeout: 5) { error in
            XCTAssert(!dataToAssert.isEmpty, "Fetch returned wrong model data")
        }
    }
}
