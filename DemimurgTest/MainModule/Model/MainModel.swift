//
//  CellModel.swift
//  DemimurgTest
//
//  Created by Victor Shmanin on 21.05.2024.
//

import Foundation

struct Cell: Identifiable, Hashable {
    var id: UUID
    var type: CellType
}

enum CellType {
    case live, dead, life
}
