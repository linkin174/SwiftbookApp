//
//  CourseDetailsInteractor.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CourseDetailsViewInteractorInput {
    init(presenter: CourseDetailsViewInteractorOutput)
    func provideViewData(from course: Course)
}

protocol CourseDetailsViewInteractorOutput: AnyObject {
    func recieveViewData(_ rowData: RowData)
}

class CourseDetailsViewInteractor: CourseDetailsViewInteractorInput {
    private unowned let presenter: CourseDetailsViewInteractorOutput
    required init(presenter: CourseDetailsViewInteractorOutput) {
        self.presenter = presenter
    }
    
    func provideViewData(from course: Course) {
        let viewData = RowData(imageURL: course.imageUrl,
                               courseName: course.name,
                               numberOfLessons: String(course.numberOfLessons),
                               numberOfTests: String(course.numberOfTests))
        presenter.recieveViewData(viewData)
    }

}
