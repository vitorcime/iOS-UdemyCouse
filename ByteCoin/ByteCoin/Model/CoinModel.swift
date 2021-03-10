//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Vitor on 10/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let currency: String
    let rate: Double
    
    var rateString: String {
        return String(format: "%.1f", rate)
    }
}
