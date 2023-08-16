//
//  FetcherState.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 13.08.2023.
//

import Foundation

enum FetcherState: Equatable {
    case good
    case loading
    case error(String)
}
