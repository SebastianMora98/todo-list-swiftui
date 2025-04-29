//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jhon Sebastian Mora Orozco on 20/01/25.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - Ui
 ViewModel - manages Models for View
 
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
