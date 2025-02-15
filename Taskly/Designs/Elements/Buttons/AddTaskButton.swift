//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Button that enables the user to add new task.
struct AddTaskButton: View {

  /// Action to perform when the button is tapped.
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Image.addTask
        .font(.title2)
        .foregroundStyle(.accent)
    }
    .accessibilityIdentifier(.createANewTaskButton)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  AddTaskButton(action: {})
}
