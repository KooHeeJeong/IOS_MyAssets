//
//  AssetView.swift
//  MyAssets
//
//  Created by 구희정 on 2022/06/06.
//

import SwiftUI

struct AssetView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing : 30) {
                    Spacer()
                    AssetMenuGridView()
                    AssetBanerView()
                        .aspectRatio(5/2,contentMode: .fit)
                    AssetSummaryView()
                        .environmentObject(AssetSummaryData())
                }
                .background(Color.gray.opacity(0.2))
                .navigationBarWithButtonStyle("내 자산")
            }
        }
    }
}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}
