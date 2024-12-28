import Foundation
import SwiftUI
import SwiftData

struct EditTaskView: View {
    var toDoList: ToDoList
    @Environment(\.dismiss) var dismiss
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
                TextField("Field Description", text: $fieldDescription)
            } icon: {
                Image(systemName: "pencil.circle.fill")
            }
            
            Toggle("is Finished", isOn: $isFinished)
            
            if isFinished {
                DatePicker("Start Date", selection: $startingDate)
                DatePicker("Ending Date", selection: $endingDate)
            } else {
                DatePicker("Start Date", selection: $startingDate)
            }
            
            Button("Save") {
                if toDoList.taskName.isEmpty || toDoList.taskDescription.isEmpty {
                    showAlert = true
                } else {
                    toDoList.taskName = fieldTaskName
                    toDoList.taskDescription = fieldDescription
                    toDoList.taskStartedDate = startingDate
                    toDoList.taskEndingDate = endingDate
                    toDoList.isFinished = isFinished
                    dismiss()
                }
            }.buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
        }.alert("التاسك او الديسكريبشن", isPresented: $showAlert) {
            Button("اللي تشوفه", role: .cancel) {}
        } message: {
            Text("اكتب حاجه وخلاص")
        }.onAppear {
            fieldTaskName = toDoList.taskName
            fieldDescription = toDoList.taskDescription
            startingDate = toDoList.taskStartedDate
            endingDate = toDoList.taskEndingDate
            isFinished = toDoList.isFinished
        }
    }
}

#Preview {
    ContentView()
}
