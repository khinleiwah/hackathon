//
//  ObjectMapping.swift
//  IBM
//
//  Created by Win on 5/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class Project: NSObject, Mappable {
    
    var projectId: Int?
    var accountId: Int?
    var dateCreated: Int?
    var dateModified: Int?
    var name: String?
    var status: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        projectId <- map["id"]
        accountId <- map["account_id"]
        dateCreated <- map["date_created"]
        dateModified <- map["date_modified"]
        name <- map["name"]
        status <- map["status"]
    }
    
}


class ResponseObject: NSObject, Mappable {
        var results:[AnyObject]?
        //var results:String?
        //var previewUrl:String?
        
        override init() {
            super.init()
        }
        
        required convenience init?(map: Map) {
            self.init()
        }
        
        func mapping(map: Map) {
            results <- map["results"]
//            artworkUrl100 <- map["artworkUrl100"]
//            previewUrl <- map["previewUrl"]
        }
}
