//
//  CourseDetailsInteractorTests.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 07.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import SwiftbookApp

class CourseDetailsInteractorTests: XCTestCase {
    
    var sut: CourseDetailsViewInteractor!
    let presenter = MockPresenter(view: MockViewController())
    let course = Course(name: "Foo",
                        imageUrl: URL(string: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg")!,
                        numberOfLessons: 10,
                        numberOfTests: 10)
    override func setUp() {
        super.setUp()
        sut = .init(presenter: presenter, course: course, imageManager: ImageManager(), dataManager: DataManager())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInteractorCanTogglefavoriteStatus() {
        let initialStatus = sut.isFavorite
        sut.toggleFavorite()
        XCTAssert(sut.isFavorite != initialStatus, "Failed to change status")
    }
    
    func testInteractorCanPassStatusToPresenter() {
        sut.toggleFavorite()
        XCTAssert(sut.isFavorite == presenter.status, "Failed to pass status to the presenter")
    }
    
    func testInteractorCanProvideDataToPresenter() {
        sut.provideData()
        XCTAssert(presenter.data != nil, "Failed to provide data to presenter")
    }
}
