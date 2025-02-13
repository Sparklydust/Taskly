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

  @Test func initialization_allTasks_isEqualToEmptyArrayOfTaskModel() {
    let expected: [TaskModel] = []

    let result = sut.allTasks

    #expect(result == expected, "`allTasks` should be equal to \(expected) when initialized.")
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

  @Test func addTask_userCancelAddingTask_taskValueIsEqualToEmptyString() {
    sut.task = "Fake value"
    
    sut.cancelAddingTask()
    let result = sut.task.isEmpty
    
    #expect(result == true, "`task` should be empty when `cancelAddingTask()` is called.")
  }

  @Test func addTask_userAddTask_taskValueIsEqualToEmpty() {
    sut.task = "Fake value"
    
    sut.addTask()
    let result = sut.task.isEmpty

    #expect(result == true, "`task` value must be empty after adding a task.")
  }

  @Test func addTask_userAddTask_allTasksContainsNewlyCreateTask() {
    let expected = "Fake Task"
    sut.allTasks.removeAll()
    sut.task = expected

    sut.addTask()
    let result = sut.allTasks.contains(where: { $0.description == expected })

    #expect(result == true, "`allTasks` must contain the newly created task.")
  }

  @Test func addTask_userAddTwoTasks_allTasksContainsBothTasks() {
    let taskFake = "Fake Task"
    sut.allTasks.removeAll()
    sut.task = taskFake
    let expected = 2

    sut.addTask()
    sut.task = taskFake
    sut.addTask()
    let result = sut.allTasks.count

    #expect(result == expected, "`allTasks` must contain \(expected) tasks.")
  }
}
