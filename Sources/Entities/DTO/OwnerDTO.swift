//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

import Foundation

struct OwnerDTO: Codable {
    let ownerName: String
    let posts: [PostDTO]
}

extension OwnerDTO {
    init(json: [String: Any]) throws {
        guard let ownerName = json["ownerName"] as? String,
              let posts = json["posts"] as? [[String: Any]]
        else { throw NSError() }
        
        self.ownerName = ownerName
        self.posts = try posts.map(PostDTO.init(json:))
    }
}

extension OwnerDTO: CustomStringConvertible {
    var description: String {
        "Owner Name: \(ownerName), posts:\n\(posts.map(\.description).joined(separator: "\n"))"
    }
}
