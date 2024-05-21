//
//  MainViewModel.swift
//  DemimurgTest
//
//  Created by Victor Shmanin on 21.05.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var cellsArray: [Cell] = []
    
    // этот счетчик считает подряд идущие клетки положительные значения - живые клетки,
    // отрицательные - мертвые. Счетчик принимает значения [-2;2] и обнуляется при рождении и смерти жизни
    private var lastLiveCellsCounter: Int = 0
    
    // функция обработки нажатия кнопки "Сотворить"
    func newCellButtonDidTap() {
                
        let newCell: Cell = self.createNewCell(type: Bool.random() ? .live : .dead)
        
        switch newCell.type {
            
        case .live:
            
            // если две предыдущие клетки живые
            if lastLiveCellsCounter == 2 {
                
                // обнуляем счетчик
                lastLiveCellsCounter = 0
                
                // добавляем новую клетку и клетку жизни
                cellsArray.append(newCell)
                cellsArray.append(self.createNewCell(type: .life))
                
                return
            }
            
            else if lastLiveCellsCounter > 0 {
                
                lastLiveCellsCounter += 1
            }
            
            else {
                lastLiveCellsCounter = 1
            }
            
            cellsArray.append(newCell)
            
        case .dead:
            
            // если две предыдущие клетки мертвые
            if lastLiveCellsCounter == -2 {
                
                // обнуляем счетчик
                lastLiveCellsCounter = 0
                
                // добавляем новую клетку
                cellsArray.append(newCell)
                
                // реализация умертвления клетки жизни, которая идет перед тремя мертвыми
//                if cellsArray[cellsArray.count - 3].type == .life {
//                    cellsArray[cellsArray.count - 3].type = .dead
//                }
                
                // реализация умертвления последней клетки жизни
                if let lastLifeCellIndex = cellsArray.lastIndex(where: { cell in
                    cell.type == .life
                }) {
                    cellsArray[lastLifeCellIndex].type = .dead
                }
                
                return
            }
            
            else if lastLiveCellsCounter < 0 {
                
                lastLiveCellsCounter -= 1
            }
            
            else {
                lastLiveCellsCounter = -1
            }
            
            cellsArray.append(newCell)
            
        default:
            return
        }
        
    }
    
    private func createNewCell(type: CellType) -> Cell {
        
        let cell = Cell(id: UUID(), type: type)
        
        return cell
    }
}
