//
//  GroupedSelection.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/07/19.
//

import UIKit

public struct GroupedSelection {
    let sectionTitle: String?
    let firstDate: Date?
    let secondDate: Date?
    let itemsOfSection: [ItemSelection]?
    
    public init(sectionTitle: String, firstDate: Date, secondDate: Date, itemsOfSection: [ItemSelection]) {
        self.sectionTitle   = sectionTitle
        self.firstDate      = firstDate
        self.secondDate     = secondDate
        self.itemsOfSection = itemsOfSection
    }
}
