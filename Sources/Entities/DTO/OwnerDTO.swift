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
    var convert: Owner {
        Owner(name: ownerName, posts: posts.map(\.convert))
    }
    
    init(model: Owner) {
        self.ownerName = model.name
        self.posts = model.posts.map(PostDTO.init(model:))
    }
}

extension OwnerDTO: CustomStringConvertible {
    var description: String {
        "Owner Name: \(ownerName), posts:\n\(posts.map(\.description).joined(separator: "\n"))"
    }
}
