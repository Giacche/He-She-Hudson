//
//  Attribute.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 31, 2020

import Foundation


class Attribute : NSObject, NSCoding{

    var id : Int!
    var name : String!
    var options : [String]!
    var position : Int!
    var variation : Bool!
    var visible : Bool!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        position = dictionary["position"] as? Int
        variation = dictionary["variation"] as? Bool
        visible = dictionary["visible"] as? Bool
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if position != nil{
            dictionary["position"] = position
        }
        if variation != nil{
            dictionary["variation"] = variation
        }
        if visible != nil{
            dictionary["visible"] = visible
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        options = aDecoder.decodeObject(forKey: "options") as? [String]
        position = aDecoder.decodeObject(forKey: "position") as? Int
        variation = aDecoder.decodeObject(forKey: "variation") as? Bool
        visible = aDecoder.decodeObject(forKey: "visible") as? Bool
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if options != nil{
            aCoder.encode(options, forKey: "options")
        }
        if position != nil{
            aCoder.encode(position, forKey: "position")
        }
        if variation != nil{
            aCoder.encode(variation, forKey: "variation")
        }
        if visible != nil{
            aCoder.encode(visible, forKey: "visible")
        }
    }
}