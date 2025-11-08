//
//  TodoListViewModel.swift
//  TodoApp
//
//  Created by Sairam G on 08/11/25.
//


import Foundation
import Combine

class TodoListViewModel: ObservableObject {
    @Published var items: [TodoItem] = []
    @Published var newItemTitle: String = ""
    
    func addItem() {
        guard !newItemTitle.isEmpty else { return }
        items.append(TodoItem(title: newItemTitle))
        newItemTitle = ""
    }
    
    func toggleCompletion(for item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
}