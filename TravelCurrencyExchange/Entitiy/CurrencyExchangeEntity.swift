//
//  CurrencyExchangeEntity.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/06.
//

import Foundation

struct CurrencyExchangeEntity: Codable {
    let result: Int
    var curUnit, ttb, tts, dealBasR: String
    let bkpr, yyEfeeR, tenDDEfeeR, kftcBkpr: String
    let kftcDealBasR, curNm: String

    enum CodingKeys: String, CodingKey {
        case result
        case curUnit = "cur_unit"
        case ttb, tts
        case dealBasR = "deal_bas_r"
        case bkpr
        case yyEfeeR = "yy_efee_r"
        case tenDDEfeeR = "ten_dd_efee_r"
        case kftcBkpr = "kftc_bkpr"
        case kftcDealBasR = "kftc_deal_bas_r"
        case curNm = "cur_nm"
    }
}
