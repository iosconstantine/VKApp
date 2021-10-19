//
//  Session.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 17.09.2021.
//

import Foundation

class Session {
   
    static var shared = Session()
    private init(){}
    
    var token: String = ""
    var userId: Int = 0
    let versionApi = 5.131

}
