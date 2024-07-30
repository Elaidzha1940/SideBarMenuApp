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
            ImageView(image: "")
                .tag(1)
            ImageView(image: "")
                .tag(2)
            ImageView(image: "")
                .tag(3)
            ImageView(image: "")
                .tag(4)
            ImageView(image: "")
                .tag(5)
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(width: 266, height: 175)
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
            .frame(width: 230, height: 160)
            .clipped()
            .cornerRadius(10)
            .padding(.leading, 15)
    }
}

