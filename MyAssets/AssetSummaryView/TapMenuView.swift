//
//  TapMenuView.swift
//  MyAssets
//
//  Created by 구희정 on 2022/06/17.
//

import SwiftUI

struct TapMenuView: View {
    var tabs : [String]
    
    @Binding var selectedTab : Int
    @Binding var updated : CreditCardAmounts?
    
    var body: some View {
        HStack {
            ForEach(0..<tabs.count, id:\.self) { row in
                Button (
                    action:{
                        selectedTab = row
                        UserDefaults.standard.set(true , forKey: "creditcard_update_checked: \(row)")
                    },
                    label: {
                        VStack(spacing: 0) {
                            HStack {
                                if updated?.id == row {
                                    let checked = UserDefaults.standard.bool(forKey: "creditcard_update_checked: \(row)")
                                    Circle()
                                        .fill(
                                            !checked
                                            ? Color.red
                                            : Color.clear
                                        )
                                        .frame(width: 6, height: 6)
                                        .offset(x: 2, y: -8)
                                } else {
                                    Circle()
                                        .fill(Color.clear)
                                        .frame(width: 6, height: 6)
                                        .offset(x: 2, y: -8)
                                }
                                
                                Text(tabs[row])
                                    .font(.system(.headline))
                                    .foregroundColor(
                                        selectedTab == row
                                        ? .accentColor
                                        : .gray
                                    )
                                    .offset(x: -4, y: 0)
                            }
                            .frame( height: 52)
                            Rectangle()
                                .fill(
                                    selectedTab == row
                                    ? Color.secondary
                                    : Color.clear
                                )
                                .frame( height: 3)
                                .offset(x: 4, y: 0)
                        }
                    }
                )
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(height: 52)
    }
}

struct TapMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TapMenuView(tabs: ["지난달 결제", "이번달 결제", "다음달 결제"], selectedTab: .constant(1), updated: .constant(.currentMonth(amount: "10,000원")))
    }
}
