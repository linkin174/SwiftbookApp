//
//  CourceListRouter.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListRouterInput {
    init(view: CourseDetailsViewInput)
    func goToDetailsView()
    func goBack()
}

class CourseListRouter: CourseListRouterInput {
    func goToDetailsView() {
        
    }
    
    func goBack() {
        
    }
    
    unowned var view: CourseDetailsViewInput!

    required init(view: CourseDetailsViewInput) {
        self.view = view
    }
    
    
    
}
