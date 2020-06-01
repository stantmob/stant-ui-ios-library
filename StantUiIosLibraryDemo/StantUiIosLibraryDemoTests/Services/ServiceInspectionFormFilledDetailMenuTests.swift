//
//  ServiceInspectionFormFilledDetailMenuTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 31/05/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class ServiceInspectionFormFilledDetailMenuTests: XCTestCase {
    var detailView: ServiceInspectionFormFilledDetailMenuView!
    
    var personInChargeNames = ["Person 1", "Person 2", "Person 3"]
    var personNames         = (1...30).map { "Person \($0)" }
    var personRoles         = (1...30).map { "Role \($0)" }
    var photoUrls           = (1...30).map { _ in "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw" }
    
    override func setUp() {
        super.setUp()
        
        detailView = ServiceInspectionFormFilledDetailMenuView(frame: CGRect(x: 0,
                                                                             y: 0,
                                                                             width: 350,
                                                                             height: 271))
        
        configureDetailView()
    }
    
    fileprivate func configureDetailView() {
        detailView.configureInChargeStackView(personInChargeNames:     personInChargeNames,
                                              personInChargePhotoUrls: photoUrls)

        detailView.configureMainTabView()
        
        detailView.configureFormTab(beginDate:       "11/10/2010",
                                    endDate:         "10/10/2010",
                                    quantiy:         "200",
                                    unitMeasurement: "m²",
                                    tests:           "0")
        
        detailView.configureTeamTab(personNames: personNames,
                                    personRoles: personRoles,
                                    photoUrls:   photoUrls)
        
        detailView.configureAttachmentTab(photoUrls: photoUrls)
    }
    
    override func tearDown() {
           super.tearDown()
    }

    func testGeneralView() {
        self.configureDetailView()
        let inChargeStackView = detailView.inChargeStackView
        let mainTabView       = detailView.mainTabView
        let formTabView       = detailView.formTabView
        let teamTabView       = detailView.teamTabView
        let attachmentTabView = detailView.attachmentTabView
        
//        XCTAssertTrue(cardsView.plannedSiffCard?.isDescendant(of: cardsView) ?? false)
//        XCTAssertTrue(cardsView.executedSiffCard?.isDescendant(of: cardsView) ?? false)
//        XCTAssertTrue(cardsView.availableSiffCard?.isDescendant(of: cardsView) ?? false)
    
    }
}
