//  /*
//
//  Project: SideBarMenu
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: on 27.07.2024
//
//  */

import SwiftUI

struct ContentView: View {
    @State var open = false
    let mindrag: CGFloat = 100
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    open = true
                }
            }, label: {
                Text("Open")
            })
            
            SideBarMenuView()
                .offset(x: open ? 0 : -270)
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let shouldShow = value.translation.width > self.mindrag
                            withAnimation {
                                open = shouldShow
                            }
                        })
                )
        }
    }
}

#Preview {
    ContentView()
}



