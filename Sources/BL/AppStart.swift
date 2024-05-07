//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

import Foundation
import SwiftyJSON

struct AppStart {
    private let converter = ConverterJSON()
    
    func main() {
        let jsonURL = Bundle.module.url(forResource: "Example", withExtension: "json")
        let jsonData = try! Data(contentsOf: jsonURL!)
        
        do {
            try serializing(json: jsonData)
            try codable(json: jsonData)
            try thirdParty(json: jsonData)
        } catch {
            print("ERROR: \(error)")
        }
    }
    
    private func serializing(json jsonData: Data) throws {
        let jsonDict = try converter.serializing(json: jsonData)
        let model = try makeModelFromSerializing(jsonDict as! [String: Any])
        let data = try converter.makeData(model: makeJSON(fromModel: model))
        print("RESULT Serialization: \(model)")
        print("RESULT Convert: \(String(data: data, encoding: .utf8))")
    }
    
    private func codable(json jsonData: Data) throws {
        let dto: OwnerDTO = try converter.decoding(json: jsonData)
        let model = dto.convert
        let json = try converter.encoding(model: OwnerDTO(model: model))
        print("RESULT Decodable: \(dto)")
        print("RESULT Model: \(model)")
        print("RESULT Encodable: \(String(data: json, encoding: .utf8))")
    }
    
    private func thirdParty(json jsonData: Data) throws {
        let json = try converter.parsingThirdParty(json: jsonData)
        let model = makeModel(json: json)
        let data = try JSON(makeJSON(fromModel: model)).rawData()
        print("RESULT Third Party Lib: \(json)")
        print("RESULT Third Party Lib Model: \(model)")
        print("RESULT Third Party Lib Data: \(String(data: data, encoding: .utf8))")
    }
    
    // TODO: - Serializing data transformation
    
    private func makeModelFromSerializing(_ dict: [String: Any]) throws -> Owner {
        func modelPost(_ dict: [String: Any]) throws -> Post {
            guard let title = dict["title"] as? String,
                  let isPublished = dict["isPublished"] as? Bool,
                  let counts = dict["counts"] as? [String: Any],
                  let likes = counts["likes"] as? Int,
                  let views = counts["views"] as? Int
            else { throw NSError() }
            
            return Post(
                title: title,
                isPublished: isPublished,
                counts: Counts(likes: likes, views: views)
            )
        }
        
        guard let ownerName = dict["ownerName"] as? String,
              let posts = dict["posts"] as? [[String: Any]]
        else { throw NSError() }
        
        return Owner(name: ownerName, posts: try posts.map(modelPost(_:)))
    }
    
    private func makeJSON(fromModel model: Owner) -> [String: Any] {
        func makePostJSON(_ model: Post) -> [String: Any] {
            [
                "title": model.title,
                "isPublished": model.isPublished,
                "counts": ["likes": model.counts.likes, "views": model.counts.views]
            ]
        }
        
        return ["ownerName": model.name, "posts": model.posts.map(makePostJSON(_:))]
    }
    
    // TODO: - SwiftyJSON data transformation
    
    private func makeModel(json: JSON) -> Owner {
        func makePost(json: JSON) -> Post {
            Post(
                title: json["title"].stringValue,
                isPublished: json["isPublished"].boolValue,
                counts: Counts(likes: json["counts"]["likes"].intValue, views: json["counts"]["views"].intValue)
            )
        }
        
        return Owner(name: json["ownerName"].stringValue, posts: json["posts"].arrayValue.map(makePost(json:)))
    }
}
