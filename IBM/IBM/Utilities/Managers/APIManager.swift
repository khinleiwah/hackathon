//
//  File.swift
//  IBM
//
//  Created by Win on 5/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import PKHUD

typealias APICallSuccess = (_ data: Any) -> Void
typealias APICallFail = (_ error: Error) -> Void

class APIManager {
    
    static let shared = APIManager.init()
    
    func baseCall(data: Any?, apiCallSuccess: APICallSuccess?, apiCallFail: APICallFail? ) {
        HUD.show(.progress)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            HUD.flash(.success, delay: 1.0)
            apiCallSuccess?("Success")
        }
    }
    
    func login(_ name: String ,_ pin: String, apiCallSuccess: APICallSuccess?=nil, apiCallFail: APICallFail?=nil ) {
        baseCall(data: nil, apiCallSuccess: apiCallSuccess, apiCallFail: apiCallFail)
    }
//    func getMonkListByPageIndex(index:Int,completionHandler:@escaping completionResultBlock){
//        Alamofire.request(String(format:Constants.URL.getMonksListURL,"\(index)"), method: .post, encoding: URLEncoding.default).responseArray { (response: DataResponse<[ResponseObject]>) in
//            if let result = response.result.value {
//                completionHandler(response.result.isSuccess, result)
//            }
//        }
//    }
    
//

//    func fetchAllTracks(url:String,completionHandler:@escaping ([ResponseObject]?)->()) {
//        
//        Alamofire.request(url,
//                          parameters: nil,
//                          headers: nil).responseArray(keyPath: "results") { (response: DataResponse<[Track]>) in
//                            let projects = response.result.value
//                            completionHandler(projects)
//        }
//        
//    }
            // 2
//            .responseJSON { response in
//                guard response.result.isSuccess,
//                    let value = response.result.value else {
//                        print("Error while fetching tags: \(String(describing: response.result.error))")
//                        completionHandler(nil)
//                        return
//                }
//
//                // 3
//                //                let tags = Json(value)["results"][0]["tags"].array?.map { json in
//                //                    json["tag"].stringValue
//                //                }
//                print("tags \(value)")
//
//                // 4
//
//                completionHandler(value as? [ResponseObject])
//        }
//    }
}
