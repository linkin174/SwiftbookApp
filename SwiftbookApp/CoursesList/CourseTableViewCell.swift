//
//  CourseTableViewCell.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 17.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CourseCellViewModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? { get }
}

final class CourseTableViewCell: UITableViewCell, CourseCellViewModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? CourseCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.courseName
        if let data = viewModel.imageData {
            guard let image = UIImage(data: data) else { return }
            content.image = image
        }
        contentConfiguration = content
    }
}
