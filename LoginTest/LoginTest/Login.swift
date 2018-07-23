//
//  Login.swift
//  LoginTest
//
//  Created by Codenation10 on 17/07/2018.
//  Copyright © 2018 Codenation. All rights reserved.
//

import Foundation
import UIKit

class CordLessURLSession : URLSession {
    
    enum sessionData {
        case None
        case Empty
        case JSON([String : AnyObject])
    }
    
    typealias CompletionHandler = (NSData?, URLResponse, NSError) -> Void
    
    private var response : HTTPURLResponse?
    private var data : NSData
    private var error : NSError
    
    init(response : HTTPURLResponse?, data : sessionData = .JSON(["name" : "JSON" as AnyObject]), error : NSError) {
        self.response = response
    }
    
    /*
    func DoLogin(_ user:String, _ psw:String) {
        let url = URL(string: "http://www.creatStubNetwork.com/login/api")
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url!)
        
        let paramtToSend = "username" + user + "&password=" + psw
        
        request.httpBody = paramtToSend.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            guard let _:Data = data else {
                return
            }
            
            let json:Any?
            
            do {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch {
                return
            }
            
            guard let server_response = json as? NSDictionary else {
                return
            }
            
        }
    }
    */
    
}
