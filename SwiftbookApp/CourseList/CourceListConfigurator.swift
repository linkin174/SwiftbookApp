//
//  CourceListConfigurator.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListConfiguratorInput {
    func configure(with view: CourseListViewController)
}

class CourseListConfigurator: CourseListConfiguratorInput {
    func configure(with view: CourseListViewController) {
        let router = CourseListRouter(viewController: view)
        let presenter = CourseListPresenter(view: view)
        let interactor = CourseListInteractor(presenter: presenter, networkManager: NetworkManager())
        presenter.interactor = interactor
        presenter.router = router
        view.presenter = presenter
    }
    

    
    
    //    func configure(with view: CourseListViewController, ) {
//        let router = CourseListRouter(view: <#T##UIViewController#>)
//        let presenter = CourseListPresenter(view: view, router: router)
//        let interactor = CourseListInteractor(presenter: presenter)
//        view.presenter = presenter
//        presenter.interactor = interactor
//    }
}
