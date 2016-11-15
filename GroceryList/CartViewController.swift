//
//  CartViewController.swift
//  GroceryList
//
//  Created by jay on 11/14/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listData = [[String: Any]]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        listData = GroceryItemsModel.shared.getItemsForCart()
        tableView.reloadData()
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") else {
            
            return UITableViewCell()
        }
        
        let item = listData[indexPath.row]
        cell.textLabel?.text = item["name"] as! String?
        
        if let count = item["cartCount"] as? Int {
            cell.detailTextLabel?.text = "\(count)"
        } else {
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    
}


