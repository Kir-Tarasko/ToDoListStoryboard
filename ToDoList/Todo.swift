//
//  ToDo.swift
//  ToDoList
//
//  Created by Kirill Tarasko on 07.01.2025.
//

import Foundation

class ToDo {
    
    var name: String
    let isCompleted: Bool
    let id: UUID
    
    init(name: String, isCompleted: Bool, id: UUID = UUID()) {
        self.name = name
        self.isCompleted = isCompleted
        self.id = id
    }
}
