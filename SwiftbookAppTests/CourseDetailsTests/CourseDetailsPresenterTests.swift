//
//  CourseDetailsPresenterTests.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 07.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import SwiftbookApp


class CourseDetailsPresenterTests: XCTestCase {
    
    var sut: CourseDetailsPresenter!
    let view = MockViewController()
    var viewData: DetailsData?
    let interactor = MockInteractor(
        presenter: CourseDetailsPresenter(view: MockViewController()),
        course: Course(name: "Foo",
                       imageUrl: URL(string: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg")!,
                        numberOfLessons: 10,
                        numberOfTests: 10),
        imageManager: ImageManager(),
        dataManager: DataManager())
    
    override func setUp() {
        super.setUp()
        sut = .init(view: view)
        sut.interactor = interactor
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testPresenterRequestsInteractorToProvideDataOnRecieveViewLoaded() {
        sut.viewLoaded()
        XCTAssert(interactor.provideDataIsRequested == true, "Presenter not requesting data from interactor")
    }
    
    func testPresenterRequestsInteractorOnFavoriteButtonPressed() {
        sut.favoriteButtonPressed()
        XCTAssert(interactor.toggleFavoriteRequested == true, "Presenter not requesting favorite toggle action")
    }
    
    func testPresenterCanRecieveViewDataFromInteractor() {
        interactor.provideData()
        let detailsData = DetailsData(imageData: Data(), courseName: "Foo", numberOfLessons: 10, numberOfTests: 10, isFavorite: false)
        sut.recieve(detailsData)
    }
    
    func testPresenterCanRecieveIsFavoriteStatus() {
        sut.recieveFavorite(true)
        
        XCTAssert(view.testTint == .red, "Presenter failed to recieve favorite status")
    }
}
