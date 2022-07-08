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

final class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private(set) var courseNameLabel: UILabel!
    @IBOutlet private(set) var numberOfLessonsLabel: UILabel!
    @IBOutlet private(set) var numberOfTestsLabel: UILabel!
    @IBOutlet private(set) var courseImage: UIImageView!
    @IBOutlet private(set) var favoriteButton: UIButton!
    
    var presenter: CourseDetailsViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        presenter.favoriteButtonPressed()
    }
}

extension CourseDetailsViewController: CourseDetailsViewInput {
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
    
    func setImageTintDepedingOn(_ status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
