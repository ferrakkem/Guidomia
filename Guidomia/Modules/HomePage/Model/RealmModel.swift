//
//  RealmModel.swift
//  Guidomia
//
//  Created by Ferrakkem Bhuiyan on 2021-04-21.
//

import Foundation
import RealmSwift

class RealmModel:Object {
    @objc dynamic var customerPrice: Int = 0
    @objc dynamic var marketPrice: Int = 0
    @objc dynamic var make = ""
    @objc dynamic var model = ""
    @objc dynamic var image = ""
    @objc dynamic var rating: Int = 0
    
    var consList = List<ConsList>()
    var prosList = List<ProsList>()
    

}

class ConsList: Object {
    @objc dynamic var list = ""
    dynamic var parentCons = LinkingObjects(fromType: ConsList.self, property: "consList")
}

class ProsList: Object {
    @objc dynamic var list = ""
    dynamic var parentPros = LinkingObjects(fromType: ProsList.self, property: "prosList")
}

/*
     let consList: [String]
     let customerPrice: Int
     let make: String
     let marketPrice: Int
     let model: String
     let image: String
     let prosList: [String]
     let rating: Int

 */
