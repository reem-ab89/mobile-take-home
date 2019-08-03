//
//  Extensions.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//

import UIKit

extension UIView {
    
    func implementViewStyle() {
        layer.shadowColor   = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        layer.shadowOffset  = CGSize(width: 0, height: 1.0)
        layer.shadowRadius  = 1.7
        layer.shadowOpacity = 0.45
    }
    
}

extension UIImageView {
    
    public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {
        if self.image == nil {
            self.image = PlaceHolderImage
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}
