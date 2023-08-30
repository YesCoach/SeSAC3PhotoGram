//
//  NetworkManager.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/30.
//

import Foundation

final class NetworkManager: NSObject {

    static let shared = NetworkManager() // 인스턴스 생성 방지

    private override init() { }

    func callRequest<T: Codable>(api: APIURL.Unsplash, completion: @escaping (T) -> ()) {
        guard let url = api.url else {
            // TODO: - Invalid URL
            return
        }
        var request = URLRequest(url: url)
        request.httpHeader = APIHeader.Unsplash.header
        request.httpMethod = "GET"

        print(url)

        let session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: request) { data, response, error in
            if let error {
                debugPrint(error)
                return
            }
            guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode)
            else { return }

            if let data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedData)
                } catch {
                    print("decodeError")
                    return
                }
            }
            return
        }.resume()
    }

}

extension NetworkManager: URLSessionDataDelegate {

    // 서버에서 최초로 응답 받은 경우에 호출(상태코드 처리) // 100MB
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        print("RESPONSE", response)
        return .allow
    }

    // 서버에서 데이터 받을 때마다 반복적으로 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("DATA:", data) // 여기서 네트워크 통신 진행도를 계산하면, 몇퍼센트 받아왔는지 등을 보여 줄 수 있음.
    }

    // 서버에서 응답이 완료 된 이후에 호출
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("END")
    }
}
