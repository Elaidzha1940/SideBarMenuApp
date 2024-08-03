//  /*
//
//  Project: SideBarMenu
//  File: SBModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 28.07.2024
//
//  */

import Foundation

struct SideBar: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
    var tab: TabIcon
    var index: Int
}

let sideBar = [
    SideBar(icon: "house.fill", title: "Home", tab: .Home, index: 0),
    SideBar(icon: "house.fill", title: "Card", tab: .Home, index: 0),
    SideBar(icon: "house.fill", title: "Favorite", tab: .Home, index: 0),
    SideBar(icon: "house.fill", title: "Purchase", tab: .Home, index: 0),
    SideBar(icon: "house.fill", title: "Notification", tab: .Home, index: 0),
    
]

enum TabIcon: String {
    case Home
    case Card
    case Favorite
    case Purchase
    case Notification
    
}
