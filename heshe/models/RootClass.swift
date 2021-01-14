//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 30, 2020

import Foundation


class RootClass : NSObject, NSCoding{

    var links : Link!
    var count : Int!
    var descriptionField : String!
    var display : String!
    var id : Int!
    var image : Image!
    var menuOrder : Int!
    var name : String!
    var parent : Int!
    var slug : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        count = dictionary["count"] as? Int
        descriptionField = dictionary["description"] as? String
        display = dictionary["display"] as? String
        id = dictionary["id"] as? Int
        menuOrder = dictionary["menu_order"] as? Int
        name = dictionary["name"] as? String
        parent = dictionary["parent"] as? Int
        slug = dictionary["slug"] as? String
        if let linksData = dictionary["_links"] as? [String:Any]{
            links = Link(fromDictionary: linksData)
        }
        if let imageData = dictionary["image"] as? [String:Any]{
            image = Image(fromDictionary: imageData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if count != nil{
            dictionary["count"] = count
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if display != nil{
            dictionary["display"] = display
        }
        if id != nil{
            dictionary["id"] = id
        }
        if menuOrder != nil{
            dictionary["menu_order"] = menuOrder
        }
        if name != nil{
            dictionary["name"] = name
        }
        if parent != nil{
            dictionary["parent"] = parent
        }
        if slug != nil{
            dictionary["slug"] = slug
        }
        if links != nil{
            dictionary["links"] = links.toDictionary()
        }
        if image != nil{
            dictionary["image"] = image.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        links = aDecoder.decodeObject(forKey: "_links") as? Link
        count = aDecoder.decodeObject(forKey: "count") as? Int
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        display = aDecoder.decodeObject(forKey: "display") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? Image
        menuOrder = aDecoder.decodeObject(forKey: "menu_order") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        parent = aDecoder.decodeObject(forKey: "parent") as? Int
        slug = aDecoder.decodeObject(forKey: "slug") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if links != nil{
            aCoder.encode(links, forKey: "_links")
        }
        if count != nil{
            aCoder.encode(count, forKey: "count")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if display != nil{
            aCoder.encode(display, forKey: "display")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if menuOrder != nil{
            aCoder.encode(menuOrder, forKey: "menu_order")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if parent != nil{
            aCoder.encode(parent, forKey: "parent")
        }
        if slug != nil{
            aCoder.encode(slug, forKey: "slug")
        }
    }
}