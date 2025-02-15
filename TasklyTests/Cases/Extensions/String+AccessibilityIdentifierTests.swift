//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Testing
@testable import Taskly

struct String_AccessibilityIdentifierTests {

  @Test func extension_addNewTaskButton_returnSnakeCaseValueAddNewTaskButton() throws {
    let expected = "add_new_task_button"

    let result = String.addNewTaskButton

    #expect(result == expected, "Accessibility identifier value for `createANewTask` must be equal to `\(expected)`.")
  }

  @Test func extension_createANewTask_returnSnakeCaseValueCreateANewTask() throws {
    let expected = "create_a_new_task_button"

    let result = String.createANewTaskButton

    #expect(result == expected, "Accessibility identifier value for `createANewTask` must be equal to `\(expected)`.")
  }

  @Test func extension_toDoCard_returnSnakeCaseValueToDoCard() throws {
    let expected = "to_do_card"

    let result = String.toDoCard

    #expect(result == expected, "Accessibility identifier value for `createANewTask` must be equal to `\(expected)`.")
  }
}
