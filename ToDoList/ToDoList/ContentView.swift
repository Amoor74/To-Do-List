import Foundation
import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var toDoList: [ToDoList]
    @Environment(\.modelContext) var modelContext
    @State var isSheetOpen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDoList) { task in
                    NavigationLink {
                        EditTaskView(toDoList: task)
                    } label: {
                        ListView(toDoList: task)
                    }
                }.onDelete(perform: deleteTask)
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Task") {
                        isSheetOpen.toggle()
                    }.sheet(isPresented: $isSheetOpen) {
                        AddTaskView()
                    }
                }
            }
        }
    }
    
    func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(toDoList[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [ToDoList.self])
}
