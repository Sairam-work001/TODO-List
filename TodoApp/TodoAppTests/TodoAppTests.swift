//
//  TodoAppTests.swift
//  TodoAppTests
//
//  Created by Sairam G on 07/11/25.
//

import Testing
@testable import TodoApp

struct TodoAppTests {

    @Test func testAddItem() {
        let viewModel = TodoListViewModel()
        viewModel.newItemTitle = "Test Todo Item"
        viewModel.addItem()
        #expect(viewModel.items.count == 1)
        #expect(viewModel.items.first?.title == "Test Todo Item")
        #expect(viewModel.newItemTitle == "")
    }

    @Test func testToggleCompletion() {
        let viewModel = TodoListViewModel()
        viewModel.newItemTitle = "Test Todo Item"
        viewModel.addItem()
        
        guard let item = viewModel.items.first else {
            #expect(false, "Item should exist")
            return
        }
        
        #expect(item.isCompleted == false)
        viewModel.toggleCompletion(for: item)
        #expect(viewModel.items.first?.isCompleted == true)
        viewModel.toggleCompletion(for: item)
        #expect(viewModel.items.first?.isCompleted == false)
    }

}
