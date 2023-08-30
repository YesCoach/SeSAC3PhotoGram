//
//  SearchPhotos.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/30.
//

import Foundation

import Foundation

// MARK: - SearchPhotosResults
struct SearchPhotosResults: Codable {
    let total, totalPages: Int
    let results: [SearchPhoto]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct SearchPhoto: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let promotedAt: String?
    let width, height: Int?
    let color, blurHash: String?
    let description: String?
    let altDescription: String?
    let urls: Urls?
    let likes: Int?
    let likedByUser: Bool?
    let sponsorship: String?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, likes
        case likedByUser = "liked_by_user"
        case sponsorship
    }
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
