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


class CourseDetailsPresenter: CourseDetailsViewOutput, CourseDetailsViewInteractorOutput {
    

    var interactor: CourseDetailsViewInteractorInput!
    
    unowned private let view: CourseDetailsViewInput
    required init(view: CourseDetailsViewInput) {
        self.view = view
    }
    
    //MARK: View Out
    func viewLoaded() {
        interactor.provideData()
    }
    
    func favoriteButtonPressed() {
        interactor.toggleFavorite()
    }
    
    //MARK: Interactor Out
    func recieve(_ viewData: DetailsData) {
        let numberOfLessonsText = String(viewData.numberOfLessons)
        let numberOfTestsText = String(viewData.numberOfTests)
        view.setCourseName(viewData.courseName)
        view.setNumberOfLessons(numberOfLessonsText)
        view.setNumberOfTests(numberOfTestsText)
        guard let data = viewData.imageData else { return }
        view.setImage(from: data)
        view.setImageTintDepedingOn(viewData.isFavorite)
    }
    
    func recieveFavorite(_ status: Bool) {
        view.setImageTintDepedingOn(status)
    }
}
