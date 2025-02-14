//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Card populated on the ``ToDoListView`` to showcase user's saved task.
struct ToDoCard: View {

  /// The task to populate on the card.
  var task: TaskModel
  /// The action to toggle the completion or not of the task.
  let action: () -> Void

  var body: some View {
    HStack(alignment: .center) {
      Button(action: {
        withAnimation(.easeInOut(duration: 0.3)) { action() }
      }) {
        (task.isCompleted ? Image.taskCompleted : .taskUncompleted)
          .font(.title2)
          .foregroundStyle(task.isCompleted ? .accent : .secondary)
          .symbolEffect(.bounce, value: task.isCompleted)
          .rotationEffect(.degrees(task.isCompleted ? 0 : 360))
          .animation(.easeInOut(duration: 0.3), value: task.isCompleted)
      }

      Text(task.description)
        .font(.body)
        .foregroundStyle(.primary)
    }
    .padding(.horizontal, 4)
    .padding(.vertical, 8)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  @Previewable @State var task: TaskModel = .fake()
  ToDoCard(
    task: task,
    action: { task.isCompleted.toggle() }
  )
}
