//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI
import Testing
@testable import Taskly

struct Image_NameTests {
  
  @Test func imageName_addTask_isEqualToSystemNamePlusCircleFill() {
    let expected = Image(systemName: "plus.circle.fill")
    
    let result = Image.addTask
    
    #expect(result == expected, "Image `addTask` should be equal to `plus.circle.fill` system image.")
  }
  
  @Test func imageName_taskCompleted_isEqualToSystemNameCheckmarkCircleFill() {
    let expected = Image(systemName: "checkmark.circle.fill")
    
    let result = Image.taskCompleted
    
    #expect(result == expected, "Image `taskCompleted` should be equal to `checkmark.circle.fill` system image.")
  }
  
  @Test func imageName_taskUncompleted_isEqualToSystemNameCircle() {
    let expected = Image(systemName: "circle")
    
    let result = Image.taskUncompleted
    
    #expect(result == expected, "Image `taskUncompleted` should be equal to `checkmark.circle.fill` system image.")
  }
}
