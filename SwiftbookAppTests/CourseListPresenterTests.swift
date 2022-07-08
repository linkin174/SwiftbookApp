//
//  CourseListPresenterTests.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 08.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import SwiftbookApp


class CourseListPresenterTests: XCTestCase {
    
    var sut: CourseListPresenter!
    let view = ListMockViewController()
    let interactor = ListMockInteractor(presenter: CourseListPresenter(view: ListMockViewController()), networkManager: NetworkManager())
    override func setUp() {
        super.setUp()
        sut = .init(view: view)
        sut.interactor = interactor
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testPresenterCallsInteractorToFetchCoursesOnRecieveViewLoadCall() {
        sut.viewIsLoaded()
        XCTAssert(interactor.isFetcing == true, "Presenter failed to call interactor on view load call")
    }
}
