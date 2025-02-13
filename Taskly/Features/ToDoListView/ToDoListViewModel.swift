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
}

// MARK: - Add Task
extension ToDoListViewModel {

  /// Triggers the add task alert for user to create a new task.
  func populateAddTaskAlert() {
    showAddTaskAlert = true
    task = String()
  }
}
