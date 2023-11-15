//
//  TodoListItem.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import Foundation

struct ToDoListItem : Codable, Identifiable{
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state:Bool) {
        isDone = state
    }
}
