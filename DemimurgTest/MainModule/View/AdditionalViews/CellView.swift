//
//  CellView.swift
//  DemimurgTest
//
//  Created by Victor Shmanin on 21.05.2024.
//

import SwiftUI

struct CellView: View {
    
    var cell: Cell
    
    var body: some View {
        HStack {
            Image(Resources.shared.imageForCell(cellType: cell.type))
                .resizable()
                .frame(width: 42, height: 42)
                .padding(.leading, 16)
            
            VStack(spacing: 0) {
                
                Text(Resources.shared.nameForCell(cellType: cell.type))
                    .font(.custom("Roboto-Medium", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text(Resources.shared.descriptionForCell(cellType: cell.type))
                    .font(.custom("Roboto-Regular", size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
            
        }
        .frame(height: 72)
        .background(
            Color.white
        )
        .cornerRadius(8)
    }
}

#Preview {
    CellView(cell: Cell(id: UUID(), type: .dead))
}
