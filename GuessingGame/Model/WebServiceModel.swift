//
//  WebServiceModel.swift
//  GuessingGame
//
//  Created by Harpreet on 01/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView

class WebServiceModel: NSObject {
        
    // MARK: - Return network status
    class var isReachable: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    class func getDataFromServer<T:Decodable>(completion: @escaping (T) -> (), failure: @escaping(String)->()) {
        if WebServiceModel.isReachable {
            let loader = NVActivityIndicatorView(frame: CGRect(x: UIScreen.main.bounds.width/2-50, y: UIScreen.main.bounds.height/2-50, width: 100, height: 100), type: .ballClipRotateMultiple, color: .black, padding: 20.0)
            UIApplication.scene.view.addSubview(loader)
            loader.startAnimating()
            var url = "\(Constants.baseUrl)"
            url = url.replacingOccurrences(of: " ", with: "%20")
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default , headers: [:]).responseJSON { (response:AFDataResponse<Any>) in
                print(response)
                loader.stopAnimating()
                switch response.result{
                case .success(_):
                    guard let data = response.data else { return }
                    do{
                        let userModel = try JSONDecoder().decode(T.self, from: data)
                        completion(userModel)
                    }catch let error {
                        Alert.show(Errors.noInternet)
                        failure(error.localizedDescription)
                    }
                    return
                case .failure(let error):
                    failure(error.localizedDescription)
                    Alert.show(Errors.serverError)
                    return
                }
            }
        }
    }
}
