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
    func doSomething(request: CourseDetails.ShowCourseDetails.Request)
    func changeIsFavoriteStatus(requset: CourseDetails.FavoriteButtonToggle.Request)
}

protocol CourseDetailsDataStore {
    
}

struct DataStore {
    let name: String
    let numberOfLessons: Int
    let numberOfTests: Int
}

class CourseDetailsInteractor: CourseDetailsBusinessLogic, CourseDetailsDataStore {
    
    func changeIsFavoriteStatus(requset: CourseDetails.FavoriteButtonToggle.Request) {
        let currentStatus = DataManager.shared.getFavoriteStatus(for: requset.courseName)
        let newStatus = !currentStatus
        let response = CourseDetails.FavoriteButtonToggle.Response(isFavorite: newStatus)
        DataManager.shared.setFavoriteStatus(for: requset.courseName, with: newStatus)
        presenter?.changeIsFavoriteStatus(response: response)
    }

    var presenter: CourseDetailsPresentationLogic?
    var worker: CourseDetailsWorker?
    
    func doSomething(request: CourseDetails.ShowCourseDetails.Request) {
//        worker = CourseDetailsWorker()
//        worker?.doSomeWork()
        let imageData = ImageManager.shared.fetchImageData(from: request.course.imageUrl)
        let isFavorite = DataManager.shared.getFavoriteStatus(for: request.course.name)
        let response = CourseDetails.ShowCourseDetails.Response(courseName: request.course.name,
                                                                numberOfLessons: request.course.numberOfLessons,
                                                                numberOfTests: request.course.numberOfTests,
                                                                imageData: imageData,
                                                                isFavorite: isFavorite)
        presenter?.presentSomething(response: response)
    }
}
