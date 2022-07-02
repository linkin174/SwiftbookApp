//
//  CourceListInteractor.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation
import UIKit

protocol CourseListInteractorInput {
    init(presenter: CourseListInteractorOutput)
    func provideRowData()
    
}

protocol CourseListInteractorOutput: AnyObject {
    func recieveRowData(_ rowData: [RowData])
}

class CourseListInteractor: CourseListInteractorInput {
    
    unowned private let presenter: CourseListInteractorOutput
    required init(presenter: CourseListInteractorOutput) {
        self.presenter = presenter
    }
    
    func provideRowData() {
       NetworkManager.shared.fetchData(completion: { courses in
          let  rowsData = courses.map { course in
               RowData(imageURL: course.imageUrl,
                       courseName: course.name,
                       numberOfLessons: String(course.numberOfLessons),
                       numberOfTests: String(course.numberOfTests))
           }
           self.presenter.recieveRowData(rowsData)
        })
    }
}
