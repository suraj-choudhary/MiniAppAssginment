//
//  PostModel.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 02/12/23.
//

import Foundation

/// Post model
struct PostModel: Codable {
    let imageUrls: String
    let postCreationDate: String
    let userId: Int
    let postDescription: String
}
