//
//  mySession.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 17.09.2021.
//

import Foundation

class mySession {
   
    static var shared = mySession()
    private init(){}
    
    var token = String()
    var userId = Int()

}
