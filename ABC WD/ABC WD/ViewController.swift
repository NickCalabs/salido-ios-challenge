//
//  ViewController.swift
//  ABC WD
//
//  Created by Nick on 4/15/15.
//  Copyright (c) 2015 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var items: [String] = ["Test", "this", "is"]
    var wines = [WineModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadJSON()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadJSON() {
        Data.getWineCatalogWithSuccess { (wineData) -> Void in
            let json = JSON(data:wineData)
            
            if let name = json["Products"]["List"][0]["Name"].stringValue as String? {
                println(name)
            }
            
            if let winearray = json["Products"]["List"].arrayValue as Array? {
                
                for wineDict in winearray {
                    var wineName: String? = wineDict["Name"].stringValue
                    var wineURL: String? = wineDict["Url"].stringValue
                    
                    var wine = WineModel(name: wineName, wineURL: wineURL)
                    self.wines.append(wine)
                }
                println(self.wines)
            }
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        tableView.reloadData()
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.items[indexPath.row]
//        cell.textLabel?.text = self.wines[indexPath.row].description
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("Item: \(indexPath.row)")
    }


}

