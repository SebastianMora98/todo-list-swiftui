//
//  ListViewModel.swift
//  TodoList
//
//  Created by Jhon Sebastian Mora Orozco on 18/04/25.
//

import Foundation

class ListViewModel : ObservableObject {
    
    @Published var items: [ItemModel] = []{
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        do {
            let items = try decoder.decode([ItemModel].self, from: data)
            self.items = items
        } catch {
            print("Error decoding items array: \(error)")
        }
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(items)
            UserDefaults.standard.set(data, forKey: itemsKey)
        } catch {
            print("Error encoding items array: \(error)")
        }
    }
    

}

