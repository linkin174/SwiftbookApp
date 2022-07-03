//
//  CourceListRouter.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CourseListRouterInput: AnyObject {
    func goToDetailsView(with course: Course)
    init(viewController: UIViewController)
}

final class CourseListRouter: CourseListRouterInput {
    private unowned let viewController: UIViewController
    
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func goToDetailsView(with course: Course) {
        viewController.performSegue(withIdentifier: "ShowDetails", sender: course)
    }

}
