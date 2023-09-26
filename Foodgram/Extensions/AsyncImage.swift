//
//  AsyncImage.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 26.09.2023.
//

import Foundation
import SwiftUI

extension AsyncImage {
    init(apiUrl: String, @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        var urlComponents = URLComponents(string: apiUrl)
        urlComponents?.scheme = AppSettings.serverScheme
        urlComponents?.port = AppSettings.serverPort
        urlComponents?.host = AppSettings.serverHost
        
        self.init(url: urlComponents?.url, content: content)
    }
}
