//
//  NetworkManager.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/30.
//

import Foundation

final class NetworkManager {

    static let shared = NetworkManager() // 인스턴스 생성 방지

    private init() { }

    func callRequest() {

//         let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080")
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        let request = URLRequest(url: url!)

        URLSession.shared.dataTask(with: request) { data, response, error in
            // data가 nil일 경우 실패한 것
            print(data)

            let value = String(data: data!, encoding: .utf8)
            print(value)
            print(response)
            print(error)
        }.resume()
    }

}
