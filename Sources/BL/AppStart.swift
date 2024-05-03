//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

import Foundation

struct AppStart {
    private let converter = ConverterJSON()
    
    func main() {
        let jsonURL = Bundle.module.url(forResource: "Example", withExtension: "json")
        let jsonData = try! Data(contentsOf: jsonURL!)
        
        do {
            let resultDTO: OwnerDTO = try converter.decoding(json: jsonData)
            let resultJSON = try converter.encoding(model: resultDTO)
            let result = try converter.serializing(json: jsonData)
            let json = try converter.parsingThirdParty(json: jsonData)
            print("RESULT Decodable: \(resultDTO)")
            print("RESULT Encodable: \(String(data: resultJSON, encoding: .utf8))")
            print("RESULT Serialization: \(result)")
            print("RESULT Third Party Lib: \(json)")
        } catch {
            print("ERROR: \(error)")
        }
    }
}
