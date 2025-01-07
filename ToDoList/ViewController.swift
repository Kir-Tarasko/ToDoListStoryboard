//
//  ViewController.swift
//  ToDoList
//
//  Created by Kirill Tarasko on 07.01.2025.
//
import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
                      

ToDoCellDelegate {
    
    var todos: [Todo] = [Todo(name: "Test", isCompleted: false)]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func addToDo(_ sender: Any) {
        let alert = UIAlertController(title: "Add ToDo", message: "", preferredStyle: .alert)
        alert.addTextField()
        let saveButton = UIAlertAction(title: "Save", style: .default) { _ in
            if let textName = alert.textFields?.first?.text {
                self.todos.append(Todo(name: textName, isCompleted: false))
                self.tableView.reloadData()
            }
        }
        alert.addAction(saveButton)
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(cancelButton)
        
        present(alert, animated: true)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // MARK: Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as? ToDoTableViewCell else { return UITableViewCell() }
        let todoCell = todos[indexPath.row]
        cell.updateCell(with: todoCell)
        cell.delegate = self
        //        cell.textLabel?.text = todoCell.name
        //        cell.accessoryType = todoCell.isCompleted ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func cellTapped(cell: ToDoTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let todo = todos[indexPath.row]
        todo.isCompleted.toggle()
        tableView.reloadData()
        
    }
    
}

