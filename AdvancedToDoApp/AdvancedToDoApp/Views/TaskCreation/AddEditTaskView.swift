import SwiftUI
import CoreData

struct AddEditTaskView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    var task: Item?

    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date()
    @State private var priority: String = "Medium"
    @State private var isCompleted: Bool = false

    let priorities = ["Low", "Medium", "High"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Task Title", text: $title)
                        .font(.title2)
                        .bold()

                    TextField("Description", text: $description)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.gray)
                }

                
                Section(header: Text("Due Date & Time")) {
                    DatePicker("Select Date & Time", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(CompactDatePickerStyle())
                }

                
                Section(header: Text("Priority")) {
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                
                Section {
                    Toggle("Mark as Completed", isOn: $isCompleted)
                }
            }
            .navigationTitle(task == nil ? "New Task" : "Edit Task")
            .navigationBarItems(
                leading: Button("Cancel") { presentationMode.wrappedValue.dismiss() },
                trailing: Button("Save") { saveTask() }
            )
            .onAppear {
                loadTaskData()
            }
        }
    }

   
    private func loadTaskData() {
        if let task = task {
            title = task.title ?? ""
            description = task.taskDescription ?? ""
            dueDate = task.dueDate ?? Date()
            priority = task.priority ?? "Medium"
            isCompleted = task.isCompleted
        }
    }

    
    private func saveTask() {
        let newTask = task ?? Item(context: viewContext)
        newTask.title = title
        newTask.taskDescription = description
        newTask.dueDate = dueDate
        newTask.priority = priority
        newTask.isCompleted = isCompleted

        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Error saving task: \(error.localizedDescription)")
        }
    }
}
