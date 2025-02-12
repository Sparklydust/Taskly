//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Button that enables the user to add new task.
struct AddTaskButton: View {

  @State private var isTapped = false

  /// Action to perform when the button is tapped.
  let action: () -> Void

  var body: some View {
    Button(action: {
      isTapped.toggle()
      action()
    }) {
      Image.addTask
        .font(.title2)
        .foregroundStyle(.accent)
        .symbolEffect(.bounce, options: .nonRepeating, value: isTapped)
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  AddTaskButton(action: {})
}
