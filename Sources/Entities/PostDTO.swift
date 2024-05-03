//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

struct PostDTO: Codable {
    let title: String
    let isPublished: Bool
    let counts: CountsDTO
}

extension PostDTO: CustomStringConvertible {
    var description: String {
        "- title: \(title), isPublished: \(isPublished), counts -> \(counts.description)"
    }
}
