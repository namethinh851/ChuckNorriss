//
//  FunFactsSource.swift
//  FunFacts
//
//  Created by Ted Lam on 7/18/16.
//  Copyright © 2016 Ted Lam. All rights reserved.
//

import Foundation
import GameKit
import Alamofire

struct FactSource{
    let facts = ["1","2","3","4","5","6","7","8"]
    
    func randomFacts()-> String{
        let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: facts.count)
        return facts[randomNum]
    }
    
}

class FactsSource{
    
    typealias JSONStandard = [String : AnyObject]
    
    private var _quote: String!
    
    
    var quote: String{
        if _quote == nil{
            _quote = ""
        }
        return _quote
    }
    
    
    func callAlamo(){
        Alamofire.request("https://api.chucknorris.io/jokes/random").responseJSON(completionHandler: {
            reponse in
            self.parseData(JSONData: reponse.data!)
        })
        
    }
    
    func parseData (JSONData: Data){
        do{
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            if let quote = readableJSON["value"] as? String{
                self._quote = quote
            }
            
        }
        catch {
            print (error)
        }
    }
    
}



