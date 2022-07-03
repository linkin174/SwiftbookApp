//
//  CourseDetailsPresenter.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

struct DetailsData {
    let imageData: Data?
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let isFavorite: Bool
}

final class CourseDetailsPresenter: CourseDetailsViewOutput, CourseDetailsViewInteractorOutput {
    var interactor: CourseDetailsViewInteractorInput!
    
    private unowned let view: CourseDetailsViewInput
    required init(view: CourseDetailsViewInput) {
        self.view = view
    }
    
    // MARK: View Out

    func viewLoaded() {
        interactor.provideData()
    }
    
    func favoriteButtonPressed() {
        interactor.toggleFavorite()
    }
    
    // MARK: Interactor Out

    func recieve(_ viewData: DetailsData) {
        let numberOfLessonsText = "Number of lessons: \(viewData.numberOfLessons)"
        let numberOfTestsText = "Number of tests: \(viewData.numberOfTests)"
        view.setCourseName(viewData.courseName)
        view.setNumberOfLessons(numberOfLessonsText)
        view.setNumberOfTests(numberOfTestsText)
        view.setImageTintDepedingOn(viewData.isFavorite)
        guard let data = viewData.imageData else { return }
        view.setImage(from: data)
    }
    
    func recieveFavorite(_ status: Bool) {
        view.setImageTintDepedingOn(status)
    }
}
