//
//  Moya_NetworkManager.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import Foundation
import Moya

final class MoyaCustomProvider<Target> where Target: Moya.TargetType {
    private let provider: MoyaProvider<Target>
    
    // a boolean value to indicate if we are online or offline
//    var online: Bool
    
    // initialize our custom provider with all default values from MoyaProvider
    // and the online var
    init(
        endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping
        , requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider.defaultRequestMapping
        , stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub
        , manager: Manager = MoyaProvider<Target>.defaultAlamofireManager()
        , plugins: [PluginType] = [NetworkLoggerPlugin(verbose: true)]
        , trackInflights: Bool = false
//        , online: Bool = true
        ) {
//        self.online = online
        self.provider = MoyaProvider(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, manager: manager, plugins: plugins, trackInflights: trackInflights)
    }
    
    // MARK:-
    func request(
        _ target: Target
        , success: @escaping(Response) -> Void
        ) {
        ActivityIndicator.show_Progress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.doAPIRequest(target, success: { response in
                success(response)
            })
        }
    }
    
    // MARK:
    fileprivate func doAPIRequest(
        _ target: Target
        , success: @escaping(Response) -> Void
        ) {
        print("----------------------------------------------------------------------------------------------------")
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                self.handleAPIResponse_Success(moyaResponse, success: { (response) in
                    success(response)
                })
                
            case let .failure(moyaError):
                self.handleAPIResponse_Failure(moyaError)
            }
        }
    }
    
    // MARK
    fileprivate func handleAPIResponse_Success(_ moyaResponse: Response
        , success: @escaping(Response) -> Void) {
        do {
            success(moyaResponse)
        }
    }
    
    // MARK
    fileprivate func handleAPIResponse_Failure(_ moyaError: MoyaError) {
        switch moyaError {
        case .imageMapping(let response):
            handleFailureMessage(on: response, banner: response.description)
        case .jsonMapping(let response):
            handleFailureMessage(on: response, banner: response.description)
        case .statusCode(let response):
            handleFailureMessage(on: response, banner: response.description)
        case .stringMapping(let response):
            handleFailureMessage(on: response, banner: response.description)
        case .objectMapping(let error, let response):
            // error is DecodingError
            handleFailureMessage(on: response, banner: error.localizedDescription)
        case .encodableMapping(let error):
            print(error)
            CustomNotificationBanner.showErrorBanner(subtitle: error.localizedDescription)
        case .underlying(let nsError as NSError, let response):
            // now can access NSError error.code or whatever
            // e.g. NSURLErrorTimedOut or NSURLErrorNotConnectedToInternet
            print(nsError.code)
            print(nsError.domain)
            print(response ?? "underlying error")
            // The Internet connection appears to be offline.
            print(nsError.localizedDescription)
            CustomNotificationBanner.showErrorBanner(subtitle: nsError.localizedDescription)
        case .requestMapping(let url):
            print(url)
            CustomNotificationBanner.showErrorBanner(subtitle: url)
        case .parameterEncoding(let error):
            print(error)
            CustomNotificationBanner.showErrorBanner(subtitle: error.localizedDescription)
        }
        ActivityIndicator.hide()
    }
    fileprivate func handleFailureMessage(on console: Response, banner: String) {
        print(console)
        CustomNotificationBanner.showErrorBanner(subtitle: banner)
    }
}
