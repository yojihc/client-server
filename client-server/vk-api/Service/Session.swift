//
//  Session.swift
//  client-server
//
//  Created by yoji on 10.12.2021.
//

import Foundation


final class Session {
    
    private init() {}
    
    static let shared = Session()
    
    var token = ""
    var userID = ""
  
}
