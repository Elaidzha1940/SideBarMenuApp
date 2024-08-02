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
                .frame(width: 266)
                .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
            
            VStack {
                VStack(alignment: .leading) {
                    UserImage()
                    TabView1(selectedItem: $selectedItem, yOffset: $yOffset)
                 
                }
                .padding(.leading, 15)
                
                Spacer()
                
                DividerView()
                TabViewView()
                HStack {
                    Text("Learn more about the App")
                        .padding(.leading)
                    Image(systemName: "questionmark.circle")
                }
                .foregroundStyle(.white)
                .padding(.top, 5)
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

struct TabView1: View {
    @Binding var selectedItem: TabIcon
    @Binding var yOffset: CGFloat
    @State var isAnimated: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: isAnimated ? 20 : 230, height: 45)
                .foregroundStyle(.BG)
                .cornerRadius(10)
                .offset(y: yOffset)
                .padding(.vertical, 8)
                .padding(.horizontal, 5)
                .offset(y: -125)
                .offset(x: -20)
                .animation(.default, value: isAnimated)
            
            VStack(spacing: 0) {
                ForEach(sideBar) { item in
                    Button(action: {
                        withAnimation {
                            isAnimated = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation {
                                selectedItem = item.tab
                                yOffset = CGFloat(item.index) * 70
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                            withAnimation {
                                isAnimated = false
                            }
                        }
                    }, label: {
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.ultraThinMaterial)
                                
                                Image(systemName: item.icon)
                                    .foregroundStyle(.white)
                            }
                            
                            Text(item.title)
                                .bold()
                                .font(.title3)
                                .foregroundStyle(.white)
                                .padding(.leading, 10)
                            
                            Spacer()
                        }
                        .padding(.top, 30)
                    })
                }
            }
            .frame(width: 240, height: 330)
        }
    }
}

struct DividerView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 266, height: 1)
                .foregroundStyle(.gray.opacity(0.4))
                .padding(.top, 30)
        }
    }
}

