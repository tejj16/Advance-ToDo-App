# 📝 Advanced To-Do App

📅 **Your personal task manager – stay organized, stay productive!**

**Advanced To-Do App** is a powerful task management application designed for iOS, built using **SwiftUI** and **Core Data**. It helps users efficiently create, track, and manage their daily tasks with a sleek and user-friendly interface.

---

## 🌟 Features & Functionality

### ✅ **Task Management**

- **Create, Edit & Delete** tasks effortlessly
- **Set Due Dates & Priorities** for better organization
- **Mark Tasks as Completed** with a single tap

### 📌 **Prioritization & Filtering**

- Assign **Low, Medium, or High** priority levels
- **Filter Tasks** into **All, Overdue, and Completed** categories
- **Swipe Gestures** for quick task updates

### 🎨 **User Interface**

- **Floating Add Button (+) for quick task creation**
- **Smooth navigation across different screens**

### 📾 **Data Persistence**

- **Core Data Integration** for permanent task storage
- **Real-Time Updates** across the app

### 📁 **Task Selection for Editing/Deletion**

- When selecting **Edit Task**, users first choose a task to edit
- When selecting **Delete Task**, users pick a task before confirming deletion

---

## 🏠 Project Structure

```
AdvancedToDoApp/
📂 Models/
    📝 TaskModel.swift              # Data model for tasks
📂 Persistence/
    📂 CoreDataManager.swift        # Manages Core Data operations
📂 ViewModels/
    🎯 TaskViewModel.swift          # Handles task logic
📂 Views/
    🏡 Home/
        📋 TaskListView.swift       # Displays task list
        📂 TaskRowView.swift        # Individual task row UI
    ✍️ TaskCreation/
        ➕ AddEditTaskView.swift     # Add/Edit task UI
    🔍 TaskDetails/
        📄 TaskDetailView.swift     # Task detail view
    ℹ️ About/
        ℹ️ AboutView.swift          # App information & contributors
📂 Resources/
    🎨 Assets.xcassets              # App images & icons
🚀 AdvancedToDoAppApp.swift         # Main app entry point
ℹ️ Info.plist                       # App configuration file
```

---

## 🛠 Technology Stack

| **Technology**         | **Description** |
| ---------------------- | --------------- |
| 🖥 **Language**        | Swift           |
| 📱 **Framework**       | SwiftUI         |
| 📂 **Database**        | Core Data       |
| 🛠 **IDE**             | Xcode           |
| 🔄 **Version Control** | Git & GitHub    |

---

## 📝 How to Use

### ➕ **Adding a Task**

1. Tap on the `+` button.
2. Enter a title, description, due date, and priority.
3. Tap **Save** to store the task.

### ✏️ **Editing a Task**

1. Tap `+` and select **Edit Task**.
2. Choose a task from the list.
3. Modify details and save changes.

### 🗑 **Deleting a Task**

1. Tap `+` and select **Delete Task**.
2. Pick a task and confirm deletion.

### ✅ **Marking a Task as Completed**

- Tap the **checkmark icon** next to a task to mark it as done.

---

## 👨‍💻 Contributors

### 🎯 **Group 12**

🚀 **Tej Nileshkumar Patel** - `101450840`\
🚀 **Subhan Mohammed Abdul** - `101397394`\
🚀 **Bhavya Vaghela** - `101427560`

---

## 🔮 Future Enhancements

🚀 **Push Notifications** – Get reminders for upcoming and overdue tasks\
☁️ **Cloud Syncing** – Sync tasks across multiple devices\
🎧 **Voice Input Support** – Add tasks using voice commands

---

💙 **Developed with passion by Group 12** 💙

