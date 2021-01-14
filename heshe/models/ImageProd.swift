//
//  Image.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 31, 2020

import Foundation


class Image : NSObject, NSCoding{

    var alt : String!
    var dateCreated : String!
    var dateCreatedGmt : String!
    var dateModified : String!
    var dateModifiedGmt : String!
    var id : Int!
    var name : String!
    var src : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        alt = dictionary["alt"] as? String
        dateCreated = dictionary["date_created"] as? String
        dateCreatedGmt = dictionary["date_created_gmt"] as? String
        dateModified = dictionary["date_modified"] as? String
        dateModifiedGmt = dictionary["date_modified_gmt"] as? String
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        src = dictionary["src"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if alt != nil{
            dictionary["alt"] = alt
        }
        if dateCreated != nil{
            dictionary["date_created"] = dateCreated
        }
        if dateCreatedGmt != nil{
            dictionary["date_created_gmt"] = dateCreatedGmt
        }
        if dateModified != nil{
            dictionary["date_modified"] = dateModified
        }
        if dateModifiedGmt != nil{
            dictionary["date_modified_gmt"] = dateModifiedGmt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if src != nil{
            dictionary["src"] = src
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        alt = aDecoder.decodeObject(forKey: "alt") as? String
        dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
        dateCreatedGmt = aDecoder.decodeObject(forKey: "date_created_gmt") as? String
        dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
        dateModifiedGmt = aDecoder.decodeObject(forKey: "date_modified_gmt") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        src = aDecoder.decodeObject(forKey: "src") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if alt != nil{
            aCoder.encode(alt, forKey: "alt")
        }
        if dateCreated != nil{
            aCoder.encode(dateCreated, forKey: "date_created")
        }
        if dateCreatedGmt != nil{
            aCoder.encode(dateCreatedGmt, forKey: "date_created_gmt")
        }
        if dateModified != nil{
            aCoder.encode(dateModified, forKey: "date_modified")
        }
        if dateModifiedGmt != nil{
            aCoder.encode(dateModifiedGmt, forKey: "date_modified_gmt")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if src != nil{
            aCoder.encode(src, forKey: "src")
        }
    }
}