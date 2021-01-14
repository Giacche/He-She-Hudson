//
//  Link.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 30, 2020

import Foundation


class Link : NSObject, NSCoding{

    var collection : [Collection]!
    var selfCat : [SelfCat]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        collection = [Collection]()
        if let collectionArray = dictionary["collection"] as? [[String:Any]]{
            for dic in collectionArray{
                let value = Collection(fromDictionary: dic)
                collection.append(value)
            }
        }
        selfCat = [SelfCat]()
        if let selfArray = dictionary["self"] as? [[String:Any]]{
            for dic in selfArray{
                let value = SelfCat(fromDictionary: dic)
                selfCat.append(value)
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
        if selfCat != nil{
            var dictionaryElements = [[String:Any]]()
            for selfElement in selfCat {
                dictionaryElements.append(selfElement.toDictionary())
            }
            dictionary["self"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        collection = aDecoder.decodeObject(forKey: "collection") as? [Collection]
        selfCat = aDecoder.decodeObject(forKey: "self") as? [SelfCat]
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
