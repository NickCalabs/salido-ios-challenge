//
//  WineModel.swift
//  ABC WD
//
//  Created by Nick on 4/15/15.
//  Copyright (c) 2015 Nick. All rights reserved.
//

import Foundation

class WineModel: NSObject, Printable {
    let name: String
    let wineURL: String
    
    override var description: String {
        return "Name: \(name), URL: \(wineURL)\n"
    }
    
    init(name: String?, wineURL: String?) {
        self.name = name ?? ""
        self.wineURL = wineURL ?? ""
    }
}