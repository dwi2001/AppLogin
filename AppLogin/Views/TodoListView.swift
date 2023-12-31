//
//  TodoListView.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//
import FirebaseFirestoreSwift
import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    
    @StateObject var viewModel : TodoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    private let userId: String

    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions{
                            Button{
                                viewModel.delete(id: item.id)
                                AnalyticsManager.shared.logEvent(name: "delete_todo", params: [
                                    "title" : "\(item.title)",
                                    "duedate" : "\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))",
                                    "created_date" : "\(Date(timeIntervalSince1970: item.createdDate).formatted(date: .abbreviated, time: .shortened))",
                                    "todo_status" : "\(item.isDone)"
                                ])
                            } label: {
                                Text("Delete")
                            }.tint(.red)
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showing = true
                } label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showing) {
                NewItemView(newItemPresented: $viewModel.showing)
            }
            
        }
    }
}

#Preview {
    TodoListView(userId: "Jx3WvGTr0ZT30fwlGqpiLsQkJcW2")
    
}
