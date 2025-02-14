//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation

/// Represent a task object in the to-do list.
struct TaskModel: Equatable, Hashable {

  /// A unique identifier for the task.
  let id: UUID
  /// The task title.
  let title: String
  /// Indicates whether the task is completed.
  var isCompleted: Bool
  /// The timestamp of when the task was created.
  let createdAt: Date

  /// Initialize a first instance of a task when created by the user.
  /// - Parameter title: The task description created by and for the user.
  init(title: String) {
    id = UUID()
    self.title = title
    self.isCompleted = false
    createdAt = .now
  }
}

// MARK: - Data Initializer
extension TaskModel {
  
  /// Initialize and instance of a saved task in the device disk memory.
  /// - Parameter data: The saved task data to retrieve from disk.
  init(with data: TaskData) {
    id = data.taskID
    title = data.title
    isCompleted = data.isCompleted
    createdAt = data.createdAt
  }
}
