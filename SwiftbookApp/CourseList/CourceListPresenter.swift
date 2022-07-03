//
//  CourceListPresenter.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation


struct ListDataStore {
    var courses: [Course]
}

final class CourseListPresenter: CourseListViewOutput, CourseListInteractorOutput {
    var router: CourseListRouterInput!
    var interactor: CourseListInteractorInput!
    private var dataStore: ListDataStore?
    private unowned let view: CourseListViewInput
    
    required init(view: CourseListViewInput) {
        self.view = view
    }
    
    func recieve(_ dataStore: ListDataStore) {
        self.dataStore = dataStore
        let section = CourseSectionViewModel()
        dataStore.courses.forEach { section.rows.append(CourseCellViewModel(course: $0, imageManager: ImageManager())) }
        view.reloadData(for: section)
    }
    
    func didSelectedRow(at indexPath: IndexPath) {
        guard let course = dataStore?.courses[indexPath.row] else { return }
        router.goToDetailsView(with: course)
    }
    
    func viewIsLoaded() {
        interactor.fetchCourses()
    }
}
