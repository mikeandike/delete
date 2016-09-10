//
//  NetworkController.swift
//  DELETE2
//
//  Created by Michael Sacks on 9/10/16.
//  Copyright © 2016 Michael Sacks. All rights reserved.
//

import UIKit

class NetworkController {
    
    static func dataAtURL(urlString: String, completion: (data: NSData?) -> Void) {
        guard let url = NSURL(string: urlString) else { completion(data: nil); return }
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (dataFromURL, _, error) in
            if let error = error {
                print(error)
                completion(data: nil)
                return
            }
            completion(data: dataFromURL)
        }
        task.resume()
    }
    
    static func jsonFromData(data: NSData) -> [String : AnyObject]? {
        let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String : AnyObject]
        return json ?? nil
    }


    static func imageForURL(urlString: String, completion: (image: UIImage?) -> Void) {
        //Take URL :)
        //Get Data from URL :)
        //Get Image from data
        NetworkController.dataAtURL(urlString) { (data) in
            guard let data = data else { completion(image: nil); return }
            let image = UIImage(data: data)
            
            //we have an image
            //put it on the main queue 
            //pass up the image
            dispatch_async(dispatch_get_main_queue(), { 
                completion(image: image)
            })
        
            
        }
        
        
    }



}

