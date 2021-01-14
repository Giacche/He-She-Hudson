//
//  prodLink.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 31, 2020

import Foundation


class prodLink : NSObject, NSCoding{

    var collection : [prodCollection]!
    var selfPro : [prodSelf]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        collection = [prodCollection]()
        if let collectionArray = dictionary["collection"] as? [[String:Any]]{
            for dic in collectionArray{
                let value = prodCollection(fromDictionary: dic)
                collection.append(value)
            }
        }
        selfPro = [prodSelf]()
        if let selfArray = dictionary["selfPro"] as? [[String:Any]]{
            for dic in selfArray{
                let value = prodSelf(fromDictionary: dic)
                selfPro.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if collection != nil{
            var dictionaryElements = [[String:Any]]()
            for collectionElement in collection {
                dictionaryElements.append(collectionElement.toDictionary())
            }
            dictionary["collection"] = dictionaryElements
        }
        if self != nil{
            var dictionaryElements = [[String:Any]]()
            for selfElement in selfPro {
                dictionaryElements.append(selfElement.toDictionary())
            }
            dictionary["selfPro"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        collection = aDecoder.decodeObject(forKey: "collection") as? [prodCollection]
        selfPro = aDecoder.decodeObject(forKey: "selfPro") as? [prodSelf]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if collection != nil{
            aCoder.encode(collection, forKey: "collection")
        }
        if self != nil{
            aCoder.encode(self, forKey: "self")
        }
    }
}
