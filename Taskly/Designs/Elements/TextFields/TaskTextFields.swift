//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Text fields for user to create a new task within a popup SwiftUI alert.
struct TaskTextFields: View {

  /// The task being created.
  @Binding var title: String
  /// The action to perform when the user create the task.
  let onAdd: () -> Void
  /// The action to perform when the user cancel the task.
  let onCancel: () -> Void

  var body: some View {
    VStack {
      TextField(L10n.taskAddTextFieldPlaceholder, text: $title)
        .autocorrectionDisabled()

      HStack {
        Button(L10n.buttonAddTask, action: onAdd)
          .disabled(title.isEmpty)
          .accessibilityIdentifier(.addNewTaskButton)

        Button(L10n.buttonCancelTask, role: .cancel, action: onCancel)
      }
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  @Previewable @State var title = String()
  TaskTextFields(
    title: $title,
    onAdd: {},
    onCancel: {}
  )
}
