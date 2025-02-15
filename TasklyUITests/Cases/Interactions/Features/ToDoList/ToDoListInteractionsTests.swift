//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import XCTest
@testable import Taskly

@MainActor final class ToDoListInteractionsTests: SharedUITestingBase {

  func testUserFlow_createANewTask_newTaskIsCreated() {
    createFakeTask(title: "Train for the next marathon")

    let result = app.buttons["to_do_card"].exists // ``ToDoCard`` is set as a button within the ``ToDoListView``.
    XCTAssertTrue(result, "The newly created task should be visible in the task list.")
  }

  func testUserFlow_deleteATask_taskIsDeleted() {
    createFakeTask(title: "Have a nap before running")

    let taskCard = app.buttons["to_do_card"]
    taskCard.swipeLeft()
    let deleteButton = app.buttons["Delete"]
    deleteButton.tap()
    sleep(1)

    let result = app.buttons["to_do_card"].exists // ``ToDoCard`` is set as a button within the ``ToDoListView``.
    XCTAssertFalse(result, "The newly created task should be deleted from the task list.")
  }

  func testUserFlow_markATaskAsCompleted_tapTaskIsMarkedAsCompleted() {
    createFakeTask(title: "Put you shoes on before running")

    let taskCard = app.buttons["to_do_card"]
    taskCard.tap()
    sleep(1)

    let result = app.buttons["checkmark.circle.fill"].exists
    XCTAssertTrue(result, "The task should be marked as completed.")
  }

  func testUserFlow_markATaskAsUncompleted_tapTaskIsMarkedAsUncompleted() {
    createFakeTask(title: "Closed the door before going out running")
    let taskCard = app.buttons["to_do_card"]
    taskCard.tap()
    sleep(1)

    taskCard.tap()
    sleep(1)

    let result = app.buttons["circle"].exists
    XCTAssertTrue(result, "The task should be marked as uncompleted.")
  }
}

// MARK: - Tools
private extension ToDoListInteractionsTests {

  /// Creates a new task in the UI with the given title.
  /// - Parameter title: The title of the task to be created.
  /// - Note: This function simulates user interaction by tapping the ``AddTaskButton`` button,
  /// entering the task title in the alert's text field, and confirming the addition.
  /// - Warning: Uses `sleep(1)` to wait for UI updates, which may slow down test execution.
  func createFakeTask(title: String) {
    app.buttons["create_a_new_task_button"].tap()
    sleep(1)

    let textField = app.alerts.textFields["Create a new task..."]
    textField.typeText(title)
    app.buttons["add_new_task_button"].tap()
    sleep(1)
  }
}
