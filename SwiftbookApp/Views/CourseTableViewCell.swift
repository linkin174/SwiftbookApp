//
//  CourseCell.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(with rowData: RowData) {
        print("Cell data \(rowData)")
        guard let imageData = ImageManager.shared.fetchImageData(from: rowData.imageURL) else { return }
        guard let image = UIImage(data: imageData) else { return }
        var content = defaultContentConfiguration()
        content.text = rowData.courseName
        content.image = image
        contentConfiguration = content
    }
}
