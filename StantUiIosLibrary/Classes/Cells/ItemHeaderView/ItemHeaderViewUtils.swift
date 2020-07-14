//
//  ItemHeaderViewUtils.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 10/07/20.
//

public enum ItemCellTypeEnum: Int {
    case notFilled = 0, reproved = 1, approved = 2
    
    public func colorValue() -> UIColor {
        switch self {
        case .notFilled:
            return .clear
        case .reproved:
            return .redLightStant
        case .approved:
            return .greenStant
        }
    }
    
    public static func getStatusFromInt(value: Int) -> ItemCellTypeEnum {
        switch value {
        case 1:
            return ItemCellTypeEnum.reproved
        case 2:
            return ItemCellTypeEnum.approved
        default:
            return ItemCellTypeEnum.notFilled
        }
    }
}

public protocol ItemHeaderViewDelegate {
    func toggleCollapse(section: Int)
}
