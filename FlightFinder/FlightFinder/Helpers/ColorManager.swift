//
//  ColorManager.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import UIKit

// Usage Examples
//let shadowColorWithAlpha = Color.shadow.withAlpha(0.5)
//let customColorWithAlpha = Color.custom(hexString: "#123edd", alpha: 0.25).value

let HP_Color_darkTheme = Color.darkTheme.value
let HP_Color_lightTheme = Color.lightTheme.value
let HP_Color_border = Color.border.value
let HP_Color_darkBackground = Color.darkBackground.value
let HP_Color_lightBackground = Color.lightBackground.value
let HP_Color_darkText = Color.darkText.value
let HP_Color_lightText = Color.lightText.value

enum Color {
    // MARK:- Color Type
    case darkTheme
    case lightTheme
    
    case border
    case shadow
    
    case darkBackground
    case lightBackground
    
    case darkText
    case lightText
    
    case custom(hexString: String, alpha: Double)
    
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

// MARK:- UIColor instance
extension Color {
    
    var value: UIColor {
        
        var instanceColor = UIColor.clear
        
        switch self {
            
        case .darkTheme:
            instanceColor = UIColor(hexString: "#C16609")
        case .lightTheme:
            instanceColor = UIColor(hexString: "#EC8811")
            
        case .border:
            instanceColor = UIColor.white
        case .shadow:
            instanceColor = UIColor.clear
            
        case .darkBackground:
            instanceColor = UIColor(hexString: "#DDDDDD")
        case .lightBackground:
            instanceColor = UIColor(hexString: "#EFEFEF")
            
        case .darkText:
            instanceColor = UIColor.black
        case .lightText:
            instanceColor = UIColor.white
            
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        
        return instanceColor
    }
}

// MARK:-
extension UIColor {
    /**
     Creates an UIColor from HEX String in "#363636" format
     
     - parameter hexString: HEX String in "#363636" format
     
     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}
