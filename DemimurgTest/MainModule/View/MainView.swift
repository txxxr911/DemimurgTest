//
//  MainView.swift
//  DemimurgTest
//
//  Created by Victor Shmanin on 21.05.2024.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        VStack {
            Text("Клеточное наполнение")
                .foregroundColor(.white)
                .font(.custom("Roboto-Medium", size: 28))
                .padding(.top)
            
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(mainViewModel.cellsArray.indices, id: \.self) { index in
                        CellView(cell: mainViewModel.cellsArray[index])
                            .padding(.horizontal, 16)
                            .id(index)  // Assign a unique ID to each cell view
                    }
                }
                .onChange(of: mainViewModel.cellsArray) { _ in
                    // Scroll to the last element whenever the array changes
                    if let lastIndex = mainViewModel.cellsArray.indices.last {
                        withAnimation {
                            proxy.scrollTo(lastIndex, anchor: .bottom)
                        }
                    }
                }
            }
            
            Button {
                mainViewModel.newCellButtonDidTap()
            } label: {
                Text("СОТВОРИТЬ")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 36)
                    .background(
                        Rectangle()
                            .foregroundColor(Color(uiColor: UIColor(red: 90/255,
                                                                    green: 52/255,
                                                                    blue: 114/255,
                                                                    alpha: 1)))
                    )
                    .padding(16)
            }
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors: [Color(uiColor: UIColor(red: 49/255,
                                                                   green: 0, blue: 80/255,
                                                                   alpha: 1)),
                                            .black],
                                   startPoint: .top,
                                   endPoint: .bottom))
    }
}

#Preview {
    MainView()
}

