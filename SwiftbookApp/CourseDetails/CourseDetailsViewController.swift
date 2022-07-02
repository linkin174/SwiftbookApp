//
//  CourseDetailsViewController.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CourseDetailsViewInput: AnyObject {
    func setupView(_ rowData: RowData)
}

protocol CourseDetailsViewOutput {
    init(view: CourseDetailsViewInput)
    func viewLoaded()
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    
    var course: Course!
    var presenter: CourseDetailsViewOutput!
    private let configurator: CourseDetailsViewConfigurator = CourseDetailsViewConfigurator()
    
    private var isFavorite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavoriteStatus()
//        setupUI()
        presenter.viewLoaded()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        isFavorite.toggle()
        setStatusForFavoriteButton()
        DataManager.shared.setFavoriteStatus(for: course.name, with: isFavorite)
    }
    
//    private func setupUI() {
//        courseNameLabel.text = course.name
//        numberOfLessonsLabel.text = "Number of lessons: \(course.numberOfLessons)"
//        numberOfTestsLabel.text = "Number of tests: \(course.numberOfTests)"
//
//        if let imageData = ImageManager.shared.fetchImageData(from: course.imageUrl) {
//            courseImage.image = UIImage(data: imageData)
//        }
//
//        setStatusForFavoriteButton()
//    }
//
    private func setStatusForFavoriteButton() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
    }
    
    private func loadFavoriteStatus() {
        isFavorite = DataManager.shared.getFavoriteStatus(for: course.name)
    }
}

extension CourseDetailsViewController: CourseDetailsViewInput {
    func setupView(_ rowData: RowData) {
        courseNameLabel.text = rowData.courseName
        numberOfLessonsLabel.text = rowData.numberOfLessons
        numberOfTestsLabel.text = rowData.numberOfTests
        guard let imageData = ImageManager.shared.fetchImageData(from: rowData.imageURL) else { return }
        guard let image = UIImage(data: imageData) else { return }
        courseImage.image = image
    }
}
