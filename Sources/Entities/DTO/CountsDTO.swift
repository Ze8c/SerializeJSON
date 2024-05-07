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
    init(json: [String: Any]) throws {
        guard let likes = json["likes"] as? Int, let views = json["views"] as? Int
        else { throw NSError() }
        
        self.likes = likes
        self.views = views
    }
}

extension CountsDTO: CustomStringConvertible {
    var description: String {
        "likes: \(likes), views: \(views)"
    }
}
