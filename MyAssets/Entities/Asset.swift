//
//  Asset.swift
//  MyAssets
//
//  Created by 구희정 on 2022/06/12.
//

import Foundation

class Asset: Identifiable, ObservableObject, Decodable {
    let id : Int
    let type: AssetMenu
    let data: [AssetData]
    
    init(id: Int, type: AssetMenu , data: [AssetData]){
        self.id = id
        self.type = type
        self.data = data
    }
}

class AssetData: Identifiable, ObservableObject, Decodable {
    let id : Int
    let title : String
    let amount : String
    let creditCardAmounts: [CreditCardAmounts]?
    
    init(id : Int, title: String, amount : String, creditCardAmount : [CreditCardAmounts]? = nil) {
        self.id = id
        self.title = title
        self.amount = amount
        self.creditCardAmounts = creditCardAmount
    }
}

enum CreditCardAmounts : Identifiable, Decodable {
    case previousMonth(amount: String)
    case currentMonth(amount:String)
    case nextMonTh(amount:String)
    
    var id:Int {
        switch self {
        case.previousMonth:
            return 0
        case.currentMonth:
            return 1
        case.nextMonTh:
            return 2
        }
    }
    
    var amount: String {
        switch self {
        case .previousMonth(let amount),
                .currentMonth(let amount),
                .nextMonTh(let amount) :
            return amount
        
        }
    }
    
    enum CodingKeys : String, CodingKey {
        case previousMonth
        case currentMonth
        case nextMonth
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try? values.decode(String.self, forKey: .previousMonth) {
            self = .previousMonth(amount: value)
            return
        }
        
        if let value = try? values.decode(String.self, forKey: .currentMonth) {
            self = .previousMonth(amount: value)
            return
        }
        if let value = try? values.decode(String.self, forKey: .nextMonth) {
            self = .previousMonth(amount: value)
            return
        }
        
        throw fatalError("ERROR : CreditCardAmounts JSON DECODER")
    }
}
