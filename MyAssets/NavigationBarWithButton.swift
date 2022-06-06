//
//  NavigationBarWithButton.swift
//  MyAssets
//
//  Created by 구희정 on 2022/06/06.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier {
    var title : String = ""
    
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .padding(),
                trailing: Button(
                    action: {
                        print("자산 추가버튼 tapped")},
                    label: {
                        Image(systemName: "plus")
                        Text("자산추가")
                            .font(.system(size: 12))
                    }
                )
                .accentColor(.black)
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black)
                )
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                //투명한 Background
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(white: 1, alpha: 0.5)
                //UINavigationBar 의 Appearance 를 커스텀한 값으로 변경
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
                
            }
    }
    
}

//View 를 커스텀한 것을 바로 볼 수 있도록
extension View {
    func navigationBarWithButtonStyle(_ title : String ) -> some View {
        return self.modifier(NavigationBarWithButton(title: title))
    }
}

struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigationBarWithButtonStyle("내 자산")
        }
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
