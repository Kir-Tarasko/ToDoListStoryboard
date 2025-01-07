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
    
    func cellTapped(cell: ToDoTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let todo = todos[indexPath.row]
        todo.isCompleted.toggle()
        tableView.reloadData()
        
    }
    
}

