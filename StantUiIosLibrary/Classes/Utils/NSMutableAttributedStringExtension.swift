//
//  NSMutableAttributedStringExtension.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 09/01/20.
//

extension NSMutableAttributedString {
    func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 12.0)]
        let boldString                           = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    func normal(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12.0)]
        let normal                               = NSAttributedString(string: text, attributes: attrs)
        append(normal)
        
        return self
    }
}
