//
//  FloatExtension.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 09/01/20.
//
public extension Float {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) <= 0.00001 ? String(format: "%.0f", self) : String(format: "%.1f", self)
    }
    
    func roundWith(decimalPlaces: Int) -> Float {
        let power = Float(pow(Double(10), Double(decimalPlaces)))
        return (self * power).rounded() / power
    }
}
