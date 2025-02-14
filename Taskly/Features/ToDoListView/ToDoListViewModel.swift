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
    sortTasks()
    task = String()
  }
}

// MARK: - Task Completion
extension ToDoListViewModel {

  /// Toggles the completion status of a task at the given index.
  /// - Parameter index: The index of the task to toggle the completion for.
  func toggleTaskCompletion(at index: Int) {
    allTasks[index].isCompleted.toggle()
    sortTasks()
  }
}

// MARK: - Sorted Tasks
extension ToDoListViewModel {

  /// Sorts tasks so that uncompleted tasks appear at the top.
  private func sortTasks() {
    allTasks.sort {
      guard $0.isCompleted == $1.isCompleted else { return !$0.isCompleted }
      return $0.createdAt > $1.createdAt
    }
  }
}
