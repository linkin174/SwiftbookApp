//
//  CourseDetailsViewControllerTests.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 07.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import SwiftbookApp

class CourseDetailsViewControllerTests: XCTestCase {

    var sut: CourseDetailsViewController!
    var presenter = MockPresenter(view: CourseDetailsViewController())
    
    
    //MARK: Prepearing
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "Details") as CourseDetailsViewController
        sut.presenter = presenter
        sut.loadView()
        sut.viewDidLoad()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    //MARK: Testing
    
    func testViewControllerInitializesCourseNameLabelText() {
        let name = "Foo"
        sut.setCourseName(name)
        
        XCTAssert(sut.courseNameLabel.text == name, "View failed to set course name label text")
    }
    
    func testViewControllerInitializesNumberOfLessonsLabelText() {
        let name = "Foo"
        sut.setNumberOfLessons(name)
        
        XCTAssert(sut.numberOfLessonsLabel.text == name, "View failed to initialize label.text with \(name)")
    }
    
    func testViewControllerInitializesNumberOfTestsLabelText() {
        let name = "Foo"
        sut.setNumberOfTests(name)
        
        XCTAssert(sut.numberOfTestsLabel.text == name, "View failed to initialize label.text with \(name)")
    }
    
    func testViewControllerInitializesUIImageWithProvidedImageData() {
        let imageService = ImageManager()
        var imageData: Data?
        if let url = URL(string: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg") {
            imageData = imageService.fetchImageData(from: url)
        }
        if let imageData = imageData {
            sut.setImage(from: imageData)
        }
        
        XCTAssertNotNil(sut.courseImage, "View failed to initialize image with provided image data")
    }
    
    func testViewControllerSetsFavoriteButtonTintDependingOnFavoriteState() {
        let status = true
        sut.setImageTintDepedingOn(status)
        XCTAssertTrue(sut.favoriteButton.tintColor == .red, "View failed to set button tint depending on favorite state")
    }
    
    func testViewControllerAsksPresenterToChangeStateOnFavoriteButtonPressed() {
        sut.toggleFavorite(UIButton())
        
        XCTAssertTrue(presenter.isFavoriteButtonPressed == true, "View failed to toggle favorite state")
    }
}
