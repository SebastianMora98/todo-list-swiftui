//
//  ListRowView.swift
//  TodoList
//
//  Created by Jhon Sebastian Mora Orozco on 20/01/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
        
    }
}

#Preview("Individual Items") {
    Group {
        ListRowView(item: ItemModel(title: "First item!", isCompleted: false))
        ListRowView(item: ItemModel(title: "Second Item.", isCompleted: true))
    }
}
