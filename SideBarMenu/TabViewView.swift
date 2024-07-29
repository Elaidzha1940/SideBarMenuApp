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
    let timer = Timer.publish(every: 22, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ImageView(image: "")
                .tag(1)
            ImageView(image: "")
                .tag(1)
            ImageView(image: "")
                .tag(1)
            ImageView(image: "")
                .tag(1)
            ImageView(image: "")
                .tag(1)
            ImageView(image: "")
                .tag(1)            
        }
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

