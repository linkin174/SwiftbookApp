//
//  CourceListPresenter.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

struct RowData {
    let imageURL: URL
    let courseName: String
    let numberOfLessons: String
    let numberOfTests: String
}

class CourseListPresenter: CourseListViewOutput, CourseListInteractorOutput {
    
    
    var rowData: [RowData] = []
    
    func getNumberOfRows() -> Int {
        rowData.count
    }
    
    func getRowData(for indexPath: IndexPath) -> RowData {
        rowData[indexPath.row]
    }
    
    func recieveRowData(_ rowData: [RowData]) {
        view.load()
        self.rowData = rowData
    }
    
    func getRowsData() {
        interactor.provideRowData()
    }
    
    func didSelectedRow(at indexPath: IndexPath) {
        
    }
    
    
    unowned private let view: CourseListViewInput
    var interactor: CourseListInteractorInput!
   
    required init(view: CourseListViewInput) {
        self.view = view
    }
    
    
}

