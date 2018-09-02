//
//  Protocol_UserDefaults.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import Foundation

protocol KeyNamespaceable { }

extension KeyNamespaceable {
    private static func namespace(_ key: String) -> String {
        return "\(Self.self)_\(key)"
    }
    static func namespace<T: RawRepresentable>(_ key: T) -> String where T.RawValue == String {
        return namespace(key.rawValue)
    }
}


// MARK: - Bool Defaults
protocol BoolUserDefaultable : KeyNamespaceable {
    associatedtype BoolDefaultKey : RawRepresentable
}

extension BoolUserDefaultable where BoolDefaultKey.RawValue == String {
    static func set(_ bool: Bool, forKey key: BoolDefaultKey) {
        let key = namespace(key)
        UserDefaults.standard.set(bool, forKey: key)
    }
    static func bool(forKey key: BoolDefaultKey) -> Bool {
        let key = namespace(key)
        return UserDefaults.standard.bool(forKey: key)
    }
}

// MARK: - Object Defaults
protocol ObjectUserDefaultable : KeyNamespaceable {
    associatedtype ObjectDefaultKey : RawRepresentable
}

extension ObjectUserDefaultable where ObjectDefaultKey.RawValue == String {
    static func set(_ object: AnyObject, forKey key: ObjectDefaultKey) {
        let key = namespace(key)
        UserDefaults.standard.set(object, forKey: key)
    }
    static func object(forKey key: ObjectDefaultKey) -> Any? {
        let key = namespace(key)
        return UserDefaults.standard.object(forKey: key)
    }
}

/*
 // MARK: - Float Defaults
 
 protocol FloatUserDefaultable : KeyNamespaceable {
 associatedtype FloatDefaultKey : RawRepresentable
 }
 
 extension FloatUserDefaultable where FloatDefaultKey.RawValue == String {
 
 // Set
 
 static func set(_ float: Float, forKey key: FloatDefaultKey) {
 let key = namespace(key)
 UserDefaults.standard.set(float, forKey: key)
 }
 
 // Get
 
 static func float(forKey key: FloatDefaultKey) -> Float {
 let key = namespace(key)
 return UserDefaults.standard.float(forKey: key)
 }
 }
 
 
 // MARK: - Integer Defaults
 
 protocol IntegerUserDefaultable : KeyNamespaceable {
 associatedtype IntegerDefaultKey : RawRepresentable
 }
 
 extension IntegerUserDefaultable where IntegerDefaultKey.RawValue == String {
 
 // Set
 
 static func set(_ integer: Int, forKey key: IntegerDefaultKey) {
 let key = namespace(key)
 UserDefaults.standard.set(integer, forKey: key)
 }
 
 // Get
 
 static func integer(forKey key: IntegerDefaultKey) -> Int {
 let key = namespace(key)
 return UserDefaults.standard.integer(forKey: key)
 }
 }
 
 // MARK: - Double Defaults
 
 protocol DoubleUserDefaultable : KeyNamespaceable {
 associatedtype DoubleDefaultKey : RawRepresentable
 }
 
 extension DoubleUserDefaultable where DoubleDefaultKey.RawValue == String {
 
 // Set
 
 static func set(_ double: Double, forKey key: DoubleDefaultKey) {
 let key = namespace(key)
 UserDefaults.standard.set(double, forKey: key)
 }
 
 // Get
 
 static func double(forKey key: DoubleDefaultKey) -> Double {
 let key = namespace(key)
 return UserDefaults.standard.double(forKey: key)
 }
 }
 
 
 // MARK: - URL Defaults
 
 protocol URLUserDefaultable : KeyNamespaceable {
 associatedtype URLDefaultKey : RawRepresentable
 }
 
 extension URLUserDefaultable where URLDefaultKey.RawValue == String {
 
 // Set
 
 static func set(_ url: URL, forKey key: URLDefaultKey) {
 let key = namespace(key)
 UserDefaults.standard.set(url, forKey: key)
 }
 
 // Get
 
 static func url(forKey key: URLDefaultKey) -> URL? {
 let key = namespace(key)
 return UserDefaults.standard.url(forKey: key)
 }
 }
 */
