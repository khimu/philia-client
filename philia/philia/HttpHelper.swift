//
//  HttpHelper.swift
//  philia
//
//  Created by khim ung on 7/29/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation

class HttpHelper {
    
    static let httpHelper = HttpHelper()
    
    private init() {}
    
    func sendProfile(json: AnyObject) -> Bool {
 
        do {

            let jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
            
            // create post request
            let url = NSURL(string: "https://107.170.234.144:9090/profile")!
            
            let request = NSMutableURLRequest(URL: url)
            
            request.HTTPMethod = "POST"
            
            // insert json data to the request
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            
            request.HTTPBody = jsonData
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in guard data != nil else {
                print("no data found: \(error)")
                return;
                }
               
                
                
                let responseData = String(data: data!, encoding: NSUTF8StringEncoding)
                
                print(" hi \(responseData!)");

                /*
                do {
                    if let result = try NSJSONSerialization.JSONObjectWithData(data!, options:[.AllowFragments, .MutableContainers]) as? NSArray {
                        print("Success: \(result)")
                    }
                } catch let parseError {
                    print(parseError)
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("Error could not parse JSON: '\(jsonStr!)'")
                }
 */
            }

            task.resume()
            return true;
        }catch {
            print("Error->\(error)")
        }
        return false;

            
        
        /*
        
        let urlPath: String = "http://107.170.234.144:9090/profile"
        
        let url: NSURL = NSURL(string: urlPath)!
        
        let request1: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        request1.HTTPMethod = "POST"
        

        
        let stringPost="deviceToken=123456" // Key and Value
        
        let data = stringPost.dataUsingEncoding(NSUTF8StringEncoding)
        
        request1.timeoutInterval = 60
        request1.HTTPBody=data
        request1.HTTPShouldHandleCookies=false
        
        let queue:NSOperationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    print("ASynchronous\(jsonResult)")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        })
             */
    }
}