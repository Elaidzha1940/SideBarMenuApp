//  /*
//
//  Project: SideBarMenu
//  File: TabViewView.swift
//  Created by: Elaidzha Shchukin
//  Date: 29.07.2024
//
//  */

import SwiftUI

struct TabViewView: View {
    @State var selectedIndex = 0
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ImageView(image: "SB1")
                .tag(1)
            ImageView(image: "SB2")
                .tag(2)
            ImageView(image: "SB3")
                .tag(3)
            ImageView(image: "SB4")
                .tag(4)
            ImageView(image: "SB5")
                .tag(5)
        }
        .tabViewStyle(PageTabViewStyle())
        .offset(x: -10)
        .frame(width: 266, height: 170)
        .padding(.top, 10)
        .onReceive(timer, perform: { time in
            withAnimation {
                selectedIndex = selectedIndex == 5 ? 0 : selectedIndex + 1
            }
        })
    }
}

#Preview {
    TabViewView()
}

struct ImageView: View {
    var image = ""
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 230, height: 157)
            .clipped()
            .cornerRadius(30)
            .padding(.leading, 15)
    }
}

