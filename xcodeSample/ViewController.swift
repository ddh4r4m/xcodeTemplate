//
//  ViewController.swift
//  xcodeSample
//
//  Created by Dharam Dhurandhar on 03/09/23.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var tableView: UITableView!
    var data = [String]() // Assuming each data entry is a String for simplicity

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchDataFromMockAPI()
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func fetchDataFromMockAPI() {
        let mockAPIURL = "https://dummyjson.com/products"
        AF.request(mockAPIURL).responseData { response in
            guard let data = response.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let productResponse = try decoder.decode(ProductResponse.self, from: data)
                self.data = productResponse.products.map { $0.title } // Assuming you still just want to display titles
                self.tableView.reloadData()
            } catch {
                print(error) // Handle error appropriately in your real project
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
