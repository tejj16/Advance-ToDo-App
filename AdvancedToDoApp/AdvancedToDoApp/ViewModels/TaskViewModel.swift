import Foundation
import CoreData

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
        loadTasks()
    }

    func addTask(_ task: Task) {
        let newItem = task.toItem(context: context)
        saveContext()
        loadTasks()
    }

    func updateTask(_ task: Task) {
        if let existingItem = fetchItem(by: task.id) {
            existingItem.title = task.title
            existingItem.taskDescription = task.taskDescription
            existingItem.dueDate = task.dueDate
            existingItem.priority = task.priority
            existingItem.isCompleted = task.isCompleted
            saveContext()
        }
    }

    func deleteTask(_ task: Task) {
        if let existingItem = fetchItem(by: task.id) {
            context.delete(existingItem)
            saveContext()
        }
    }

    func loadTasks() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            let fetchedItems = try context.fetch(request)
            self.tasks = fetchedItems.map { Task(from: $0) }
        } catch {
            print("Error loading tasks: \(error)")
        }
    }

    private func saveContext() {
        do {
            try context.save()
            loadTasks() 
        } catch {
            print("Failed to save tasks: \(error)")
        }
    }

    private func fetchItem(by id: UUID) -> Item? {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        return try? context.fetch(request).first
    }
}
