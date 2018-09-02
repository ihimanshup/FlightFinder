//
//  Protocol_StoryboardIdentifiable.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
// In extension declaration, there is a 'where' clause which makes it only apply to classes that are either UIViewController or it’s subclasses.
// This will stop other classes such as NSDate or anything similar from getting a storyboardIdentifier protocol variable.


// MARK:-
// Inside the protocol extension, we’re providing a method to get the storyboardIdentifier string dynamically from the class at runtime.
extension UIViewController: StoryboardIdentifiable { }
// So every UIViewController within our project conforms to the StoryboardIdentifiable protocol.
// This just alleviates us from updating every UIViewController class to conform to the new protocol, as well as having to remember to make new classes conform.


// MARK:- syntax made more concise
protocol StoryboardLoadable { }

extension StoryboardLoadable where Self: UIViewController {
    static var className: String {
        return String(describing: Self.self)
    }
    
    init(from storyboard: UIStoryboard) {
        let controller = storyboard.instantiateViewController(withIdentifier: Self.className)
        guard let viewController = controller as? Self else {
            fatalError("Could not initialize '\(Self.className)'")
        }
        self = viewController
    }
}

extension UIViewController: StoryboardLoadable { }
