//
//  IntExtension.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/06/20.
//

public extension Int {
    func getStringWith(numberOfDigits: Int) -> String{
        return String(format: "%0\(numberOfDigits)d", self)
    }
}
