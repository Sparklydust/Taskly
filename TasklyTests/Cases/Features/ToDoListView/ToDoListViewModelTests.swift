//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation
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

  // MARK: - Delete Task
  @Test func deleteTask_userDeleteTaskAtIndex_taskAtSpecifiedIndexIsDeleted() {
    let expected = "Task To Delete"
    let tasksFake: [TaskModel] = [.fake(), .fake(description: expected), .fake(description: "Go for a run.")]
    sut.allTasks.append(contentsOf: tasksFake)

    sut.deleteTask(at: IndexSet(integer: 1))
    let result = sut.allTasks.contains(where: { $0.description == expected })

    #expect(result == false, "Task at specified index must be deleted when calling `deleteTask(at:).")
  }

  // MARK: Task Completion
  @Test func taskCompletion_userMarkTaskAsComplete_taskValueIsCompletedIsEqualToTrue() {
    sut.allTasks.append(.fake())

    sut.toggleCompletion(on: sut.allTasks[0])
    let result = sut.allTasks[0].isCompleted

    #expect(result == true, "task that is completed must be marked as `true` within the `allTasks` array.")
  }

  @Test func taskCompletion_userMarkTaskAsUncomplete_taskValueIsCompletedIsEqualToFalse() {
    sut.allTasks.append(.fake())
    sut.allTasks[0].isCompleted = true

    sut.toggleCompletion(on: sut.allTasks[0])
    let result = sut.allTasks[0].isCompleted

    #expect(result == false, "task that is uncompleted must be marked as `false` within the `allTasks` array.")
  }

  // MARK: - Sorted Tasks
  @Test func sortedTasks_userCompleteATask_completedTaskIsAtTheStackBottom() throws {
    let taskFake1: TaskModel = .fake(description: "Fake Task 1")
    let taskFake2: TaskModel = .fake(description: "Fake Task 2")
    sut.allTasks.append(contentsOf: [taskFake2, taskFake1])
    let expected = taskFake2.id

    sut.toggleCompletion(on: sut.allTasks[0])
    let result = try #require(sut.allTasks.last?.id)

    #expect(result == expected, "Completed task must go at the bottom the list of `allTasks` as `\(expected)`.")
  }

  @Test func sortedTasks_userUncompletedATask_uncompletedTaskIsAtTheStackTop() throws {
    var taskFake1: TaskModel = .fake(description: "Fake Task 1")
    var taskFake2: TaskModel = .fake(description: "Fake Task 2")
    taskFake1.isCompleted = true
    taskFake2.isCompleted = true
    sut.allTasks.append(contentsOf: [taskFake2, taskFake1])
    let expected = taskFake1.id

    sut.toggleCompletion(on: sut.allTasks[1])
    let result = try #require(sut.allTasks.first?.id)

    #expect(result == expected, "Uncompleted task must go at the top of the list of `allTasks` as `\(expected)`.")
  }

  @Test func sortedTasks_userAddANewTask_newUncompletedTaskIsAtTheStackTop() throws {
    let taskFake1: TaskModel = .fake(description: "Fake Task 1")
    sut.allTasks.append(taskFake1)
    let expected = "Added Task"

    sut.task = expected
    sut.addTask()

    let result = try #require(sut.allTasks.first?.description)

    #expect(result == expected, "Uncompleted task must go at the top of the list of `allTasks`.")
  }
}
