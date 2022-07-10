//
//  TableViewCell.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 10.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? { get }
}

final class CourseTableViewCell: UITableViewCell, CellModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? {
        didSet {
            setup()
        }
    }

    private func setup() {
        guard let viewModel = viewModel as? CourseCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.courseName
        if let imageData = viewModel.imageData {
            content.image = UIImage(data: imageData)
        }
        contentConfiguration = content
    }
}
