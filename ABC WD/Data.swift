//
//  Data.swift
//  ABC WD
//
//  Created by Nick on 4/15/15.
//  Copyright (c) 2015 Nick. All rights reserved.
//

import Foundation

let key = "9066f390c887e57b74d61f482cc57afe"
let catalogRequest = "http://services.wine.com/api/beta2/service.svc/json/catalog?apikey=\(key)"

class Data {
    
    class func getWineCatalogWithSuccess(success: ((wineData: NSData!) -> Void)) {
        loadDataFromURL(NSURL(string: catalogRequest)!, completion: { (data, error) -> Void in
            if let urlData = data {
                success(wineData: urlData)
            }
        })
    }
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
    
}