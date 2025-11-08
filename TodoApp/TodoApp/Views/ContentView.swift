//
//  ContentView.swift
//  TodoApp
//
//  Created by Sairam G on 07/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new item", text: $viewModel.newItemTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: viewModel.addItem) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .if(!viewModel.newItemTitle.isEmpty, { view in
                                view.foregroundColor(.accentColor)
                            })
                    }
                    .disabled(viewModel.newItemTitle.isEmpty)
                }
                .padding()

                List(viewModel.items) { item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        if item.isCompleted {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                    .contentShape(Rectangle())
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            delete(item)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .onTapGesture {
                        viewModel.toggleCompletion(for: item)
                    }
                }
            }
            .navigationTitle("Todo List")
        }
    }
    
    private func delete(_ item: TodoItem) {
        viewModel.items.removeAll { $0.id == item.id }
    }
}

#Preview {
    ContentView()
}


extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, _ transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
