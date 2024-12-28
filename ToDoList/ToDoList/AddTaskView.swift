import Foundation
import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var fieldTaskName = ""
    @State var fieldDescription = ""
    @State var startingDate = Date()
    @State var endingDate = Date()
    @State var isFinished = false
    @State var showAlert = false
    
    var body: some View {
        Form {
            Label {
                TextField("Task Name", text: $fieldTaskName)
            } icon: {
                Image(systemName: "list.bullet.circle.fill")
            }
            
            Label {
                TextField("Task Description", text: $fieldDescription)
            } icon: {
                Image(systemName: "pencil.circle.fill")
            }
            
            Toggle("is Finished", isOn: $isFinished)
            
            if isFinished {
                DatePicker("Start Date", selection: $startingDate)
                DatePicker("End Date", selection: $endingDate)
            } else {
                DatePicker("Start Date", selection: $startingDate)
            }
            
            Button("Save") {
                if fieldTaskName.isEmpty || fieldDescription.isEmpty {
                    showAlert = true
                } else {
                    let newTask = ToDoList(taskName: fieldTaskName, taskDescription: fieldDescription, taskStartedDate: startingDate, taskEndingDate: endingDate, isFinished: isFinished)
                    
                    modelContext.insert(newTask)
                    dismiss()
                }
                
            }.buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
            
        }
        .alert("التاسك او الديسكريبشن فاضيين", isPresented: $showAlert) {
            Button("اللي تشوفه", role: .cancel) {}
        } message: {
            Text("اكتب حاجه وخلاص")
        }
    }
}

#Preview {
    AddTaskView()
}
