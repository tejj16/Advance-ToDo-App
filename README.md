# 📝 Advanced To-Do App

📅 **Your personal task manager – stay organized, stay productive!**

**Advanced To-Do App** is a feature-rich task management application built for iOS using **SwiftUI** and **Core Data**. It allows users to create, manage, and track their daily tasks with a smooth, elegant, and responsive interface.

---

## 🌟 Features & Functionality

### ✅ Task Management
- Create, edit, and delete tasks effortlessly  
- Set due dates, descriptions, and priority levels  
- Mark tasks as completed with a single tap  

### 📌 Prioritization & Filtering
- Assign tasks **Low**, **Medium**, or **High** priority  
- Filter tasks by **All**, **Overdue**, and **Completed**  
- Use swipe gestures for quick deletion  

### 🗣 Voice Input
- Use built-in **Speech Recognition** to add task descriptions by voice  
- Tap the **microphone icon** to start or stop recording  

### 🎨 User Interface
- Intuitive design with light/dark mode support  
- Floating **+** button for quick task actions  
- Seamless navigation across multiple screens  

### 💾 Data Persistence
- **Core Data** ensures all tasks are stored permanently  
- Real-time syncing of task data between views  

### 🧠 Smart Task Selection
- When editing or deleting, users select from a task list before proceeding  
- Prevents accidental modification or deletion  

---

## 📱 Interface

> main page

---

![Simulator Screenshot - iPhone 16 Pro - 2025-03-30 at 12 22 05](https://github.com/user-attachments/assets/cc9a8e33-1a28-471b-bf8f-a67272f775d1)

---

> Home Page
 
---

![Simulator Screenshot - iPhone 16 Pro - 2025-03-30 at 12 22 13](https://github.com/user-attachments/assets/b0639557-336a-4193-a2fb-228e556e005b)

---

> Add task(option)

---

![Simulator Screenshot - iPhone 16 Pro - 2025-03-30 at 12 22 16](https://github.com/user-attachments/assets/e0c7c922-e844-4bdd-ab2d-ee569d3f5a58)
![Simulator Screenshot - iPhone 16 Pro - 2025-03-30 at 12 22 19](https://github.com/user-attachments/assets/ffc7974a-e6f8-43bc-a110-dc982b316bfb)





## 🏗 Project Structure

```
AdvancedToDoApp/
├── Models/
│   └── TaskModel.swift                # Codable struct (if applicable)
├── Persistence/
│   ├── CoreDataManager.swift         # Core Data stack setup
│   └── Persistence.swift             # NSPersistentContainer handler
├── ViewModels/
│   └── TaskViewModel.swift           # Observable task logic controller
├── Views/
│   ├── Home/
│   │   ├── TaskListView.swift        # Displays list with filter
│   │   └── TaskRowView.swift         # UI for single row task
│   ├── TaskCreation/
│   │   └── AddEditTaskView.swift     # Add/edit form with speech support
│   ├── TaskDetails/
│   │   ├── TaskDetailView.swift      # Detailed task view
│   │   └── SelectTaskView.swift      # List for selecting task to edit/delete
│   ├── LaunchScreen/
│   │   └── LaunchScreen.swift        # Initial branding screen
│   └── About/
│       └── AboutView.swift           # App & team info
├── Resources/
│   ├── Assets.xcassets               # App icon and assets
│   └── Info.plist                    # Permissions & config
├── AdvancedToDoAppApp.swift          # App entry point
└── DateFormatter+Extension.swift     # Custom date formatting helper
```

---

## 🛠 Technology Stack

| Technology       | Description            |
|------------------|------------------------|
| 🖥 Language       | Swift                  |
| 📱 Framework      | SwiftUI                |
| 💾 Database       | Core Data              |
| 🎙 Voice Input    | Speech Framework (iOS) |
| 🛠 IDE            | Xcode                  |
| 🔄 Version Control| Git & GitHub           |

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your-username/AdvancedToDoApp.git
cd AdvancedToDoApp
```

### 2️⃣ Open in Xcode
- Launch `AdvancedToDoApp.xcodeproj`  
- Make sure you're using **Xcode 15+**

### 3️⃣ Run the App
- Select a simulator or device  
- Press ▶️ **Run**

---

## 📚 How to Use

### ➕ Add a Task
1. Tap the **+** button in the bottom toolbar  
2. Fill in the **title**, **description**, **due date**, and **priority**  
3. Tap **Save**

### 🎤 Add Description Using Voice
1. Tap the **mic icon** beside the description field  
2. Speak your task — text auto-fills as you speak  
3. Tap mic again to stop

### ✏️ Edit a Task
1. Tap **+ → Edit Task**  
2. Choose a task from the list  
3. Modify and save

### 🗑 Delete a Task
1. Tap **+ → Delete Task**  
2. Select a task and confirm deletion

### ✅ Complete a Task
- Tap the **checkmark icon** to toggle completion

---

## 👨‍💻 Contributors

🎯 **Group 12**

- 🚀 **Tej Nileshkumar Patel** – *101450840*  
- 🚀 **Subhan Mohammed Abdul** – *101397394*  
- 🚀 **Bhavya Vaghela** – *101427560*

---

## 🔮 Future Enhancements

- 🔔 **Push Notifications** for task reminders  
- ☁️ **CloudKit Syncing** across devices  
- 🎧 **Advanced Voice Commands** for full task creation

---

> 💡 “Stay organized. Stay ahead.”  
> 💙 Developed with passion by **Group 12** 💙
