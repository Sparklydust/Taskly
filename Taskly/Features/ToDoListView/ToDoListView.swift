//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Populate the To Do list main feature of the application.
struct ToDoListView: View {

  var body: some View {
    NavigationStack {
      List {
        VStack(alignment: .leading, spacing: 8) {
          Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.accent)

          Text("Hello, world!")
        }
      }
      .navigationTitle("To Do")
    }
  }
}

#Preview {
  ToDoListView()
}
