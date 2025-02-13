//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Testing
@testable import Taskly

@MainActor final class ToDoListViewModelTests {

  var sut: ToDoListViewModel!

  init() {
    sut = ToDoListViewModel()
  }

  deinit {
    sut = .none
  }

  // MARK: - Initialization
  @Test func initialization_showAddTaskAlert_isEqualToFalse() {
    let result = sut.showAddTaskAlert

    #expect(result == false, "`showAddTaskAlert` should be equal to false when initialized.")
  }

  @Test func initialization_task_isEqualToEmptyString() {
    let expected = String()

    let result = sut.task

    #expect(result == expected, "`task` should be equal to an empty String when initialized.")
  }

  // MARK: - Add Task
  @Test func addTask_populateAddTaskAlertIsCalled_showAddTaskAlertIsEqualToTrue() {
    sut.populateAddTaskAlert()
    let result = sut.showAddTaskAlert

    #expect(result == true, "`showAddTaskAlert` should be equal to `true` when `populateAddTaskAlert()` is called.")
  }

  @Test func addTask_populateAddTaskAlertIsCalled_taskValueIsEqualToEmptyString() {
    sut.task = "Fake value"

    sut.populateAddTaskAlert()
    let result = sut.task.isEmpty

    #expect(result == true, "`task` should be empty when `populateAddTaskAlert()` is called.")
  }
}
