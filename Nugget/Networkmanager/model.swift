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
