//
//  MockPresenter.swift
//  SwiftbookAppTests
//
//  Created by Aleksandr Kretov on 07.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation
@testable import SwiftbookApp

final class MockPresenter: CourseDetailsViewInteractorOutput, CourseDetailsViewOutput {
    
    var status: Bool?
    var data: DetailsData?
    var isFavoriteButtonPressed: Bool?
    
    func recieve(_ viewData: DetailsData) {
        data = viewData
    }
    
    func recieveFavorite(_ status: Bool) {
        self.status = status
    }
    
    init(view: CourseDetailsViewInput) {
        
    }
    
    func viewLoaded() {
        
    }
    
    func favoriteButtonPressed() {
        isFavoriteButtonPressed = true
    }
}
