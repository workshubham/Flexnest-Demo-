//
//  AlamofireRequestManager.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import Foundation
import Alamofire

class AlamoRequestManager: RequestGeneratorProtocol {
    
    static let shared = AlamoRequestManager()
    private init() {}
    
    func requestDataFor(_ strURL: URLConvertible, methodType: HTTPMethod, params: [String: Any]?,
                        onSuccess:@escaping ([String: Any]?) -> Void,
                        onError:@escaping (Error?) -> Void ) {
        var encode: ParameterEncoding = JSONEncoding.default
        if methodType == .get {
            encode = URLEncoding.default
        }
        let headerDict = headerParams
        AF.request(strURL, method: methodType, parameters: params, encoding: encode, headers: headerDict).responseJSON {(response) in

            switch response.result {
            case .success:
                if let data = response.value as? [String: Any] {
                    onSuccess(data)
                }
                
            case .failure(let error):
                
                onError(error)

            }
        }
    }
}
