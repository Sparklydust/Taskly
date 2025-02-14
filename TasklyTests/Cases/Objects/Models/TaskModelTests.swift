//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation
import Testing
@testable import Taskly

final class TaskModelTests {

  var sut: TaskModel!

  init() {
    sut = .fake()
  }

  deinit {
    sut = .none
  }

  // MARK: - Main Initialization
  @Test func mainInitialization_title_isEqualToPassValue() {
    let expected = "Get a book when coming home."
    sut = TaskModel(title: expected)

    let result = sut.title

    #expect(result == expected, "`title` must be equal to `\(expected)` when initialized.")
  }

  @Test func mainInitialization_isCompleted_isEqualToFalse() {
    sut = TaskModel(title: String())

    let result = sut.isCompleted

    #expect(result == false, "`isCompleted` must be false when initialized.")
  }

  @Test func mainInitialization_createAt_isEqualToDateNow() {
    let expected = Date.now
    sut = TaskModel(title: String())

    let result = sut.createdAt

    #expect(abs(result.timeIntervalSince(expected)) <= 0.01, "`createdAt` must be equal to `\(expected)` when initialized.")
  }

  // MARK: - Data Initialization
  @Test func dataInitialization_id_isEqualToPassTaskDataTaskIDValue() {
    let taskDataFake: TaskData = .fake()
    let expected = taskDataFake.taskID
    sut = TaskModel(with: taskDataFake)

    let result = sut.id

    #expect(result == expected, "`id` must be equal to `\(expected)` when initialized.")
  }

  @Test func dataInitialization_title_isEqualToPassTaskDataTitleValue() {
    let taskDataFake: TaskData = .fake()
    let expected = taskDataFake.title
    sut = TaskModel(with: taskDataFake)

    let result = sut.title

    #expect(result == expected, "`title` must be equal to `\(expected)` when initialized.")
  }

  @Test func dataInitialization_isCompleted_isEqualToPassTaskDataIsCompletedValue() {
    let taskDataFake: TaskData = .fake()
    let expected = taskDataFake.isCompleted
    sut = TaskModel(with: taskDataFake)

    let result = sut.isCompleted

    #expect(result == expected, "`isCompleted` must be equal to `\(expected)` when initialized.")
  }

  @Test func dataInitialization_createdAt_isEqualToPassTaskDataCreatedAtValue() {
    let taskDataFake: TaskData = .fake()
    let expected = taskDataFake.createdAt
    sut = TaskModel(with: taskDataFake)

    let result = sut.createdAt

    #expect(result == expected, "`createdAt` must be equal to `\(expected)` when initialized.")
  }
}
