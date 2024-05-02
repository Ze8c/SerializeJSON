//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

import Foundation

final class ConverterJSON {
    
    init() {
        let jsonURL = Bundle.main.url(forResource: "Example", withExtension: "json")
        print(jsonURL)
        //let jsonData = try! Data(contentsOf: jsonURL!)
        //print(try! String(contentsOf: jsonURL!))
    }
}
