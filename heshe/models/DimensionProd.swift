//
//  Dimension.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 31, 2020

import Foundation


class Dimension : NSObject, NSCoding{

    var height : String!
    var length : String!
    var width : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        height = dictionary["height"] as? String
        length = dictionary["length"] as? String
        width = dictionary["width"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if height != nil{
            dictionary["height"] = height
        }
        if length != nil{
            dictionary["length"] = length
        }
        if width != nil{
            dictionary["width"] = width
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        height = aDecoder.decodeObject(forKey: "height") as? String
        length = aDecoder.decodeObject(forKey: "length") as? String
        width = aDecoder.decodeObject(forKey: "width") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if length != nil{
            aCoder.encode(length, forKey: "length")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }
    }
}