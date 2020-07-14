//
//  ItemHeaderViewUtils.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 10/07/20.
//

public struct ItemMethodDto { //TODO: it should be in inspections app
    public var status:             ItemCellTypeEnum?
    public var title:              String?
    public var observation:        String?
    public var hasReprovedMethod:  Bool?
    public var verifiedMethodList: [VerifiedMethodDto]?
    
    public init(title: String, observation: String, verifiedMethodList: [VerifiedMethodDto] = []) {
        self.title              = title
        self.observation        = observation
        self.verifiedMethodList = verifiedMethodList
        
        setVerifiedMethods(verifiedMethodList: verifiedMethodList)
    }
    
    public mutating func setVerifiedMethods(verifiedMethodList: [VerifiedMethodDto]) {
        let approvedMethods    = verifiedMethodList.filter{ $0.status == .approved }
        let reprovedMethods    = verifiedMethodList.filter{ $0.status == .reproved }
        self.hasReprovedMethod = reprovedMethods.count >= 1
        
        if approvedMethods.count == 0 && reprovedMethods.count == 0 {
            self.status = .notFilled
        } else {
            self.status = reprovedMethods.count == 0 ? .approved : .reproved
        }
    }
}

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
}

public protocol ItemHeaderViewDelegate {
    func toggleCollapse(section: Int)
}
