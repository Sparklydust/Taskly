//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation

/// Managing the To-Do List logic.
@MainActor @Observable final class ToDoListViewModel {

  /// Indicates whether the add task alert should be shown.
  var showAddTaskAlert = false
  /// Holds the task input text.
  var task = String()
  /// Stores all tasks, including pending and completed ones.
  var allTasks: [TaskModel] = []
}

// MARK: - Add Task
extension ToDoListViewModel {

  /// Triggers the add task alert for user to create a new task.
  func populateAddTaskAlert() {
    showAddTaskAlert = true
    task = String()
  }

  /// Actions to perform when user cancel adding a task.
  func cancelAddingTask() {
    task = String()
  }

  /// Actions to perform when user add a new task.
  func addTask() {
    let newTask = TaskModel(description: task)
    allTasks.append(newTask)
    task = String()
  }
}

// MARK: - Task Completion
extension ToDoListViewModel {

  /// Toggles the completion status of a task at the given index.
  /// - Parameter index: The index of the task to toggle the completion for.
  func toggleTaskCompletion(at index: Int) {
    allTasks[index].isCompleted.toggle()
  }
}
