//
//  SyncDialogTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 28/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class SyncDialogTests: XCTestCase {
    
    private var testVC: TestSyncUiViewController!
    private var dialog: DialogViewController!
    private var syncView: SyncDialogView!
    
    private var icon              = UIImage(named: "sync") ?? UIImage()
    private var dialogTitle       = "Title"
    private var dialogText        = "Some text in dialog some text in dialog some text in dialog"
    private var firstButtonTitle  = "Report"
    private var secondButtonTitle = "Cancel"
    private var thirdButtonTitle  = "Select"
    
    let darkColor          = UIColor(red: 60/255, green: 60/255, blue: 70/255, alpha: 1)
    let darkGrayColor      = UIColor(red: 133/255, green: 133/255, blue: 150/255, alpha: 1)
    let orangeColor        = UIColor(red: 255/255, green: 64/255, blue: 37/255, alpha: 1)
    let veryLightGrayColor = UIColor(red: 233/255, green: 233/255, blue: 236/255, alpha: 1)
    
    override func setUp() {
        super.setUp()
        
        testVC          = TestSyncUiViewController()
        testVC.dialogVC = DialogViewController()
        testVC.syncView = SyncDialogView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        
        self.configureInsideSyncView()
        self.configureDialog()
    }
    
    fileprivate func configureInsideSyncView() {
        self.syncView = testVC.syncView ?? SyncDialogView()
        syncView.set(image: icon,
                     text: dialogText,
                     percentage: 50)
    }
    
    fileprivate func configureDialog() {
        self.dialog = testVC.dialogVC ?? DialogViewController()
        let firstButton  = DialogButton(title: firstButtonTitle, action: #selector(testVC.actionButton01), target: testVC, style: ButtonStyle.standard)
        let secondButton = DialogButton(title: secondButtonTitle, action: #selector(testVC.actionButton02), target: testVC, style: ButtonStyle.cancel)
        let thirdButton  = DialogButton(title: thirdButtonTitle, action: #selector(testVC.actionButton03), target: testVC, style: ButtonStyle.standard)
    
        dialog.configureView(title: dialogTitle,
                             mainView: syncView,
                             buttons: [firstButton, secondButton, thirdButton])
        testVC.present(dialog, animated: false, completion: nil)
    }
    
    func testCheckTitle() {
        XCTAssertEqual(testVC.dialogVC?.titleLabel?.text, dialogTitle)
        XCTAssertEqual(testVC.dialogVC?.titleLabel?.textColor, darkColor)
        XCTAssertEqual(testVC.dialogVC?.titleLabel?.font, .systemFont(ofSize: 18, weight: .bold))
    }
    
    func testCheckButton() {
        let stackViewFirstButton  = testVC.dialogVC?.stackView?.arrangedSubviews[0] as! UIButton
        let stackViewSecondButton = testVC.dialogVC?.stackView?.arrangedSubviews[1] as! UIButton
        let stackViewThirdButton  = testVC.dialogVC?.stackView?.arrangedSubviews[2] as! UIButton
        
        self.checkButtonInformation(button: stackViewFirstButton, title:  firstButtonTitle.uppercased(), textColor: orangeColor, textSize: 12, textWeight: .bold)
        self.checkButtonInformation(button: stackViewSecondButton, title:  secondButtonTitle.uppercased(), textColor: darkGrayColor, textSize: 12, textWeight: .bold)
        self.checkButtonInformation(button: stackViewThirdButton, title:  thirdButtonTitle.uppercased(), textColor: orangeColor, textSize: 12, textWeight: .bold)
    }
    
    fileprivate func checkButtonInformation(button: UIButton, title: String, textColor: UIColor, textSize: CGFloat, textWeight: UIFont.Weight) {
        XCTAssertEqual(button.titleLabel?.text, title)
        XCTAssertEqual(button.titleColor(for: .normal), textColor)
        XCTAssertEqual(button.titleLabel?.font, .systemFont(ofSize: textSize, weight: textWeight))
    }
    
    func testSelectFirstButton() {
        let stackViewButton = testVC.dialogVC?.stackView?.arrangedSubviews[0] as! UIButton
        stackViewButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(testVC.firstButtonCalled)
        XCTAssertFalse(testVC.secondButtonCalled)
        XCTAssertFalse(testVC.thirdButtonCalled)
    }
    
    func testSelectSecondButton() {
        let stackViewButton = testVC.dialogVC?.stackView?.arrangedSubviews[1] as! UIButton
        stackViewButton.sendActions(for: .touchUpInside)
        
        XCTAssertFalse(testVC.firstButtonCalled)
        XCTAssertTrue(testVC.secondButtonCalled)
        XCTAssertFalse(testVC.thirdButtonCalled)
    }
    
    func testSelectThirdButton() {
        let stackViewButton  = testVC.dialogVC?.stackView?.arrangedSubviews[2] as! UIButton
        stackViewButton.sendActions(for: .touchUpInside)
        
        XCTAssertFalse(testVC.firstButtonCalled)
        XCTAssertFalse(testVC.secondButtonCalled)
        XCTAssertTrue(testVC.thirdButtonCalled)
    }
    
    func testInsideView() {
        let syncView = testVC.syncView ?? SyncDialogView()
        let dialog   = testVC.dialogVC ?? DialogViewController()
        syncView.layoutSubviews()
        
        XCTAssertTrue(syncView.isDescendant(of: dialog.view))
        self.checkInsideViewImageView()
        self.checkInsideViewText()
        self.checkInsideViewProgressBar()
    }
    
    fileprivate func checkInsideViewImageView() {
        let imageViewImage = testVC.syncView?.iconImageView?.image ?? UIImage()
        
        let data1: NSData = icon.pngData()! as NSData
        let data2: NSData = imageViewImage.pngData()! as NSData
        
        XCTAssertTrue(data1.isEqual(to: data2 as Data))
    }
    
    fileprivate func checkInsideViewText() {
        let insideViewText = testVC.syncView?.textDialogLabel ?? UILabel()
        
        XCTAssertEqual(insideViewText.text, self.dialogText)
        XCTAssertEqual(insideViewText.textColor, darkColor)
        XCTAssertEqual(insideViewText.font, .systemFont(ofSize: 16, weight: .regular))
    }
    
    fileprivate func checkInsideViewProgressBar() {
        let syncView        = testVC.syncView ?? SyncDialogView()
        let fullProgressBar = syncView.fullProgressBarView ?? UIView()
        let progressBar     = syncView.progressBarView ?? UIView()
        
        
        XCTAssertTrue(fullProgressBar.isDescendant(of: syncView))
        XCTAssertTrue(progressBar.isDescendant(of: fullProgressBar))
        XCTAssertEqual(fullProgressBar.backgroundColor, veryLightGrayColor)
        XCTAssertEqual(progressBar.backgroundColor, darkGrayColor)
    }

}

class TestSyncUiViewController: UIViewController {
    public var firstButtonCalled  = false
    public var secondButtonCalled = false
    public var thirdButtonCalled  = false
    
    public var dialogVC: DialogViewController?
    public var syncView: SyncDialogView?
    
    @objc func actionButton01() {
        firstButtonCalled = true
    }
    
    @objc func actionButton02() {
        secondButtonCalled = true
    }
    
    @objc func actionButton03() {
        thirdButtonCalled = true
    }
    
}
