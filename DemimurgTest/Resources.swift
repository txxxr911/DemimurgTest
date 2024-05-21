//
//  Resources.swift
//  DemimurgTest
//
//  Created by Victor Shmanin on 21.05.2024.
//

import Foundation
import UIKit

class Resources {
    
    private init() {}
    
    static let shared = Resources()
    
    func nameForCell(cellType: CellType) -> String {
        switch cellType {
        case .live:
            return "Живая"
        case .dead:
            return "Мёртвая"
        case .life:
            return "Жизнь"
        }
    }
    
    func descriptionForCell(cellType: CellType) -> String {
        switch cellType {
        case .live:
            return "и шевелится!"
        case .dead:
            return "или прикидывается"
        case .life:
            return "Ку-ку!"
        }
    }
    
    func imageForCell(cellType: CellType) -> String {
        switch cellType {
        case .live:
            return "liveCell"
        case .dead:
            return "deadCell"
        case .life:
            return "lifeCell"
        }
    }
    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
