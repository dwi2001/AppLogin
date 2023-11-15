//
//  TodoListViewViewModel.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import Foundation
import FirebaseFirestore


class TodoListViewViewModel : ObservableObject {
    @Published var showing = false
    
    private let userId : String
    init (userId: String) {
        self.userId = userId
    }
    
    // delete todo
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
