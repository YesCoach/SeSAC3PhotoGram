//
//  APIHeader.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/30.
//

import Foundation

enum APIHeader {

    enum Unsplash {
        static let header: [String: String] = [
            "Authorization": "Client-ID \(APIKey.unsplashAPIAccessKey)"
        ]
    }

}
