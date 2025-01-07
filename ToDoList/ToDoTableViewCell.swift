//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Kirill Tarasko on 07.01.2025.
//

import Foundation
import UIKit

protocol ToDoCellDelegate: AnyObject {
    func cellTapped(cell: ToDoTableViewCell)
}

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var toDoButton: UIButton!
    
    weak var delegate: ToDoCellDelegate?
    
    @IBAction func toDoButtonTapped(_ sender: Any) {
        delegate?.cellTapped(cell: self)
    }
    
    
    
    func updateCell(with todo: Todo) {
        toDoLabel.text = todo.name
        toDoButton.setImage(UIImage(systemName: todo.isCompleted ? "checkmark" : "square"), for: .normal)
    }
}
