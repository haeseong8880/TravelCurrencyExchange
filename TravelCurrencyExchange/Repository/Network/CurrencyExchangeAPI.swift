//
//  ExchangeAPI.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/06.
//

import Foundation

class CurrencyExchangeAPI {
    static let shared: CurrencyExchangeAPI = CurrencyExchangeAPI()
    private let url = "http://139.150.64.141:3000/currency-exchange"
    
    func getExchange(onSuccess: @escaping(([CurrencyExchangeEntity]) -> Void)) {
        guard let url = URL(string: url) else {return}
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {return}
            do {
                //받은 json데이터 파싱
                let result: [CurrencyExchangeEntity] = try JSONDecoder().decode([CurrencyExchangeEntity].self, from: data)
                onSuccess(result)
            } catch(let e) {
                print("getExchange Error ====> \(e)")
            }
        }.resume()
    }
}
