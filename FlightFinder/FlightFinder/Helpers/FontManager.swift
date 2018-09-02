//
//  FontManager.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import UIKit

// Usage Examples
//let system12            = Font(.system, size: .standard(.h5)).instance
//let helveticaLight13    = Font(.custom("Helvetica-Light"), size: .custom(13.0)).instance

let HP_Font_SegoeUI_Bold_18 = Font(.installed(.SegoeUI_Bold), size: .standard(.h2)).instance
let HP_Font_SegoeUI_Bold_16 = Font(.installed(.SegoeUI_Bold), size: .standard(.h3)).instance
let HP_Font_SegoeUI_Regular_18 = Font(.installed(.SegoeUI_Regular), size: .standard(.h2)).instance
let HP_Font_SegoeUI_Regular_16 = Font(.installed(.SegoeUI_Regular), size: .standard(.h3)).instance
let HP_Font_SegoeUI_Regular_14 = Font(.installed(.SegoeUI_Regular), size: .standard(.h4)).instance
let HP_Font_SegoeUI_Regular_12 = Font(.installed(.SegoeUI_Regular), size: .standard(.h5)).instance

struct Font {
    // MARK:- Font Type
    enum FontType {
        case installed(FontName)
        case custom(String)
        case system
        case systemBold
        case systemItatic
        case systemWeighted(weight: Double)
        case monoSpacedDigit(size: Double, weight: Double)
    }
    // MARK:- Font Size
    enum FontSize {
        case standard(StandardSize)
        case custom(Double)
        var value: Double {
            switch self {
            case .standard(let size):
                return size.rawValue
            case .custom(let customSize):
                return customSize
            }
        }
    }
    // MARK:- Font Name
    enum FontName: String {
        case SegoeUI_Regular = "SegoeUI-Regular"
        case SegoeUI_Bold = "SegoeUI-Bold"
        
    }
    // MARK:- Standard Font Sizes
    enum StandardSize: Double {
        case h1 = 20.0
        case h2 = 18.0
        case h3 = 16.0
        case h4 = 14.0
        case h5 = 12.0
        case h6 = 10.0
    }
    
    // MARK:-
    var type: FontType
    var size: FontSize
    init(_ type: FontType, size: FontSize) {
        self.type = type
        self.size = size
    }
}

// MARK:- UIFont instance
extension Font {
    
    var instance: UIFont {
        
        var instanceFont: UIFont!
        
        switch type {
            
        case .custom(let fontName):
            guard let font =  UIFont(name: fontName, size: CGFloat(size.value)) else {
//                fatalError("\(fontName) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
                return UIFont(name: "Helvetica-Light", size: CGFloat(size.value))!
            }
            instanceFont = font
            
        case .installed(let fontName):
            guard let font =  UIFont(name: fontName.rawValue, size: CGFloat(size.value)) else {
//                fatalError("\(fontName.rawValue) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
                return UIFont.systemFont(ofSize: CGFloat(size.value))
            }
            instanceFont = font
            
        case .system:
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value))
            
        case .systemBold:
            instanceFont = UIFont.boldSystemFont(ofSize: CGFloat(size.value))
            
        case .systemItatic:
            instanceFont = UIFont.italicSystemFont(ofSize: CGFloat(size.value))
            
        case .systemWeighted(let weight):
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value),
                                             weight: UIFont.Weight(rawValue: CGFloat(weight)))
            
        case .monoSpacedDigit(let size, let weight):
            instanceFont = UIFont.monospacedDigitSystemFont(ofSize: CGFloat(size),
                                                            weight: UIFont.Weight(rawValue: CGFloat(weight)))
        }
        
        return instanceFont
    }
}


// MARK:-
class FontUtility {
    // this logs in the console, all available fonts from iOS SDK and installed custom font
    class func logAllAvailableFonts() {
        for family in UIFont.familyNames {
            print("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
    }
}
