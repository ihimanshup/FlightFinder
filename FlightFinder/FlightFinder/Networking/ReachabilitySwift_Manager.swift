//
//  ReachabilitySwift_Manager.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import Foundation
import Reachability // 1 Importing the Library

/// Protocol for listenig network status change
public protocol NetworkStatusListener : class {
    func networkStatusDidChange(status: Reachability.Connection)
}

class ReachabilityManager: NSObject {
    
    static let shared = ReachabilityManager()  // 2. Shared instance
    
    // 3. Boolean to track network reachability
    var isNetworkAvailable : Bool {
        return reachabilityStatus != .none
    }
    
    // 4. Tracks current NetworkStatus (notReachable, reachableViaWiFi, reachableViaWWAN)
    var reachabilityStatus: Reachability.Connection = .none
    
    // 5. Reachibility instance for Network status monitoring
    let reachability = Reachability()!
    
    // 6. Array of delegates which are interested to listen to network status change
    var listeners = [NetworkStatusListener]()
    
    
    // MARK:-  Called whenever there is a change in NetworkReachibility Status
    /// — parameter notification: Notification with the Reachability instance
    @objc func reachabilityChanged(notification: Notification) {
        
        let reachability = notification.object as! Reachability
        
        switch reachability.connection {
        case .none:
            debugPrint("Network Unreachable")
        case .wifi:
            debugPrint("Network Reachable through WiFi")
        case .cellular:
            debugPrint("Network Reachable through Cellular Data")
        }
        
        // Sending message to each of the delegates
        for listener in listeners {
            listener.networkStatusDidChange(status: reachability.connection)
        }
        
    }
    
    
    // MARK:- Starts monitoring the network availability status
    func startMonitoring() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged), name: Notification.Name.reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    
    // MARK:- Stops monitoring the network availability status
    func stopMonitoring() {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged, object: reachability)
    }
    
    
    // MARK:- Adds a new listener to the listeners array
    /// - parameter delegate: a new listener
    func addListener(listener: NetworkStatusListener) {
        listeners.append(listener)
    }
    
    // MARK:- Removes a listener from listeners array
    /// - parameter delegate: the listener which is to be removed
    func removeListener(listener: NetworkStatusListener) {
        listeners = listeners.filter{ $0 !== listener}
    }
}
