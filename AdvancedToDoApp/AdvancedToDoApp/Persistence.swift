//
//  Persistence.swift
//  AdvancedToDoApp
//
//  Created by Tej Patel on 2025-02-14.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for i in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.id = UUID()
            newItem.title = "Sample Task \(i + 1)"
            newItem.taskDescription = "This is a sample task description."
            newItem.dueDate = Calendar.current.date(byAdding: .day, value: i, to: Date()) ?? Date()
            newItem.priority = i % 2 == 0 ? "High" : "Medium"
            newItem.isCompleted = i % 3 == 0
        }
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            print("Core Data Preview Error: \(nsError), \(nsError.userInfo)")
        }
        
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "AdvancedToDoApp")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("Core Data failed to load: \(error), \(error.userInfo)")
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
    }
}
