//  /*
//
//  Project: SideBarMenu
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: on 27.07.2024
//
//

import SwiftUI

struct ContentView: View {
    @State var selectedItem: TabIcon = .Home
    @State var yOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
         Color("BG1")
                .frame(width: 265)
                .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
            
            VStack {
                VStack {
                    UserImage()
                    
                    TabView(selectedItem: $selectedItem, yOffset: $yOffset)
                    
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
        .frame(maxHeight: .infinity)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ContentView()
}

struct UserImage: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 65, height: 65)
                .foregroundStyle(.white)
            
            VStack(alignment: .leading, spacing: 5) {
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 100, height: 14)
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 75, height: 7)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 52, height: 7)
                    .opacity(0.5)
            }
        }
        .foregroundStyle(.white)
        .padding(.top, 65)
    }
}

struct TabView: View {
    @Binding var selectedItem: TabIcon
    @Binding var yOffset: CGFloat
    @State var isAnimated: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(
                    width: isAnimated ? 20 : 230, height: 45)
                .foregroundStyle(.BG)
                .cornerRadius(5)
                .offset(y: yOffset)
            
            VStack {
                
            }
        }
    }
}
