//
//  CarModel.swift
//  Guidomia
//
//  Created by Ferrakkem Bhuiyan on 2021-04-16.
//


import Foundation

// MARK: - CarModelElement
struct CarModel: Codable {
    let consList: [String]
    let customerPrice: Int
    let make: String
    let marketPrice: Int
    let model: String
    let image: String
    let prosList: [String]
    let rating: Int
}

//typealias CarModel = [CarModelElement]
