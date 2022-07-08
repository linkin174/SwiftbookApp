//
//  MockInteractor.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 07.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation
@testable import SwiftbookApp

final class MockInteractor: CourseDetailsViewInteractorInput {
    
    var provideDataIsRequested: Bool?
    var toggleFavoriteRequested: Bool?
    
    let presenter: CourseDetailsViewInteractorOutput!
    let course: Course!
    let imageManager: ImageManagerProtocol!
    let dataManager: DataManagerProtocol!
    
    init(presenter: CourseDetailsViewInteractorOutput, course: Course, imageManager: ImageManagerProtocol, dataManager: DataManagerProtocol) {
        self.presenter = presenter
        self.course = course
        self.imageManager = imageManager
        self.dataManager = dataManager
    }
    
    var isFavorite = false
    
    func provideData() {
        provideDataIsRequested = true
    }
    
    func toggleFavorite() {
        toggleFavoriteRequested = true
    }
}
