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

  // MARK: - Initialization
  @Test func initialization_description_isEqualToPassValue() {
    let expected = "Get a book when coming home."
    sut = TaskModel(description: expected)

    let result = sut.description

    #expect(result == expected, "`description` must be equal to `\(expected)` when initialized.")
  }

  @Test func initialization_isCompleted_isEqualToFalse() {
    sut = TaskModel(description: String())

    let result = sut.isCompleted

    #expect(result == false, "`isCompleted` must be false when initialized.")
  }

  @Test func initialization_createAt_isEqualToDateNow() {
    let expected = Date.now
    sut = TaskModel(description: String())

    let result = sut.createdAt

    #expect(abs(result.timeIntervalSince(expected)) <= 0.01, "`createdAt` must be equal to `\(expected)` when initialized.")
  }
}
