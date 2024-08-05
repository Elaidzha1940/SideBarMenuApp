//  /*
//
//  Project: SideBarMenu
//  File: SideBarMenuView.swift
//  Created by: Elaidzha Shchukin
//  Date: 03.08.2024
//
//  */

import SwiftUI

struct SideBarMenuView: View {
    @State private var selectedItem: TabIcon = .Home
    @State private var yOffset: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color("BG1")
                .frame(width: 266)
                .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            VStack(alignment: .leading) {
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
                    Image(systemName: "camera.metering.unknown")
                }
                .foregroundStyle(.white)
                .padding(.top, 5)
                
                Spacer()
                
                HStack {
                    Dicon(icon: "moon.zzz.fill")
                    Spacer()
                    
                    Text("Settings")
                        .foregroundStyle(.white.opacity(0.8))
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                    Spacer()
                    
                    Dicon(icon: "gearshape.fill")
                }
                .padding(.bottom, 20)
                .frame(width: 230, height: 90)
                .padding(.leading, 17)
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
            ZStack {
                Circle()
                    .foregroundStyle(.white)
                Image(systemName: "movieclapper")
                    .frame(width: 60, height: 60)
                    .font(.system(size: 30, weight: .heavy, design: .rounded))
                    .foregroundStyle(.BG_1)
            }
            
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
    @State var isAnimated = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: isAnimated ? 10 : 230, height: 45)
                .foregroundStyle(.BG)
                .cornerRadius(10)
                .offset(y: yOffset)
                .padding(.vertical, 8)
                .padding(.horizontal, 5)
                .offset(y: -125)
                .offset(x: -20)
                .animation(.easeInOut, value: isAnimated)
            
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
                            isAnimated = false
                        }
                    }, label: {
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 40 , height: 40)
                                    .foregroundStyle(.ultraThinMaterial)
                                
                                Image(systemName: item.icon)
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)
                            }
                            
                            Text(item.title)
                                .bold()
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundStyle(.white.opacity(0.8))
                                .padding(.leading, 10)
                            
                            Spacer()
                        }
                        .padding(.top, 30)
                    })
                }
            }
            .frame(width: 246, height: 330)
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

struct Dicon: View {
    var icon = ""
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 45, height: 45)
                .foregroundStyle(.ultraThinMaterial)
            
            Image(systemName: icon)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(.white.opacity(0.8))
        }
    }
}
