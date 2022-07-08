//
//  CourseListInteractorTests.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 08.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import SwiftbookApp

final class ListMockViewController: CourseListViewInput {
    func reloadData(for section: CourseSectionViewModel) {
        
    }
}

class CourseListInteractorTests: XCTestCase {
    
    var sut: CourseListInteractor!
    let presenter = ListMockPresenter(view: ListMockViewController())
    override func setUp() {
        super.setUp()
        sut = .init(presenter: presenter, networkManager: NetworkManager())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchCoursesReturnsListDataStoreViewModel() {
        sut.fetchCourses()
        
        XCTAssert(presenter.dataToRecieve != nil, "Interactor failed to fetch data")
    }
}
