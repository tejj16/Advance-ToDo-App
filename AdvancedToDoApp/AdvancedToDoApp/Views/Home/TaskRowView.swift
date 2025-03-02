import SwiftUI

struct TaskRowView: View {
    let task: Item
    let onToggleCompleted: () -> Void

    var body: some View {
        HStack {
            Button(action: {
                onToggleCompleted()
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .font(.system(size: 24))
            }
            .buttonStyle(PlainButtonStyle())

            VStack(alignment: .leading) {
                Text(task.title ?? "Untitled Task")
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Due: \(task.dueDate ?? Date(), formatter: taskDateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            NavigationLink(destination: TaskDetailView(task: task)) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

private let taskDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
