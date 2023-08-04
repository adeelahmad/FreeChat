//
//  ContentView.swift
//  Mantras
//
//  Created by Peter Sugihara on 7/31/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Conversation.createdAt, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Conversation>
  
  @State private var selection: Set<FetchedResults<Conversation>.Element> = Set()
  @State private var showDeleteConfirmation = false
  
  let agent: Agent = Agent(id: "0", prompt: "")
  
  var body: some View {
    NavigationSplitView {
      List(items, id: \.self, selection: $selection) { item in
          Text(item.createdAt!, formatter: itemFormatter)
          .contextMenu {
            Button {
              deleteConversation(item)
            } label: {
              Label("Delete", systemImage: "trash")
            }
          }
      }
      .frame(minWidth: 50)
      .toolbar {
        ToolbarItem {
          Spacer()
        }
        ToolbarItem {
          Button(action: addConversation) {
            Label("Add conversation", systemImage: "plus")
          }
        }
      }
    } detail: {
      if selection.first != nil {
        ConversationView(conversation: selection.first!, agent: agent)
      } else {
        Text("Select a conversation")
      }
    }
    .navigationSplitViewColumnWidth(50)
    .onReceive(NotificationCenter.default.publisher(for: NSApplication.willTerminateNotification), perform: { output in
      agent.llama.stopServer()
    })
    .backgroundStyle(.ultraThinMaterial)
    .onDeleteCommand { showDeleteConfirmation = true }
    .confirmationDialog("Are you sure you want to delete \(selection.count == 1 ? "this" : "\(selection.count)") conversation\(selection.count == 1 ? "" : "s")?", isPresented: $showDeleteConfirmation) {
      Button("Yes, delete", role: .destructive, action: {})
    }
  }
  
  private func addConversation() {
    withAnimation {
      let newConversation = Conversation(context: viewContext)
      newConversation.createdAt = Date()
      
      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }

  private func deleteSelectedConversations() {
    withAnimation {
      selection.forEach(viewContext.delete)
      selection = Set()
      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
  
  private func deleteConversation(_ item: FetchedResults<Conversation>.Element) {
    withAnimation {
      viewContext.delete(item)
      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
