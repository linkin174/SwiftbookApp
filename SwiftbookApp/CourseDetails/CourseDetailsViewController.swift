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
    func displayFavoriteButtonStatus(viewModel: CourseDetails.ChangeFavoriteStatus.ViewModel)
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
        
    var interactor: CourseDetailsBusinessLogic?
    var router: (NSObjectProtocol & CourseDetailsRoutingLogic & CourseDetailsDataPassing)?
    
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
        passRequest()
    }
        
    private func passRequest() {
        interactor?.provideCourseDetails()
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        interactor?.changeIsFavoriteStatus()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = CourseDetailsInteractor()
        let presenter = CourseDetailsPresenter()
        let router = CourseDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension CourseDetailsViewController: CourseDetailsDisplayLogic {
    
    func displayFavoriteButtonStatus(viewModel: CourseDetails.ChangeFavoriteStatus.ViewModel) {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
    
    func displayCourseDetails(viewModel: CourseDetails.ShowCourseDetails.ViewModel) {
        courseNameLabel.text = viewModel.courseName
        numberOfLessonsLabel.text = viewModel.numberOfLessons
        numberOfTestsLabel.text = viewModel.numberOfTests
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
        courseImage.image = UIImage(data: viewModel.imageData)
    }
}
