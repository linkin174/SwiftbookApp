//
//  CourseDetailsInteractor.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CourseDetailsViewInteractorInput {
    init(presenter: CourseDetailsViewInteractorOutput, course: Course,
         imageManager: ImageManagerProtocol, dataManager: DataManagerProtocol)
    var isFavorite: Bool { get }
    func provideData()
    func toggleFavorite()
}

protocol CourseDetailsViewInteractorOutput: AnyObject {
    func recieve(_ viewData: DetailsData)
    func recieveFavorite(_ status: Bool)
}

final class CourseDetailsViewInteractor: CourseDetailsViewInteractorInput {
    var isFavorite: Bool {
        get {
            dataManager.getFavoriteStatus(for: course.name)
        } set {
            dataManager.setFavoriteStatus(for: course.name, with: newValue)
        }
    }
    
    private let course: Course
    private let imageManager: ImageManagerProtocol
    private let dataManager: DataManagerProtocol
    private unowned let presenter: CourseDetailsViewInteractorOutput
    
    required init(presenter: CourseDetailsViewInteractorOutput, course: Course,
                  imageManager: ImageManagerProtocol, dataManager: DataManagerProtocol) {
        self.presenter = presenter
        self.course = course
        self.imageManager = imageManager
        self.dataManager = dataManager
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
        presenter.recieveFavorite(isFavorite)
    }
    
    func provideData() {
        let data = imageManager.fetchImageData(from: course.imageUrl)
        let viewData = DetailsData(
            imageData: data,
            courseName: course.name,
            numberOfLessons: course.numberOfLessons,
            numberOfTests: course.numberOfTests,
            isFavorite: isFavorite
        )
        presenter.recieve(viewData)
    }
}
