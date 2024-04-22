//
//  model.swift
//  Nugget
//
//  Created by Palatip Jantawong on 17/4/2567 BE.
//

import Foundation

struct slipResponse: Codable {
    let slip: Slip
}

struct Slip: Codable, Identifiable {
    let id: Int
    let advice: String
}


struct dataResponse: Codable {
    let data: [dataModel]
}

struct dataModel: Codable {
    let tableId: String
    let tableOrder: [tableOrder]
}

struct tableOrder: Codable {
    let menuId: String
}
