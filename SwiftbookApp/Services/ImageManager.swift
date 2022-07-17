//
//  ImageManager.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 03.01.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

protocol ImageManagerProtocol {
    func fetchImageData(from url: URL?) -> Data?
}

class ImageManager: ImageManagerProtocol {
    func fetchImageData(from url: URL?) -> Data? {
        guard let url = url else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
