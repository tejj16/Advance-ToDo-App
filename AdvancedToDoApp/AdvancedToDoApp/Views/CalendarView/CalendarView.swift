import SwiftUI

struct CalendarView: View {
    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.dueDate, ascending: true)]
    ) private var tasks: FetchedResults<Item>

    var body: some View {
        List {
            ForEach(tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.title ?? "No Title")
                    Text("Due: \(task.dueDate ?? Date(), formatter: itemFormatter)")
                        .foregroundColor(task.dueDate ?? Date() < Date() ? .red : .black)
                }
            }
        }
        .navigationTitle("Calendar")
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
