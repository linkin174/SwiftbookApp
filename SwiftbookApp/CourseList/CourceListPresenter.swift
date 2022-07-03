//
//  CourceListPresenter.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

struct RowData {
    let imageData: Data
    let courseName: String
    let numberOfLessons: String
    let numberOfTests: String
}

struct ListDataStore {
    var courses: [Course]
}

final class CourseListPresenter: CourseListViewOutput, CourseListInteractorOutput {

    func recieve(_ dataStore: ListDataStore) {
        self.dataStore = dataStore
        let section = CourseSectionViewModel()
        dataStore.courses.forEach { section.rows.append(CourseCellViewModel(course: $0, imageManager: ImageManager())) }
        view.reloadData(for: section)
    }
    
    
    private var dataStore: ListDataStore?
    
    func didSelectedRow(at indexPath: IndexPath) {
        guard let course = dataStore?.courses[indexPath.row] else { return }
        router.goToDetailsView(with: course)
    }
    
    func viewIsLoaded() {
        interactor.fetchCourses()
    }
    

    private unowned let view: CourseListViewInput
    var router: CourseListRouterInput!
    var interactor: CourseListInteractorInput!
    
    required init(view: CourseListViewInput) {
        self.view = view
    }
    
}
