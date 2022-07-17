//
//  CourseListConfigurator.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 17.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

final class CourseListConfigurator {
    static let shared = CourseListConfigurator()
    
    private init() {}
    
    func configure(with viewController: CoursesListViewController) {
        let interactor = CoursesListInteractor(networkManager: NetworkManager())
        let presenter = CoursesListPresenter()
        let router = CoursesListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
