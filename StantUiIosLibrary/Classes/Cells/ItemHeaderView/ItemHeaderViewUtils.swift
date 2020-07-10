//
//  ItemHeaderViewUtils.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 10/07/20.
//

public enum ItemEnum {
    case notInspected, reproved, approved
    
    public func colorValue() -> UIColor {
        switch self {
        case .notInspected:
            return .clear
        case .reproved:
            return .redLightStant
        case .approved:
            return .greenStant
        }
    }
}

public protocol ItemHeaderViewDelegate {
    func toggleCollapse(section: Int)
}
