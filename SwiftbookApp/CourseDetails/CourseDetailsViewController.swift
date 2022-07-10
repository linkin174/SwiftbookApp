//
//  CourseDetailsViewController.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 08.07.2022.
//  Copyright (c) 2022 Alexey Efimov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CourseDetailsDisplayLogic: AnyObject {
    func displayCourseDetails(viewModel: CourseDetails.ShowCourseDetails.ViewModel)
    func displayFavoriteButtonStatus(viewModel: CourseDetails.FavoriteButtonToggle.ViewModel)
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
        
    var interactor: CourseDetailsBusinessLogic?
    var course: Course!
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
        
    private func doSomething() {
        let request = CourseDetails.ShowCourseDetails.Request(course: course)
        interactor?.doSomething(request: request)
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        let request = CourseDetails.FavoriteButtonToggle.Request(courseName: course.name)
        interactor?.changeIsFavoriteStatus(requset: request)
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = CourseDetailsInteractor()
        let presenter = CourseDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension CourseDetailsViewController: CourseDetailsDisplayLogic {
    
    func displayFavoriteButtonStatus(viewModel: CourseDetails.FavoriteButtonToggle.ViewModel) {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
    
    func displayCourseDetails(viewModel: CourseDetails.ShowCourseDetails.ViewModel) {
        courseNameLabel.text = viewModel.courseName
        numberOfLessonsLabel.text = viewModel.numberOfLessons
        numberOfTestsLabel.text = viewModel.numberOfTests
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
        guard let imageData = viewModel.imageData else { return }
        courseImage.image = UIImage(data: imageData)
    }
}
