//
//  Extension_UserDefaults.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import Foundation

extension UserDefaults {
    struct Account: ObjectUserDefaultable {
        private init() { }
        
        enum ObjectDefaultKey: String {
            case username
        }
    }
}
