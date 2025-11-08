//
//  TodoItem.swift
//  TodoApp
//
//  Created by Sairam G on 08/11/25.
//


import SwiftUI

// Model
struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}