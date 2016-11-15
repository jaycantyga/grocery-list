//
//  GroceryListViewController.swift
//  GroceryList
//
//  Created by jay on 11/14/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit

class GroceryListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [[String: Any]] = GroceryItemsModel.shared.inventoryList
    var selectedCell: GroceryItemCollectionViewCell?
    var selectedCellIndex: Int?

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryItemCollectionViewCell", for: indexPath) as! GroceryItemCollectionViewCell
        
        let item = data[indexPath.row]
        cell.nameLabel.text = item["name"] as? String
        
        if let count = item["quantity"] as? Int,
            let cartCount = item["cartCount"] as? Int {
            cell.qtyLabel.text = "\(count - cartCount)"
        } else {
            cell.qtyLabel.text = ""
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! GroceryItemCollectionViewCell
        
        if cell === selectedCell {
            cell.backgroundColor = UIColor.white
            selectedCell = nil
            selectedCellIndex = nil
        } else {
            cell.backgroundColor = UIColor.lightGray
            selectedCell?.backgroundColor = UIColor.white
            selectedCell = cell
            selectedCellIndex = indexPath.item
        }
    }

    
    // MARK: - handlers

    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        if let _ = selectedCell {
            
            var item = data[selectedCellIndex!]
            item["cartCount"] = item["cartCount"] as! Int + 1
            GroceryItemsModel.shared.inventoryList[selectedCellIndex!] = item
        }
        
        
        
        dismiss(animated: true)
    }
}
