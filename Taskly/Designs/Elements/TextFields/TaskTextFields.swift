//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Text fields for user to create a new task within a popup SwiftUI alert.
struct TaskTextFields: View {

  /// The task being created.
  @Binding var task: String
  /// The action to perform when the user create the task.
  let onAdd: () -> Void
  /// The action to perform when the user cancel the task.
  let onCancel: () -> Void

  var body: some View {
    VStack {
      TextField(String(), text: $task)
        .autocorrectionDisabled()

      HStack {
        Button(L10n.buttonAddTask, action: onAdd)
          .disabled(task.isEmpty)

        Button(L10n.buttonCancelTask, role: .cancel, action: onCancel)
      }
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  @Previewable @State var task = String()
  TaskTextFields(
    task: $task,
    onAdd: {},
    onCancel: {}
  )
}
