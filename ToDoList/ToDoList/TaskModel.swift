import Foundation
import SwiftUICore
import SwiftData
import UIKit

@Model
class ToDoList {
    var taskName: String
    var taskDescription: String
    var taskStartedDate: Date
    var taskEndingDate: Date
    var isFinished = false
    
    init(taskName: String, taskDescription: String, taskStartedDate: Date, taskEndingDate: Date, isFinished: Bool) {
        self.taskName = taskName
        self.taskDescription = taskDescription
        self.taskStartedDate = taskStartedDate
        self.taskEndingDate = taskEndingDate
        self.isFinished = isFinished
    }
}

extension ToDoList {
    var viewDate: String {
        if isFinished {
            return "Started: " + taskStartedDate.formatted(date: .abbreviated, time: .omitted) +
            " Finished: " + taskEndingDate.formatted(date: .abbreviated, time: .omitted)
        } else {
            return taskStartedDate.formatted(date: .abbreviated, time: .omitted)
        }
    }
    
    var viewAvailability: String {
        if isFinished {
            "checkmark.circle.fill"
        } else {
            "xmark.circle.fill"
        }
    }
    
    var viewAvailabilityColor: Color {
        if isFinished {
            return .green
        } else {
            return .red
        }
    }
    
}

extension ToDoList {
    @MainActor
    static var preview: ModelContainer {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let container = try! ModelContainer(for: ToDoList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(
            ToDoList(taskName: "Problem Solving", taskDescription: "Solve Plus Minus", taskStartedDate: dateFormatter.date(from: "2024-04-08")!, taskEndingDate: dateFormatter.date(from: "2024-04-22")!, isFinished: true)
        )
        
        container.mainContext.insert(
            ToDoList(taskName: "Problem Solving", taskDescription: "Solve Plus Minus", taskStartedDate: dateFormatter.date(from: "2024-04-08")!, taskEndingDate: dateFormatter.date(from: "2024-04-22")!, isFinished: false)
        )
        
        container.mainContext.insert(
            ToDoList(taskName: "Problem Solving", taskDescription: "Solve Plus Minus", taskStartedDate: dateFormatter.date(from: "2024-04-08")!, taskEndingDate: dateFormatter.date(from: "2024-04-22")!, isFinished: false)
        )
        
        container.mainContext.insert(
            ToDoList(taskName: "Problem Solving", taskDescription: "Solve Plus Minus", taskStartedDate: dateFormatter.date(from: "2024-04-08")!, taskEndingDate: dateFormatter.date(from: "2024-04-22")!, isFinished: true)
        )
        
        return container
    }
}
