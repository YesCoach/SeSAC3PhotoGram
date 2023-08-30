//
//  URLRequest+.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/30.
//

import Foundation

extension URLRequest {
    var httpHeader: [String: String]? {
        get {
            return self.allHTTPHeaderFields
        }
        set {
            guard let newValue else { return }
            newValue.forEach { (key, value) in
                addValue(value, forHTTPHeaderField: key)
            }
        }
    }
}
