//
//  CourseListTests.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 08.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import SwiftbookApp

final class ListMockPresenter: CourseListViewOutput, CourseListInteractorOutput {
    
    var dataToRecieve: ListDataStore?
    
    init(view: CourseListViewInput) {
        
    }
    
    func viewIsLoaded() {
        
    }
    
    func didSelectedRow(at indexPath: IndexPath) {
        
    }
    
    func recieve(_ dataStore: ListDataStore) {
        dataToRecieve = dataStore
    }
}

final class ListMockInteractor: CourseListInteractorInput {
    
    var presenter: CourseListInteractorOutput!
    var networkManager: NetworkManagerProtocol!
    var isFetcing: Bool?
    
    init(presenter: CourseListInteractorOutput, networkManager: NetworkManagerProtocol) {
        self.presenter = presenter
        self.networkManager = networkManager
    }
    
    func fetchCourses() {
        let course = Course(name: "Foo",
                                         imageUrl: URL(string: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg")!,
                                         numberOfLessons: 10,
                                         numberOfTests: 10)
        let dataStore = ListDataStore(courses: [course])
        isFetcing = true
        presenter.recieve(dataStore)
    }
}

class CourseListTests: XCTestCase {

    var sut: CourseListViewController!
    var preseneter = ListMockPresenter(view: CourseListViewController())
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "List") as CourseListViewController
        sut.presenter = preseneter
        sut.loadView()
        sut.viewDidLoad()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
//    func testViewControllerReloadsDataForSection() {
//        let viewModel = CourseSectionViewModel()
//        sut.reloadData(for: viewModel)
//        XCTAssertFalse(sut.activityIndicator?.isAnimating == false, "View reloaded data with given viewModel")
//    }
}
