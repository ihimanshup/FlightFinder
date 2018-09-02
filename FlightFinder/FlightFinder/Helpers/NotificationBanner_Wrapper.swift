//
//  NotificationBanner_Wrapper.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import Foundation
import NotificationBannerSwift

// MARK:-
class CustomBannerColors: BannerColorsProtocol {
    internal func color(for style: BannerStyle) -> UIColor {
        switch style {
        case .danger:
            return UIColor.white
//        case .info:     // Your custom .info color
//        case .none:     // Your custom .none color
        case .success:
            return UIColor.white
//        case .warning:  // Your custom .warning color
        default:
            return UIColor.clear
        }
    }
}

// MARK:-
class CustomNotificationBanner {
    // MARK:- class method -
    // Danger Style Notification with Right View
    class func showErrorBanner(subtitle: String) {
        let img_ExclamationMark = UIImage(named: Assets.NotificationBanner.ExclamationMark.rawValue)
        let rightView = UIImageView(image: img_ExclamationMark)
        
        let banner = NotificationBanner(title: ""
            , subtitle: subtitle
            , rightView: rightView
            , style: .danger
//            , colors: CustomBannerColors()
        )
        banner.show()
    }
    // MARK:- class method -
    // Success Style Notification
    class func showSuccessBanner(subtitle: String) {
        let banner = NotificationBanner(title: ""
            , subtitle: subtitle
            , style: .success
//            , colors: CustomBannerColors()
        )
        banner.show()
    }
}
