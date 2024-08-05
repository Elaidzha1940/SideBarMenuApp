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
    SideBar(icon: "film", title: "Film", tab: .Home, index: 0),
    SideBar(icon: "list.and.film", title: "Favorite", tab: .Card, index: 1),
    SideBar(icon: "film.stack.fill", title: "Watching", tab: .Favorite, index: 2),
    SideBar(icon: "airplayvideo", title: "Liked", tab: .Purchase, index: 3),
    SideBar(icon: "bell.fill", title: "Notification", tab: .Notification, index: 4),
]

enum TabIcon: String {
    case Home
    case Card
    case Favorite
    case Purchase
    case Notification
    
}
