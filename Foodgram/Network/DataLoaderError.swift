//
//  DataLoaderError.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 26.09.2023.
//

import Foundation

enum DataLoaderError: Error {
    case invalidUrl
    case fetchingFail
    case unexpected(code: Int)
}
