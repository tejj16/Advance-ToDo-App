import Foundation
import CoreData

struct Task: Identifiable, Codable {
    var id: UUID
    var title: String
    var taskDescription: String
    var dueDate: Date
    var priority: String
    var isCompleted: Bool

    
    init(from item: Item) {
        self.id = item.id ?? UUID()
        self.title = item.title ?? "Untitled Task"
        self.taskDescription = item.taskDescription ?? ""
        self.dueDate = item.dueDate ?? Date()
        self.priority = item.priority ?? "Medium"
        self.isCompleted = item.isCompleted
    }


    func toItem(context: NSManagedObjectContext) -> Item {
        let item = Item(context: context)
        item.id = self.id
        item.title = self.title
        item.taskDescription = self.taskDescription
        item.dueDate = self.dueDate
        item.priority = self.priority
        item.isCompleted = self.isCompleted
        return item
    }
}
