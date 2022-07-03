//
//  CourseDetailsViewController.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CourseDetailsViewInput: AnyObject {
    func setCourseName(_ text: String)
    func setNumberOfLessons(_ text: String)
    func setNumberOfTests(_ text : String)
    func setImage(from imageData: Data)
    func setImageTintDepedingOn(_ status: Bool)
}

protocol CourseDetailsViewOutput {
    init(view: CourseDetailsViewInput)
    func viewLoaded()
    func favoriteButtonPressed()
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    
    var presenter: CourseDetailsViewOutput!
    
    private var isFavorite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        presenter.favoriteButtonPressed()
    }
}

extension CourseDetailsViewController: CourseDetailsViewInput {
    func setImageTintDepedingOn(_ status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
    
    func setCourseName(_ name: String) {
        courseNameLabel.text = name
    }
    
    func setNumberOfLessons(_ text: String) {
        numberOfLessonsLabel.text = text
    }
    
    func setNumberOfTests(_ text: String) {
        numberOfTestsLabel.text = text
    }
    
    func setImage(from imageData: Data) {
        courseImage.image = UIImage(data: imageData)
    }
}
