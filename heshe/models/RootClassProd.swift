//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 31, 2020

import Foundation


class RootClassProd : NSObject, NSCoding{

    var linksProd : LinkProd!
    var attributes : [Attribute]!
    var averageRating : String!
    var backordered : Bool!
    var backorders : String!
    var backordersAllowed : Bool!
    var buttonText : String!
    var catalogVisibility : String!
    var categories : [Category]!
    var crossSellIds : [AnyObject]!
    var dateCreated : String!
    var dateCreatedGmt : String!
    var dateModified : String!
    var dateModifiedGmt : String!
    var dateOnSaleFrom : AnyObject!
    var dateOnSaleFromGmt : AnyObject!
    var dateOnSaleTo : AnyObject!
    var dateOnSaleToGmt : AnyObject!
    var defaultAttributes : [AnyObject]!
    var descriptionField : String!
    var dimensions : Dimension!
    var downloadExpiry : Int!
    var downloadLimit : Int!
    var downloadable : Bool!
    var downloads : [AnyObject]!
    var externalUrl : String!
    var featured : Bool!
    var groupedProducts : [AnyObject]!
    var id : Int!
    var imagesProd : [ImageProd]!
    var manageStock : Bool!
    var menuOrder : Int!
    var metaData : [MetaDatum]!
    var name : String!
    var onSale : Bool!
    var parentId : Int!
    var permalink : String!
    var price : String!
    var priceHtml : String!
    var purchasable : Bool!
    var purchaseNote : String!
    var ratingCount : Int!
    var regularPrice : String!
    var relatedIds : [Int]!
    var reviewsAllowed : Bool!
    var salePrice : String!
    var shippingClass : String!
    var shippingClassId : Int!
    var shippingRequired : Bool!
    var shippingTaxable : Bool!
    var shortDescription : String!
    var sku : String!
    var slug : String!
    var soldIndividually : Bool!
    var status : String!
    var stockQuantity : Int!
    var stockStatus : String!
    var tags : [Tag]!
    var taxClass : String!
    var taxStatus : String!
    var totalSales : Int!
    var type : String!
    var upsellIds : [AnyObject]!
    var variations : [AnyObject]!
    var virtual : Bool!
    var weight : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        averageRating = dictionary["average_rating"] as? String
        backordered = dictionary["backordered"] as? Bool
        backorders = dictionary["backorders"] as? String
        backordersAllowed = dictionary["backorders_allowed"] as? Bool
        buttonText = dictionary["button_text"] as? String
        catalogVisibility = dictionary["catalog_visibility"] as? String
        dateCreated = dictionary["date_created"] as? String
        dateCreatedGmt = dictionary["date_created_gmt"] as? String
        dateModified = dictionary["date_modified"] as? String
        dateModifiedGmt = dictionary["date_modified_gmt"] as? String
        dateOnSaleFrom = dictionary["date_on_sale_from"] as? AnyObject
        dateOnSaleFromGmt = dictionary["date_on_sale_from_gmt"] as? AnyObject
        dateOnSaleTo = dictionary["date_on_sale_to"] as? AnyObject
        dateOnSaleToGmt = dictionary["date_on_sale_to_gmt"] as? AnyObject
        descriptionField = dictionary["description"] as? String
        downloadExpiry = dictionary["download_expiry"] as? Int
        downloadLimit = dictionary["download_limit"] as? Int
        downloadable = dictionary["downloadable"] as? Bool
        externalUrl = dictionary["external_url"] as? String
        featured = dictionary["featured"] as? Bool
        id = dictionary["id"] as? Int
        manageStock = dictionary["manage_stock"] as? Bool
        menuOrder = dictionary["menu_order"] as? Int
        name = dictionary["name"] as? String
        onSale = dictionary["on_sale"] as? Bool
        parentId = dictionary["parent_id"] as? Int
        permalink = dictionary["permalink"] as? String
        price = dictionary["price"] as? String
        priceHtml = dictionary["price_html"] as? String
        purchasable = dictionary["purchasable"] as? Bool
        purchaseNote = dictionary["purchase_note"] as? String
        ratingCount = dictionary["rating_count"] as? Int
        regularPrice = dictionary["regular_price"] as? String
        reviewsAllowed = dictionary["reviews_allowed"] as? Bool
        salePrice = dictionary["sale_price"] as? String
        shippingClass = dictionary["shipping_class"] as? String
        shippingClassId = dictionary["shipping_class_id"] as? Int
        shippingRequired = dictionary["shipping_required"] as? Bool
        shippingTaxable = dictionary["shipping_taxable"] as? Bool
        shortDescription = dictionary["short_description"] as? String
        sku = dictionary["sku"] as? String
        slug = dictionary["slug"] as? String
        soldIndividually = dictionary["sold_individually"] as? Bool
        status = dictionary["status"] as? String
        stockQuantity = dictionary["stock_quantity"] as? Int
        stockStatus = dictionary["stock_status"] as? String
        taxClass = dictionary["tax_class"] as? String
        taxStatus = dictionary["tax_status"] as? String
        totalSales = dictionary["total_sales"] as? Int
        type = dictionary["type"] as? String
        virtual = dictionary["virtual"] as? Bool
        weight = dictionary["weight"] as? String
        if let linksData = dictionary["_links"] as? [String:Any]{
            links = Link(fromDictionary: linksData)
        }
        if let dimensionsData = dictionary["dimensions"] as? [String:Any]{
            dimensions = Dimension(fromDictionary: dimensionsData)
        }
        attributes = [Attribute]()
        if let attributesArray = dictionary["attributes"] as? [[String:Any]]{
            for dic in attributesArray{
                let value = Attribute(fromDictionary: dic)
                attributes.append(value)
            }
        }
        categories = [Category]()
        if let categoriesArray = dictionary["categories"] as? [[String:Any]]{
            for dic in categoriesArray{
                let value = Category(fromDictionary: dic)
                categories.append(value)
            }
        }
        images = [Image]()
        if let imagesArray = dictionary["images"] as? [[String:Any]]{
            for dic in imagesArray{
                let value = Image(fromDictionary: dic)
                images.append(value)
            }
        }
        metaData = [MetaDatum]()
        if let metaDataArray = dictionary["meta_data"] as? [[String:Any]]{
            for dic in metaDataArray{
                let value = MetaDatum(fromDictionary: dic)
                metaData.append(value)
            }
        }
        tags = [Tag]()
        if let tagsArray = dictionary["tags"] as? [[String:Any]]{
            for dic in tagsArray{
                let value = Tag(fromDictionary: dic)
                tags.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if averageRating != nil{
            dictionary["average_rating"] = averageRating
        }
        if backordered != nil{
            dictionary["backordered"] = backordered
        }
        if backorders != nil{
            dictionary["backorders"] = backorders
        }
        if backordersAllowed != nil{
            dictionary["backorders_allowed"] = backordersAllowed
        }
        if buttonText != nil{
            dictionary["button_text"] = buttonText
        }
        if catalogVisibility != nil{
            dictionary["catalog_visibility"] = catalogVisibility
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
        if dateOnSaleFrom != nil{
            dictionary["date_on_sale_from"] = dateOnSaleFrom
        }
        if dateOnSaleFromGmt != nil{
            dictionary["date_on_sale_from_gmt"] = dateOnSaleFromGmt
        }
        if dateOnSaleTo != nil{
            dictionary["date_on_sale_to"] = dateOnSaleTo
        }
        if dateOnSaleToGmt != nil{
            dictionary["date_on_sale_to_gmt"] = dateOnSaleToGmt
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if downloadExpiry != nil{
            dictionary["download_expiry"] = downloadExpiry
        }
        if downloadLimit != nil{
            dictionary["download_limit"] = downloadLimit
        }
        if downloadable != nil{
            dictionary["downloadable"] = downloadable
        }
        if externalUrl != nil{
            dictionary["external_url"] = externalUrl
        }
        if featured != nil{
            dictionary["featured"] = featured
        }
        if id != nil{
            dictionary["id"] = id
        }
        if manageStock != nil{
            dictionary["manage_stock"] = manageStock
        }
        if menuOrder != nil{
            dictionary["menu_order"] = menuOrder
        }
        if name != nil{
            dictionary["name"] = name
        }
        if onSale != nil{
            dictionary["on_sale"] = onSale
        }
        if parentId != nil{
            dictionary["parent_id"] = parentId
        }
        if permalink != nil{
            dictionary["permalink"] = permalink
        }
        if price != nil{
            dictionary["price"] = price
        }
        if priceHtml != nil{
            dictionary["price_html"] = priceHtml
        }
        if purchasable != nil{
            dictionary["purchasable"] = purchasable
        }
        if purchaseNote != nil{
            dictionary["purchase_note"] = purchaseNote
        }
        if ratingCount != nil{
            dictionary["rating_count"] = ratingCount
        }
        if regularPrice != nil{
            dictionary["regular_price"] = regularPrice
        }
        if reviewsAllowed != nil{
            dictionary["reviews_allowed"] = reviewsAllowed
        }
        if salePrice != nil{
            dictionary["sale_price"] = salePrice
        }
        if shippingClass != nil{
            dictionary["shipping_class"] = shippingClass
        }
        if shippingClassId != nil{
            dictionary["shipping_class_id"] = shippingClassId
        }
        if shippingRequired != nil{
            dictionary["shipping_required"] = shippingRequired
        }
        if shippingTaxable != nil{
            dictionary["shipping_taxable"] = shippingTaxable
        }
        if shortDescription != nil{
            dictionary["short_description"] = shortDescription
        }
        if sku != nil{
            dictionary["sku"] = sku
        }
        if slug != nil{
            dictionary["slug"] = slug
        }
        if soldIndividually != nil{
            dictionary["sold_individually"] = soldIndividually
        }
        if status != nil{
            dictionary["status"] = status
        }
        if stockQuantity != nil{
            dictionary["stock_quantity"] = stockQuantity
        }
        if stockStatus != nil{
            dictionary["stock_status"] = stockStatus
        }
        if taxClass != nil{
            dictionary["tax_class"] = taxClass
        }
        if taxStatus != nil{
            dictionary["tax_status"] = taxStatus
        }
        if totalSales != nil{
            dictionary["total_sales"] = totalSales
        }
        if type != nil{
            dictionary["type"] = type
        }
        if virtual != nil{
            dictionary["virtual"] = virtual
        }
        if weight != nil{
            dictionary["weight"] = weight
        }
        if links != nil{
            dictionary["links"] = links.toDictionary()
        }
        if dimensions != nil{
            dictionary["dimensions"] = dimensions.toDictionary()
        }
        if attributes != nil{
            var dictionaryElements = [[String:Any]]()
            for attributesElement in attributes {
                dictionaryElements.append(attributesElement.toDictionary())
            }
            dictionary["attributes"] = dictionaryElements
        }
        if categories != nil{
            var dictionaryElements = [[String:Any]]()
            for categoriesElement in categories {
                dictionaryElements.append(categoriesElement.toDictionary())
            }
            dictionary["categories"] = dictionaryElements
        }
        if images != nil{
            var dictionaryElements = [[String:Any]]()
            for imagesElement in images {
                dictionaryElements.append(imagesElement.toDictionary())
            }
            dictionary["images"] = dictionaryElements
        }
        if metaData != nil{
            var dictionaryElements = [[String:Any]]()
            for metaDataElement in metaData {
                dictionaryElements.append(metaDataElement.toDictionary())
            }
            dictionary["metaData"] = dictionaryElements
        }
        if tags != nil{
            var dictionaryElements = [[String:Any]]()
            for tagsElement in tags {
                dictionaryElements.append(tagsElement.toDictionary())
            }
            dictionary["tags"] = dictionaryElements
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
        attributes = aDecoder.decodeObject(forKey: "attributes") as? [Attribute]
        averageRating = aDecoder.decodeObject(forKey: "average_rating") as? String
        backordered = aDecoder.decodeObject(forKey: "backordered") as? Bool
        backorders = aDecoder.decodeObject(forKey: "backorders") as? String
        backordersAllowed = aDecoder.decodeObject(forKey: "backorders_allowed") as? Bool
        buttonText = aDecoder.decodeObject(forKey: "button_text") as? String
        catalogVisibility = aDecoder.decodeObject(forKey: "catalog_visibility") as? String
        categories = aDecoder.decodeObject(forKey: "categories") as? [Category]
        crossSellIds = aDecoder.decodeObject(forKey: "cross_sell_ids") as? [AnyObject]
        dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
        dateCreatedGmt = aDecoder.decodeObject(forKey: "date_created_gmt") as? String
        dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
        dateModifiedGmt = aDecoder.decodeObject(forKey: "date_modified_gmt") as? String
        dateOnSaleFrom = aDecoder.decodeObject(forKey: "date_on_sale_from") as? AnyObject
        dateOnSaleFromGmt = aDecoder.decodeObject(forKey: "date_on_sale_from_gmt") as? AnyObject
        dateOnSaleTo = aDecoder.decodeObject(forKey: "date_on_sale_to") as? AnyObject
        dateOnSaleToGmt = aDecoder.decodeObject(forKey: "date_on_sale_to_gmt") as? AnyObject
        defaultAttributes = aDecoder.decodeObject(forKey: "default_attributes") as? [AnyObject]
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        dimensions = aDecoder.decodeObject(forKey: "dimensions") as? Dimension
        downloadExpiry = aDecoder.decodeObject(forKey: "download_expiry") as? Int
        downloadLimit = aDecoder.decodeObject(forKey: "download_limit") as? Int
        downloadable = aDecoder.decodeObject(forKey: "downloadable") as? Bool
        downloads = aDecoder.decodeObject(forKey: "downloads") as? [AnyObject]
        externalUrl = aDecoder.decodeObject(forKey: "external_url") as? String
        featured = aDecoder.decodeObject(forKey: "featured") as? Bool
        groupedProducts = aDecoder.decodeObject(forKey: "grouped_products") as? [AnyObject]
        id = aDecoder.decodeObject(forKey: "id") as? Int
        images = aDecoder.decodeObject(forKey: "images") as? [Image]
        manageStock = aDecoder.decodeObject(forKey: "manage_stock") as? Bool
        menuOrder = aDecoder.decodeObject(forKey: "menu_order") as? Int
        metaData = aDecoder.decodeObject(forKey: "meta_data") as? [MetaDatum]
        name = aDecoder.decodeObject(forKey: "name") as? String
        onSale = aDecoder.decodeObject(forKey: "on_sale") as? Bool
        parentId = aDecoder.decodeObject(forKey: "parent_id") as? Int
        permalink = aDecoder.decodeObject(forKey: "permalink") as? String
        price = aDecoder.decodeObject(forKey: "price") as? String
        priceHtml = aDecoder.decodeObject(forKey: "price_html") as? String
        purchasable = aDecoder.decodeObject(forKey: "purchasable") as? Bool
        purchaseNote = aDecoder.decodeObject(forKey: "purchase_note") as? String
        ratingCount = aDecoder.decodeObject(forKey: "rating_count") as? Int
        regularPrice = aDecoder.decodeObject(forKey: "regular_price") as? String
        relatedIds = aDecoder.decodeObject(forKey: "related_ids") as? [Int]
        reviewsAllowed = aDecoder.decodeObject(forKey: "reviews_allowed") as? Bool
        salePrice = aDecoder.decodeObject(forKey: "sale_price") as? String
        shippingClass = aDecoder.decodeObject(forKey: "shipping_class") as? String
        shippingClassId = aDecoder.decodeObject(forKey: "shipping_class_id") as? Int
        shippingRequired = aDecoder.decodeObject(forKey: "shipping_required") as? Bool
        shippingTaxable = aDecoder.decodeObject(forKey: "shipping_taxable") as? Bool
        shortDescription = aDecoder.decodeObject(forKey: "short_description") as? String
        sku = aDecoder.decodeObject(forKey: "sku") as? String
        slug = aDecoder.decodeObject(forKey: "slug") as? String
        soldIndividually = aDecoder.decodeObject(forKey: "sold_individually") as? Bool
        status = aDecoder.decodeObject(forKey: "status") as? String
        stockQuantity = aDecoder.decodeObject(forKey: "stock_quantity") as? Int
        stockStatus = aDecoder.decodeObject(forKey: "stock_status") as? String
        tags = aDecoder.decodeObject(forKey: "tags") as? [Tag]
        taxClass = aDecoder.decodeObject(forKey: "tax_class") as? String
        taxStatus = aDecoder.decodeObject(forKey: "tax_status") as? String
        totalSales = aDecoder.decodeObject(forKey: "total_sales") as? Int
        type = aDecoder.decodeObject(forKey: "type") as? String
        upsellIds = aDecoder.decodeObject(forKey: "upsell_ids") as? [AnyObject]
        variations = aDecoder.decodeObject(forKey: "variations") as? [AnyObject]
        virtual = aDecoder.decodeObject(forKey: "virtual") as? Bool
        weight = aDecoder.decodeObject(forKey: "weight") as? String
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
        if attributes != nil{
            aCoder.encode(attributes, forKey: "attributes")
        }
        if averageRating != nil{
            aCoder.encode(averageRating, forKey: "average_rating")
        }
        if backordered != nil{
            aCoder.encode(backordered, forKey: "backordered")
        }
        if backorders != nil{
            aCoder.encode(backorders, forKey: "backorders")
        }
        if backordersAllowed != nil{
            aCoder.encode(backordersAllowed, forKey: "backorders_allowed")
        }
        if buttonText != nil{
            aCoder.encode(buttonText, forKey: "button_text")
        }
        if catalogVisibility != nil{
            aCoder.encode(catalogVisibility, forKey: "catalog_visibility")
        }
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }
        if crossSellIds != nil{
            aCoder.encode(crossSellIds, forKey: "cross_sell_ids")
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
        if dateOnSaleFrom != nil{
            aCoder.encode(dateOnSaleFrom, forKey: "date_on_sale_from")
        }
        if dateOnSaleFromGmt != nil{
            aCoder.encode(dateOnSaleFromGmt, forKey: "date_on_sale_from_gmt")
        }
        if dateOnSaleTo != nil{
            aCoder.encode(dateOnSaleTo, forKey: "date_on_sale_to")
        }
        if dateOnSaleToGmt != nil{
            aCoder.encode(dateOnSaleToGmt, forKey: "date_on_sale_to_gmt")
        }
        if defaultAttributes != nil{
            aCoder.encode(defaultAttributes, forKey: "default_attributes")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if dimensions != nil{
            aCoder.encode(dimensions, forKey: "dimensions")
        }
        if downloadExpiry != nil{
            aCoder.encode(downloadExpiry, forKey: "download_expiry")
        }
        if downloadLimit != nil{
            aCoder.encode(downloadLimit, forKey: "download_limit")
        }
        if downloadable != nil{
            aCoder.encode(downloadable, forKey: "downloadable")
        }
        if downloads != nil{
            aCoder.encode(downloads, forKey: "downloads")
        }
        if externalUrl != nil{
            aCoder.encode(externalUrl, forKey: "external_url")
        }
        if featured != nil{
            aCoder.encode(featured, forKey: "featured")
        }
        if groupedProducts != nil{
            aCoder.encode(groupedProducts, forKey: "grouped_products")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if images != nil{
            aCoder.encode(images, forKey: "images")
        }
        if manageStock != nil{
            aCoder.encode(manageStock, forKey: "manage_stock")
        }
        if menuOrder != nil{
            aCoder.encode(menuOrder, forKey: "menu_order")
        }
        if metaData != nil{
            aCoder.encode(metaData, forKey: "meta_data")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if onSale != nil{
            aCoder.encode(onSale, forKey: "on_sale")
        }
        if parentId != nil{
            aCoder.encode(parentId, forKey: "parent_id")
        }
        if permalink != nil{
            aCoder.encode(permalink, forKey: "permalink")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if priceHtml != nil{
            aCoder.encode(priceHtml, forKey: "price_html")
        }
        if purchasable != nil{
            aCoder.encode(purchasable, forKey: "purchasable")
        }
        if purchaseNote != nil{
            aCoder.encode(purchaseNote, forKey: "purchase_note")
        }
        if ratingCount != nil{
            aCoder.encode(ratingCount, forKey: "rating_count")
        }
        if regularPrice != nil{
            aCoder.encode(regularPrice, forKey: "regular_price")
        }
        if relatedIds != nil{
            aCoder.encode(relatedIds, forKey: "related_ids")
        }
        if reviewsAllowed != nil{
            aCoder.encode(reviewsAllowed, forKey: "reviews_allowed")
        }
        if salePrice != nil{
            aCoder.encode(salePrice, forKey: "sale_price")
        }
        if shippingClass != nil{
            aCoder.encode(shippingClass, forKey: "shipping_class")
        }
        if shippingClassId != nil{
            aCoder.encode(shippingClassId, forKey: "shipping_class_id")
        }
        if shippingRequired != nil{
            aCoder.encode(shippingRequired, forKey: "shipping_required")
        }
        if shippingTaxable != nil{
            aCoder.encode(shippingTaxable, forKey: "shipping_taxable")
        }
        if shortDescription != nil{
            aCoder.encode(shortDescription, forKey: "short_description")
        }
        if sku != nil{
            aCoder.encode(sku, forKey: "sku")
        }
        if slug != nil{
            aCoder.encode(slug, forKey: "slug")
        }
        if soldIndividually != nil{
            aCoder.encode(soldIndividually, forKey: "sold_individually")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if stockQuantity != nil{
            aCoder.encode(stockQuantity, forKey: "stock_quantity")
        }
        if stockStatus != nil{
            aCoder.encode(stockStatus, forKey: "stock_status")
        }
        if tags != nil{
            aCoder.encode(tags, forKey: "tags")
        }
        if taxClass != nil{
            aCoder.encode(taxClass, forKey: "tax_class")
        }
        if taxStatus != nil{
            aCoder.encode(taxStatus, forKey: "tax_status")
        }
        if totalSales != nil{
            aCoder.encode(totalSales, forKey: "total_sales")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if upsellIds != nil{
            aCoder.encode(upsellIds, forKey: "upsell_ids")
        }
        if variations != nil{
            aCoder.encode(variations, forKey: "variations")
        }
        if virtual != nil{
            aCoder.encode(virtual, forKey: "virtual")
        }
        if weight != nil{
            aCoder.encode(weight, forKey: "weight")
        }
    }
}
