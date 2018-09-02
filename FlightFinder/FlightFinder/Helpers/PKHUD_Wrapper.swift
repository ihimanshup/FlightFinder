//
//  PKHUD_Wrapper.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import UIKit
import PKHUD

class ActivityIndicator {
    // MARK:-
    class func show_Progress() {
        HUD.show(.progress)
    }
    
    // MARK:-
    class func hide() {
        HUD.hide()
    }
    
    // MARK:-
    class func hide(withErrorMessage error: String, andLogMessage log: String) {
        CustomNotificationBanner.showErrorBanner(subtitle: error)
        HUD.hide()
        print(log)
    }
    
    // MARK:-
    class func hide(withSuccessMessage error: String, andLogMessage log: String) {
        CustomNotificationBanner.showSuccessBanner(subtitle: error)
        HUD.hide()
        print(log)
    }
}
