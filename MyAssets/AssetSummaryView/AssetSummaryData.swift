//
//  AssetSummaryData.swift
//  MyAssets
//
//  Created by 구희정 on 2022/06/12.
//

import SwiftUI

class AssetSummaryData: ObservableObject {
    
    //해당 작업은 외부에서 데이터가 넘어온 것 처럼 데이터를 Decoder 작업을 진행해준다.
    //표현 할 데이터
    @Published var assets : [Asset] = load("assets.json")
    
}

func load<T : Decodable> (_ filename :String ) -> T {
    let data : Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError(filename + "을 찾을 수 없습니다.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(filename + "을 찾을 수 없습니다.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(filename + "을 \(T.self)로 파싱 할 수 없습니다.")
    }
}
