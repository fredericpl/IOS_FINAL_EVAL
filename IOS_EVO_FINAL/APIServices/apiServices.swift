//
//  apiServices.swift
//  IOS_EVO_FINAL
//
//  Created by Plancquet Frederic on 10/11/2022.
//
import Network
import Foundation
import Alamofire


class APIServices {
    
    private let monitor = NWPathMonitor()
    
    func isNetwork(connected: @escaping () -> Void, disconnected: @escaping () -> Void) {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                connected()
            }
            else {
                disconnected()
            }
        }
        monitor.start(queue: .global())
    }
}

extension APIServices {
    func fetchMovie(url: String, completionHandler: @escaping (Result<MovieModel, AFError>) -> Void) {
        isNetwork(
            connected: {
                if let url = URL(string: url) {
                    AF.request(url).responseDecodable(of: MovieModel.self) {
                        completionHandler($0.result)
                    }
                }
            }, disconnected: {
                print("Not connected")
            })
    }
}
