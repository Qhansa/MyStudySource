//
//  ContentView.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 25/07/22.
//

import SwiftUI
import CoreData

//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}

/// =================================================

// MARK - 1.4 CORE DATA: READING DATA AND WRITING IT TOO
/// Reading data with Core Data is done with what's called effect request. We describe what we want, how much we sorted/filtered.
/// And then Core Data sends us back  all the matching data for us to use.
///
/// Now we've got to make sure this fetch request stays up to date over time. So as soon objects are creatend or removed our UI stays sycnhrozied.
///
/// Now SwiftUI has a solution for this and it's another property wrapper, this time it's called `@FetchRequest` and takes at least one parameter describing "How we want sorting to happen?". It has quite a specific format. --> Go to `ContentView.swift` file.
struct ContentView: View {
    // MARK - 1.4a CORE DATA: ADDING A PROPERTY
    @FetchRequest(sortDescriptors: []) var sources: FetchedResults<StudySources>
    /// EXPLANATION
    /// - `@FetchRequest` with no sorting, just give it to me in a random whatever you feel like order, then put into your propoerty called Sources with the type  `FetchResults` of the students.
    ///
    /// And from there, we can go ahead and use students like a regular swift array. But there's one catch as you'll see.
    
    // MARK 1.4b CORE DATA:
    /// In our body there's a v stack
    
    var body: some View {
        VStack {
            List(sources){ source in
                Text(source.name ?? "Unknown")
                /// The `source.name` is one area of core data that will greatly annoy you because it has the concept of optional data. It knows optionals are.
                ///
                /// But it's entirely different concept from SwiftUI optionals. They're two different things under the same name `optional`. They mean different things.
                ///
                /// If we set a Core Data, this thing can't be optional like `name`,  cannot be optional -- must be required. It will still generate optional swift porperties.
                ///
                /// Student.name will still be a swift optional even though Core Data has not optional. Because all Core Data cares about is that the properties have values and when they're save, so they're optional in swift for the entire lifetime no matter what you do.
            }
        }
        NavigationView {
            Text("HALO")
//                .foregroundColor(Color("ColorCream"))
            Text("Select a StudySource")
                .foregroundColor(Color("ColorDarkChoco"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


