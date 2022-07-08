//
//  CourseDetailsConfigurator.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseDetailsConfiguratorInput {
    func configure(with viewController: CourseDetailsViewController, _ course: Course)
}

class CourseDetailsViewConfigurator: CourseDetailsConfiguratorInput {
    func configure(with viewController: CourseDetailsViewController, _ course: Course) {
        let presenter = CourseDetailsPresenter(view: viewController)
        let imageManager: ImageManagerProtocol = ImageManager()
        let dataManager: DataManagerProtocol = DataManager()
        let interactor = CourseDetailsViewInteractor(
            presenter: presenter,
            course: course,
            imageManager: imageManager,
            dataManager: dataManager
        )
        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
