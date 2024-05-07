//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

import Foundation

struct CountsDTO: Codable {
    let likes: Int
    let views: Int
}

extension CountsDTO {
    var convert: Counts {
        Counts(likes: likes, views: views)
    }
    
    init(model: Counts) {
        self.likes = model.likes
        self.views = model.views
    }
}

extension CountsDTO: CustomStringConvertible {
    var description: String {
        "likes: \(likes), views: \(views)"
    }
}
