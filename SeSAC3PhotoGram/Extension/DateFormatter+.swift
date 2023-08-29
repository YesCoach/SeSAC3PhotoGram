//
//  DateFormatter+.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/29.
//

import Foundation

extension DateFormatter {

    // 타입 프로퍼티
    static let format = {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        return format
    }()

    // 타입 메서드
    static func today() -> String {
        return format.string(from: Date())
    }

    // 타입 메서드
    static func convertData(date: Date) -> String {
        return format.string(from: date)
    }

}
