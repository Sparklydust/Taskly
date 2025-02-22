//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation

/// Provides localization keys for accessing the app translations
/// used throughout the Taskly application.
enum L10n {

  static let buttonAddTask = String(
    localized: "buttonAddTask",
    comment: "The title populated on the button used to add a new task."
  )

  static let buttonCancelTask = String(
    localized: "buttonCancelTask",
    comment: "The title populated on the button used to cancel a new task."
  )

  static let taskAddTextFieldPlaceholder = String(
    localized: "taskAddTextFieldPlaceholder",
    comment: "Placeholder within the text field that let user enter a new task for their to-do list."
  )

  static let taskUnavailableDescription = String(
    localized: "taskUnavailableDescription",
    comment: "Description populated when there is no task available within the to-do list."
  )

  static let taskUnavailableTitle = String(
    localized: "taskUnavailableTitle",
    comment: "Title populated when there is no task available within the to-do list."
  )

  static let toDoListAlertAddTaskTitle = String(
    localized: "toDoListAlertAddTaskTitle",
    comment: "The title populated on the alert asking for the user to enter their new task."
  )

  static let toDoListNavBarTitle = String(
    localized: "toDoListNavBarTitle",
    comment: "The navigation bar title for the to-do list view."
  )

  public static let toDoCardTaskAccessCompleted = String(
    localized: "toDoCardTaskCompleted",
    comment: "Accessibility label to indicate that a task is completed."
  )

  public static let toDoCardTaskAccessToggleAction = String(
    localized: "toDoCardTaskAccessToggleAction",
    comment: "Accessibility label to indicate that a task can be toggled for completion on a tap."
  )

  public static let toDoCardTaskAccessUncompleted = String(
    localized: "toDoCardTaskUncompleted",
    comment: "Accessibility label to indicate that a task is uncompleted."
  )
}
