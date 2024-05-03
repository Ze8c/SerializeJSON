//
//  File.swift
//  
//
//  Created by Maksym Sytyi on 5/2/24.
//

struct CountsDTO: Codable {
    let likes: Int
    let views: Int
}

extension CountsDTO: CustomStringConvertible {
    var description: String {
        "likes: \(likes), views: \(views)"
    }
}
