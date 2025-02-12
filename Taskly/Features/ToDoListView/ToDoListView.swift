//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Populate the To Do list main feature of the application.
struct ToDoListView: View {

  var body: some View {
    NavigationStack {
      List {
        ToDoCard(task: "Buy some milk")
      }
      .navigationTitle(L10n.toDoListNavBarTitle)
    }
  }
}

#Preview {
  ToDoListView()
}
