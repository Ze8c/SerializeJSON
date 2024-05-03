//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

struct OwnerDTO: Codable {
    let ownerName: String
    let posts: [PostDTO]
}

extension OwnerDTO: CustomStringConvertible {
    var description: String {
        "Owner Name: \(ownerName), posts:\n\(posts.map(\.description).joined(separator: "\n"))"
    }
}
