//
//  MockViewController.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 07.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation
@testable import SwiftbookApp
import UIKit

final class MockViewController: CourseDetailsViewInput {
    var testName: String?
    var testNumberOfLessons: String?
    var testNumberOfTests: String?
    var testImageData: Data?
    var testTint: UIColor?
    
    func setCourseName(_ text: String) {
        testName = text
    }
    
    func setNumberOfLessons(_ text: String) {
        testNumberOfLessons = text
    }
    
    func setNumberOfTests(_ text: String) {
        testNumberOfTests = text
    }
    
    func setImage(from imageData: Data) {
        testImageData = imageData
    }
    
    func setImageTintDepedingOn(_ status: Bool) {
        testTint = status ? .red : .blue
    }
}
