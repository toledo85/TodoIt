//
//  ProgressView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import SwiftUI
import Charts

struct TodosProgressView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    private var doneCount: Int {
        todoViewModel.todos.filter(byState: .done).count
    }
    
    private var allCount: Int {
        todoViewModel.todos.filter(byState: .all).count
    }
    
    private var percent: Double {
        Double(doneCount) / Double(allCount)
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Spacer()
                
                Chart {
                    BarMark(x: .value("Sample", "Done"), y: .value("Value", doneCount))
                    BarMark(x: .value("Sample", "Undone"), y: .value("Value", allCount - doneCount))
                        .foregroundStyle(Color.darkStart)
                }.frame(height: 400)
                
                Spacer()
                
                ProgressView("", value: Double(doneCount), total: Double(allCount))
                    .labelsHidden()
                
                Spacer()
                
                Text("Done \(doneCount) of \(allCount)")
                
                Text(percent, format: .percent)
      
                Spacer()
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
