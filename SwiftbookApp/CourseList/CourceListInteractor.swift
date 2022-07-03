//
//  CourceListInteractor.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListInteractorInput {
    init(presenter: CourseListInteractorOutput, networkManager: NetworkManagerProtocol)
    func fetchCourses()
}

protocol CourseListInteractorOutput: AnyObject {
    func recieve(_ dataStore: ListDataStore)
}

final class CourseListInteractor: CourseListInteractorInput {
    private unowned let presenter: CourseListInteractorOutput
    private let networkManager: NetworkManagerProtocol
    
    required init(presenter: CourseListInteractorOutput, networkManager: NetworkManagerProtocol) {
        self.presenter = presenter
        self.networkManager = networkManager
    }
    
    func fetchCourses() {
        networkManager.fetchData { [unowned self] courses in
            let dataStore = ListDataStore(courses: courses)
            presenter.recieve(dataStore)
        }
    }
}
