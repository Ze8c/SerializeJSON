//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

import Foundation

struct PostDTO: Codable {
    let title: String
    let isPublished: Bool
    let counts: CountsDTO
}

extension PostDTO {
    init(json: [String: Any]) throws {
        guard let title = json["title"] as? String,
              let isPublished = json["isPublished"] as? Bool,
              let counts = json["counts"] as? [String: Any]
        else { throw NSError() }
        
        self.title = title
        self.isPublished = isPublished
        self.counts = try CountsDTO(json: counts)
    }
}

extension PostDTO: CustomStringConvertible {
    var description: String {
        "- title: \(title), isPublished: \(isPublished), counts -> \(counts.description)"
    }
}
