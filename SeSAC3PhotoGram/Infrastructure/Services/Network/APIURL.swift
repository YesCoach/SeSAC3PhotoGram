//
//  APIService.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/30.
//

import Foundation

enum APIURL {

    enum Unsplash {
        case searchPhotos(query: String)
    }

}

extension APIURL.Unsplash {

    static let baseURL = "https://api.unsplash.com/"

    private var urlComponents: URLComponents? {
        switch self {
        case .searchPhotos:
            return URLComponents(
                string: Self.baseURL + "search/photos?"
            )
        }
    }

    var url: URL? {
        var urlComponents = self.urlComponents
        var urlQueryItems: [URLQueryItem] = []

        switch self {
        case .searchPhotos(let query):
            let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            urlQueryItems = [
                URLQueryItem(name: "query", value: query)
            ]
        }
        urlQueryItems.forEach { urlComponents?.queryItems?.append($0) }
        return urlComponents?.url
    }

}
