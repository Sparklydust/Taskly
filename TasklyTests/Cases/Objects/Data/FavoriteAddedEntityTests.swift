//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftData
import Testing
@testable import Taskly

final class TaskDataTests {

  var sut: TaskData!

  var container: ModelContainer!

  init() throws {
    container = try ModelContainer(
      for: TaskData.self,
      configurations: .init(isStoredInMemoryOnly: true)
    )
    sut = TaskData(with: .fake())
  }

  deinit {
    sut = .none
    container = .none
  }

  // MARK: - Task Model Initialization
  @Test func initialization_taskID_isEqualToTaskModelIDValuePassedInParameter() {
    let taskModelFake = TaskModel.fake()
    let expected = taskModelFake.id

    sut = TaskData(with: taskModelFake)
    let result = sut.taskID

    #expect(result == expected, "`id` must be equal to passed model `id` when initialized.")
  }

  @Test func initialization_title_isEqualToTaskModelTitleValuePassedInParameter() {
    let taskModelFake = TaskModel.fake()
    let expected = taskModelFake.title

    sut = TaskData(with: taskModelFake)
    let result = sut.title

    #expect(result == expected, "`title` must be equal to passed model `title` when initialized.")
  }

  @Test func initialization_isCompleted_isEqualToTaskModelIsCompletedValuePassedInParameter() {
    let taskModelFake = TaskModel.fake()
    let expected = taskModelFake.isCompleted

    sut = TaskData(with: taskModelFake)
    let result = sut.isCompleted

    #expect(result == expected, "`isCompleted` must be equal to passed model `isCompleted` when initialized.")
  }

  @Test func initialization_createdAt_isEqualToTaskModelCreatedAtValuePassedInParameter() {
    let taskModelFake = TaskModel.fake()
    let expected = taskModelFake.createdAt

    sut = TaskData(with: taskModelFake)
    let result = sut.createdAt

    #expect(result == expected, "`createdAt` must be equal to passed model `createdAt` when initialized.")
  }
}
