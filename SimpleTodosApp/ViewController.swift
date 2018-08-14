//
//  ViewController.swift
//  SimpleTodosApp
//
//  Created by David Kooistra on 8/13/18.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

struct Todo {
    let description: String
}

class ViewController: UIViewController {

    // MARK - Views
    weak var todosTableView: UITableView!
    
    var todos: [Todo] = [Todo(description: "First"), Todo(description: "Second"), Todo(description: "Third")]
    
    // MARK - Life cycle methods
    override func loadView() {
        super.loadView()
        
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        ])
        self.todosTableView = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todosTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        todosTableView.delegate = self
        todosTableView.dataSource = self
        self.view.backgroundColor = UIColor.blue
        setUpNavigationBar()
    }
    
    // MARK - Navigation Bar
    func setUpNavigationBar() {
        self.navigationItem.title = "Title"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row].description
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}























