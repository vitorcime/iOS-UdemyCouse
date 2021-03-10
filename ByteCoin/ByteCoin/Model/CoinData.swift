//
//  CoinData.swift
//  ByteCoin
//
//  Created by Vitor on 10/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Decodable {
    var rate: Double
    var asset_id_quote: String
}
