import Foundation
import SwiftUI
import SwiftData

struct ListView: View {
    var toDoList: ToDoList
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(toDoList.taskName)
                    .font(.title2)
                    .bold()
                Spacer()
                Image(systemName: toDoList.viewAvailability)
                    .foregroundStyle(toDoList.viewAvailabilityColor)
            }
            
            Text("Click to see Description")
                .bold()
            Text(toDoList.viewDate)
        }
    }
}

#Preview {
    ContentView()
}
