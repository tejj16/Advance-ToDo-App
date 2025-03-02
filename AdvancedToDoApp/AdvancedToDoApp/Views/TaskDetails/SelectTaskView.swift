import SwiftUI
import CoreData

private let taskDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

struct SelectTaskView: View {
    enum ActionType {
        case edit, delete
    }

    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.dueDate, ascending: true)])
    var tasks: FetchedResults<Item>

    let actionType: ActionType
    @State private var selectedTask: Item?
    @State private var showEditTaskView = false
    @State private var showDeleteConfirmation = false

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks, id: \.self) { task in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.title ?? "No Title")
                                .font(.headline)
                            Text("Due: \(task.dueDate ?? Date(), formatter: taskDateFormatter)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        
                        if actionType == .edit {
                            Button(action: {
                                selectedTask = task
                                showEditTaskView = true
                            }) {
                                Text("Edit")
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        
                        if actionType == .delete {
                            Button(action: {
                                selectedTask = task
                                showDeleteConfirmation = true
                            }) {
                                Text("Delete")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(actionType == .edit ? "Select Task to Edit" : "Select Task to Delete")
            .navigationBarItems(trailing: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            })
            .sheet(isPresented: $showEditTaskView) {
                if let taskToEdit = selectedTask {
                    AddEditTaskView(task: taskToEdit)
                }
            }
            .alert(isPresented: $showDeleteConfirmation) {
                Alert(
                    title: Text("Delete Task"),
                    message: Text("Are you sure you want to delete this task?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let taskToDelete = selectedTask {
                            deleteTask(taskToDelete)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }

    private func deleteTask(_ task: Item) {
        viewContext.delete(task)
        do {
            try viewContext.save()
            DispatchQueue.main.async {
                selectedTask = nil
            }
        } catch {
            print("Error deleting task: \(error.localizedDescription)")
        }
    }
}
