//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Testing
@testable import Taskly

struct L10nTests {
  
  @Test func translationForKey_buttonAddTask_returnsAssociatedTranslation() {
    let expected = "Add"
    
    let result = L10n.buttonAddTask
    
    #expect(result == expected, "Translation must match the one in the associated `L10n` Table file.")
  }
  
  @Test func translationForKey_buttonCancelTask_returnsAssociatedTranslation() {
    let expected = "Cancel"
    
    let result = L10n.buttonCancelTask
    
    #expect(result == expected, "Translation must match the one in the associated `L10n` Table file.")
  }
  
  @Test func translationForKey_taskUnavailableDescription_returnsAssociatedTranslation() {
    let expected = "Start by adding a new task to stay organized."
    
    let result = L10n.taskUnavailableDescription
    
    #expect(result == expected, "Translation must match the one in the associated `L10n` Table file.")
  }
  
  @Test func translationForKey_taskUnavailableTitle_returnsAssociatedTranslation() {
    let expected = "No Tasks Yet"
    
    let result = L10n.taskUnavailableTitle
    
    #expect(result == expected, "Translation must match the one in the associated `L10n` Table file.")
  }
  
  @Test func translationForKey_toDoListAlertAddTaskTitle_returnsAssociatedTranslation() {
    let expected = "New Task"
    
    let result = L10n.toDoListAlertAddTaskTitle
    
    #expect(result == expected, "Translation must match the one in the associated `L10n` Table file.")
  }
  
  @Test func translationForKey_toDoListNavBarTitle_returnsAssociatedTranslation() {
    let expected = "To Do"
    
    let result = L10n.toDoListNavBarTitle
    
    #expect(result == expected, "Translation must match the one in the associated `L10n` Table file.")
  }
}
