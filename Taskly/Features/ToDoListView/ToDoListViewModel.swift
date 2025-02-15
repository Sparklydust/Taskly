//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation
import OSLog
import SwiftData

/// Managing the To-Do List logic.
@MainActor @Observable final class ToDoListViewModel {

  /// Indicates whether the add task alert should be shown.
  var showAddTaskAlert = false
  /// Holds the newly created task input text.
  var newTaskTitle = String()
  /// Stores all tasks, including pending and completed ones.
  var allTasks: [TaskModel] = []
}

// MARK: - Add Task
extension ToDoListViewModel {

  /// Triggers the add task alert for user to create a new task.
  func populateAddTaskAlert() {
    showAddTaskAlert = true
    newTaskTitle = String()
  }

  /// Actions to perform when user cancel adding a task.
  func cancelAddingTask() {
    newTaskTitle = String()
  }

  /// Actions to perform when user add a new task.
  func addTask() {
    let newTask = TaskModel(title: newTaskTitle)
    saveInDeviceMemory(newTask: newTask)
    allTasks.append(newTask)
    sortTasks()
    newTaskTitle = String()
  }

  /// Saves the newly created task to device memory.
  ///
  /// - Warning: Disabled in debug mode due to a SwiftData fetch issue under Xcode 16.2
  ///   where in-memory concurrency or macro generation can crash tests.
  private func saveInDeviceMemory(newTask: TaskModel) {
    TaskData.modelContext.insert(TaskData(with: newTask))
  }
}

// MARK: - Delete Task
extension ToDoListViewModel {

  /// Delete task at specified index.
  /// - Parameter index: The index of the task to delete.
  func deleteTask(at index: IndexSet) {
    deleteTaskInDeviceMemory(at: index)
    allTasks.remove(atOffsets: index)
  }

  /// Delete a task from device memory.
  /// - Parameter index: The task index to be deleted.
  /// - Warning: Disabled in debug mode due to a SwiftData fetch issue under Xcode 16.2
  ///   where in-memory concurrency or macro generation can crash tests.
  private func deleteTaskInDeviceMemory(at indexSet: IndexSet) {
    do {
      try indexSet.forEach { index in
        try TaskData
          .modelContext
          .fetch(FetchDescriptor<TaskData>())
          .filter { $0.taskID == allTasks[index].id }
          .forEach { TaskData.modelContext.delete($0) }
      }
    } catch {
      Logger().error("Failed to delete TaskData from device memory: \(error.localizedDescription).")
    }
  }
}

// MARK: - Get Tasks
extension ToDoListViewModel {

  /// Get all saved tasks from device memory.
  /// - Warning: Disabled in debug mode due to a SwiftData fetch issue under Xcode 16.2
  ///   where in-memory concurrency or macro generation can crash tests.
  func getTasksFromDeviceMemory() {
    do {
      allTasks = try TaskData
        .modelContext
        .fetch(FetchDescriptor<TaskData>())
        .map({ TaskModel(with: $0) })
      sortTasks()
    } catch {
      Logger().error("Failed to fetch TaskData from device memory: \(error.localizedDescription).")
    }
  }
}

// MARK: - Task Completion
extension ToDoListViewModel {

  /// Toggles the completion status of a given task.
  /// - Parameter task: The task to toggle the completion for.
  func toggleCompletion(on task: TaskModel) {
    guard let index = allTasks.firstIndex(of: task) else { return }
    allTasks[index].isCompleted.toggle()
    updateSavedCompletionStatus(on: allTasks[index])
    sortTasks()
  }

  /// Updates the saved completion status of a task in the device's local storage.
  /// - Parameter task: The task whose completion status needs to be updated.
  private func updateSavedCompletionStatus(on task: TaskModel) {
    do {
      _ = try TaskData
        .modelContext
        .fetch(FetchDescriptor<TaskData>())
        .filter { $0.taskID == task.id }
        .forEach { $0.isCompleted = task.isCompleted }
    } catch {
      Logger().error("Failed to update TaskData in device memory: \(error.localizedDescription).")
    }
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
