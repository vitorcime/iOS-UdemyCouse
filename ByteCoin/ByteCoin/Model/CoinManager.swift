//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coinModel: CoinModel)
    func didFail(with error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "EED887F9-5222-40BE-B742-A7F898796669"
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration:  .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data {
                    if let info = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCoin(self, coinModel: info)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let currency = decodedData.asset_id_quote
            let rate = decodedData.rate
            
            let coin = CoinModel(currency: currency, rate: rate)
            return coin
        } catch {
            print("error")
            return nil
        }
    }
}
