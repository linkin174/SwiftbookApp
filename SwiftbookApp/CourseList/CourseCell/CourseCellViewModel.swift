//
//  CourseCellViewModel.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 04.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseCellViewModelProtocol {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
    var courseName: String { get }
    var imageData: Data? { get }
    init(course: Course, imageManager: ImageManagerProtocol)
}

protocol CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] { get }
    var numberOfRows: Int { get }
}

final class CourseCellViewModel: CourseCellViewModelProtocol {
    var cellIdentifier: String {
        "CourseCell"
    }

    var cellHeight: Double = 100

    var courseName: String {
        course.name
    }

    var imageData: Data? {
        imageManager.fetchImageData(from: course.imageUrl)
    }

    private let course: Course
    private let imageManager: ImageManagerProtocol

    required init(course: Course, imageManager: ImageManagerProtocol) {
        self.course = course
        self.imageManager = imageManager
    }
}

final class CourseSectionViewModel: CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] = []
    var numberOfRows: Int {
        rows.count
    }
}
