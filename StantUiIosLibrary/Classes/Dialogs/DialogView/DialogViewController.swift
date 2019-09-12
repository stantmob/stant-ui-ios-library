//
//  DialogViewController.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 28/05/19.
//

import UIKit

public class DialogViewController: UIViewController {
    
    public var dialogView: UIView?
    public var titleLabel: UILabel?
    public var stackView: UIStackView?
    public var mainContainerInformation: UIView?
    public var buttons = [DialogButton]()
    
    let dialogHeight: CGFloat = 234

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    deinit {
        self.dialogView = nil
        self.titleLabel = nil
        self.stackView  = nil
        self.mainContainerInformation = nil
    }
    
    @objc public func dismissViewController() {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        }
        self.dismiss(animated: false, completion: nil)
    }
    
    public func configureView(title: String, mainView: UIView, buttons: [DialogButton], canClickOutside: Bool = true) {
        self.addDialog()
        self.mainContainerInformation = mainView
        self.addCenteredView(mainView)
        self.addTitle(title)
        self.buttons = buttons
        self.add(buttons: buttons)
        self.updateClicks(canClickOutside)
    }
    
    public func updateDialog(title: String, mainView: UIView, removeAllButtons: Bool = true) {
        mainContainerInformation?.removeFromSuperview()
        self.addCenteredView(mainView)
        titleLabel?.text = title
        
        if removeAllButtons {
            stackView?.removeFromSuperview()
        }
    }
    
    fileprivate func addDialog() {
        dialogView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: dialogHeight))
        
        guard let dialogView = dialogView else { return }
        dialogView.backgroundColor    = .white
        dialogView.layer.cornerRadius = 3.0
        self.view.addSubview(dialogView)
        dialogView.anchor(leading: self.view.leadingAnchor,
                          trailing: self.view.trailingAnchor,
                          padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
                          size: CGSize(width: 0, height: dialogHeight))
        dialogView.anchorCenterY(anchorY: self.view.centerYAnchor)
    }
    
    fileprivate func addCenteredView(_ view: UIView) {
        guard let dialogView = dialogView else { return }
        dialogView.addSubview(view)
        view.anchor(top: dialogView.topAnchor,
                    leading: dialogView.leadingAnchor,
                    bottom: dialogView.bottomAnchor,
                    trailing: dialogView.trailingAnchor,
                    padding: UIEdgeInsets(top: 54, left: 0, bottom: 56, right: 0))
    }
    
    fileprivate func addTitle(_ title: String) {
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 21))
        
        guard let dialogView = dialogView, let titleLabel = titleLabel else { return }
        titleLabel.configure(text: title, size: 18, weight: .bold, color: .darkStant)
        dialogView.addSubview(titleLabel)
        titleLabel.anchor(top: dialogView.topAnchor,
                          leading: dialogView.leadingAnchor,
                          trailing: dialogView.trailingAnchor,
                          padding: UIEdgeInsets(top: 16, left: 34, bottom: 56, right: 34),
                          size: CGSize(width: 0, height: 21))
    }
    
    fileprivate func add(buttons: [DialogButton]) {
        stackView = UIStackView(arrangedSubviews: [])
        
        guard let dialogView = dialogView, let stackView = stackView else { return }
        
        for button in buttons {
            let stackViewButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 14))

            stackViewButton.backgroundColor = .white
            
            stackViewButton.setTitle(button.title?.uppercased() ?? "", for: .normal)
            
            if button.style == ButtonStyle.cancel {
                stackViewButton.setTitleColor(.darkGrayStant, for: .normal)
            } else {
                stackViewButton.setTitleColor(.orangeStant, for: .normal)
            }
            
            stackViewButton.contentHorizontalAlignment = .center
            stackViewButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
            
            guard let action = button.action else { return }
            stackViewButton.addTarget(button.target, action: action, for: .touchUpInside)
            stackView.addArrangedSubview(stackViewButton)
        }
        stackView.distribution = .fillEqually
        dialogView.addSubview(stackView)
        
        self.addStackViewConstraintAccordingToQuantityOf(buttons: buttons)
    }
    
    fileprivate func addStackViewConstraintAccordingToQuantityOf(buttons: [DialogButton]) {
        guard let dialogView = dialogView, let stackView = stackView else { return }
        var leadingAnchorValue: CGFloat = 0
        
        if buttons.count == 2 {
            leadingAnchorValue = (self.view.frame.width - 32) / 3
        }
        
        stackView.anchor(leading: dialogView.leadingAnchor,
                         bottom: dialogView.bottomAnchor,
                         trailing: dialogView.trailingAnchor,
                         padding: UIEdgeInsets(top: 0, left: leadingAnchorValue, bottom: 0, right: 0),
                         size: CGSize(width: 0, height: 56))
    }
    
    public func updateDialog(title: String, mainView: UIView,
                             buttons: [DialogButton] = [DialogButton](),
                             canClickOutside: Bool = true) {
        self.titleLabel?.text = title
        
        self.updateMainContainerInformation(withView: mainView)
        self.update(dialogButtons: buttons)
        self.updateClicks(canClickOutside)
    }
    
    fileprivate func updateMainContainerInformation(withView mainView: UIView) {
        mainContainerInformation?.removeFromSuperview()
        self.mainContainerInformation = mainView
        self.addCenteredView(mainView)
    }
    
    fileprivate func update(dialogButtons: [DialogButton]) {
        stackView?.removeFromSuperview()
        self.buttons = dialogButtons
        self.add(buttons: buttons)
    }

    fileprivate func updateClicks(_ canClickOutside: Bool) {
        self.view.gestureRecognizers?.removeAll()
        
        if canClickOutside {
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
            self.view.addGestureRecognizer(tap)
        }
    }
}
