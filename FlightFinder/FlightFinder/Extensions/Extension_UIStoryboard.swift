//
//  Extension_UIStoryboard.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import UIKit

// MARK:- To make instantiation really safe with storyboard
// For 'Storyboard Identifiers' on your view controllers, a good practice is to use the class name as the identifier.
extension UIStoryboard {
    
//    enum Storyboard: String {
//        case Main
//
//        var filename: String {
//            return rawValue
//        }
//    }
    
    // MARK:- convenience initializer to reduce syntax further
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    // default value for the bundle: argument to be nil, thus making it optional to omit the bundle: argument completely when the initializer is called.
    // The bundle containing the storyboard file and its related resources. If you specify nil, this method looks in the main bundle of the current application.
    
    
    // MARK:- An alternative to convenience initializers is to just create class functions
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    // *** Whether you choose convenience initializers or class methods, both produce the same outcome. ***
    
    
    // MARK:- ViewController Instantiation from Generics
    // To get rid of the traditional way to instantiate view controllers from a storyboard with string literal storyboard identifiers and replacing it with a new, much safer way.
    func instantiateViewController<VC: UIViewController>() -> VC where VC: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC else {
            fatalError("Couldn't instantiate view controller with identifier \(VC.storyboardIdentifier) ")
        }
        return viewController
    }
    // By common convention, generics typically have the parameter name of T, however, we've replace this with VC.
    
    // We’re using generics here which only allow us to pass in classes that are either UIViewController or subclasses of,and there’s also a where statement included in the generics declaration that limit the compatible arguments to those classes that conform to the StoryboardIdentifiable protocol.
}
