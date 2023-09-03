//
//  ViewController.swift
//  xcodeSample
//
//  Created by Dharam Dhurandhar on 03/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableViewData = DataT()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupTable()
        fetchDataFromAPI()
    }
    
    private func setupTable() {
        view.addSubview(tableView)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    
    private func fetchDataFromAPI() {
        NetworkManager.shared.fetchDataFromAPI { [weak self] response in
            switch response {
            case .success(let data):
                self?.tableViewData = data
            case .failure:
                break
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }
    
    


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = tableViewData[indexPath.row].title
        return cell
    }
    
    
}
