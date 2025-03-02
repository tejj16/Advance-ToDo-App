import SwiftUI

struct TaskDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var task: Item

    var body: some View {
        VStack {
            Text(task.title ?? "No Title")
                .font(.largeTitle)

            Text("Due: \(task.dueDate ?? Date(), formatter: itemFormatter)")

            Button(action: {
                task.isCompleted.toggle()
                try? viewContext.save()
            }) {
                Text(task.isCompleted ? "Mark as Incomplete" : "Mark as Completed")
                    .padding()
                    .background(task.isCompleted ? Color.gray : Color.green)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
