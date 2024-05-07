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
    var convert: Post {
        Post(title: title, isPublished: isPublished, counts: counts.convert)
    }
    
    init(model: Post) {
        self.title = model.title
        self.isPublished = model.isPublished
        self.counts = CountsDTO(model: model.counts)
    }
}

extension PostDTO: CustomStringConvertible {
    var description: String {
        "- title: \(title), isPublished: \(isPublished), counts -> \(counts.description)"
    }
}
