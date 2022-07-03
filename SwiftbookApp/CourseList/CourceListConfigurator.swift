//
//  CourceListConfigurator.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListConfiguratorInput {
    func configure(with viewController: CourseListViewController)
}

final class CourseListConfigurator: CourseListConfiguratorInput {
    func configure(with viewController: CourseListViewController) {
        let router = CourseListRouter(viewController: viewController)
        let presenter = CourseListPresenter(view: viewController)
        let networkManager: NetworkManagerProtocol = NetworkManager()
        let interactor = CourseListInteractor(presenter: presenter, networkManager: networkManager)
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
    }
}
