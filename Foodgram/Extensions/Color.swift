//
//  Color.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 08.08.2023.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = String(hex[start...])
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexColor).scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

