//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

import Foundation
import SwiftyJSON

final class ConverterJSON {
    func decoding<Model>(json: Data) throws -> Model where Model: Decodable {
        try JSONDecoder().decode(Model.self, from: json)
    }
    
    func encoding<Model>(model: Model) throws -> Data where Model: Encodable {
        try JSONEncoder().encode(model)
    }
    
    func serializing(json: Data) throws -> Any {
        try JSONSerialization.jsonObject(with: json)
    }
    
    func parsingThirdParty(json: Data) throws -> JSON {
        try JSON(data: json)
    }
}
