//
//  DataManger.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    func setFavoriteStatus(for courseName: String, with status: Bool)
    func getFavoriteStatus(for courseName: String) -> Bool
}

class DataManager: DataManagerProtocol {
    
    private let userDefaults = UserDefaults()
    
    func setFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
}
