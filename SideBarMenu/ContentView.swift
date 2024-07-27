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
    var body: some View {
        ZStack {
         Color("BG1")
                .frame(width: 265)
                .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
            
            VStack {
                HStack {
                    Circle()
                        .frame(width: 65, height: 65)
                        .foregroundStyle(.white)
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 65, height: 14)
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 65, height: 14)
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 65, height: 14)

                    }
                }
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
