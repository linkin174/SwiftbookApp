//
//  CourseDetailsInteractor.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 08.07.2022.
//  Copyright (c) 2022 Alexey Efimov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol CourseDetailsBusinessLogic {
    func provideCourseDetails()
    func changeIsFavoriteStatus()
}

protocol CourseDetailsDataStore {
    var course: Course? { get set }
    var isFavorite: Bool { get }
}

class CourseDetailsInteractor: CourseDetailsBusinessLogic, CourseDetailsDataStore {
    
    var isFavorite = false
    var course: Course?
    
    var presenter: CourseDetailsPresentationLogic?
    
    private var worker = CourseDetailsWorker(imageService: ImageManager(), dataService: DataManager())
    
    func changeIsFavoriteStatus() {
        isFavorite.toggle()
        worker.setFavoriteStatus(for: course?.name ?? "Null", with: isFavorite)
        let response = CourseDetails.ChangeFavoriteStatus.Response(isFavorite: isFavorite)
        presenter?.presentFavoriteStatus(response: response)
    }
    
    func provideCourseDetails() {
        let imageData = worker.getImage(from: course?.imageUrl)
        isFavorite = worker.getFavoriteStatus(for: course?.name ?? "")
        let response = CourseDetails.ShowCourseDetails.Response(courseName: course?.name,
                                                                numberOfLessons: course?.numberOfLessons,
                                                                numberOfTests: course?.numberOfTests,
                                                                imageData: imageData,
                                                                isFavorite: isFavorite)
        presenter?.presentCourseDetails(response: response)
    }
}
