//
//  APIManager.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//

import UIKit
import Foundation

class APIManager: NSObject {
    
    struct ServiceIdentifiers {
        static let getEpisodes   = "/api/episode"
    }
    
    let baseURL = "https://rickandmortyapi.com"
    static let sharedInstance = APIManager()
    
    let getMethod = "GET"
    var serviceQueue = [APIManager]()
    
    fileprivate override init() { }
    
    func getData(serviceIdentifier:String,completion: @escaping (_ response:AnyObject,_ ServiceIdentifier:String) ->(), onError: @escaping (_ error:Error,_ serviceIdentifier:String) ->()) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "\(baseURL)\(serviceIdentifier)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = getMethod
        
        let session  = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                if let dataNew = data, let responseString = String(data: dataNew, encoding: .utf8) {
                    print("-----Get Data Response-----")
                    print(responseString)
                    print("---------------------------")
                    
                    let dict = self.convertToDictionary(text: responseString)
                    print(dict?["results"] as Any)
                    guard let results = dict?["results"] as? NSArray else { return }
                    completion(results as AnyObject, serviceIdentifier)
                }
            }
        })
        dataTask.resume()
    }
    
    @objc func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}
