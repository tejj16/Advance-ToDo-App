import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.dueDate, ascending: true)])
    private var tasks: FetchedResults<Item>

    @State private var selectedFilter: TaskFilter = .all
    @State private var showAddTaskView = false
    @State private var showSelectTaskView = false
    @State private var showDeleteTaskSelection = false
    @State private var selectedTask: Item? = nil
    @State private var showActionSheet = false

    var filteredTasks: [Item] {
        switch selectedFilter {
        case .all:
            return tasks.map { $0 }
        case .overdue:
            return tasks.filter { ($0.dueDate ?? Date()) < Date() && !$0.isCompleted }
        case .completed:
            return tasks.filter { $0.isCompleted }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedFilter) {
                    Text("All").tag(TaskFilter.all)
                    Text("Overdue").tag(TaskFilter.overdue)
                    Text("Completed").tag(TaskFilter.completed)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List {
                    ForEach(filteredTasks, id: \.self) { task in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(task.title ?? "No Title")
                                    .bold()
                                Text("Due: \(task.dueDate ?? Date(), formatter: taskDateFormatter)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()

                            Button(action: {
                                toggleTaskCompletion(task)
                            }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                                    .font(.title2)
                            }
                        }
                        .padding(8)
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        showActionSheet = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Task Options"), buttons: [
                    .default(Text("Edit Task"), action: { showSelectTaskView = true }),
                    .default(Text("Add Task"), action: { showAddTaskView = true }),
                    .destructive(Text("Delete Task"), action: { showDeleteTaskSelection = true }),
                    .cancel()
                ])
            }
            .sheet(isPresented: $showAddTaskView) {
                AddEditTaskView(task: nil)
            }
            .sheet(isPresented: $showSelectTaskView) {
                SelectTaskView(actionType: .edit)
            }
            .sheet(isPresented: $showDeleteTaskSelection) {
                SelectTaskView(actionType: .delete)
            }
            .sheet(item: $selectedTask) { task in
                AddEditTaskView(task: task)  
            }
        }
    }

    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            try? viewContext.save()
        }
    }

    private func toggleTaskCompletion(_ task: Item) {
        task.isCompleted.toggle()
        try? viewContext.save()
    }
}

enum TaskFilter {
    case all, overdue, completed
}

private let taskDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
