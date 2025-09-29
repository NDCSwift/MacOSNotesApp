//
    // Project: MacOSNotesApp
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

struct ContentView: View {
    @StateObject private var store = NoteStore()
    @State private var selectedNote: Note?
    
    var body: some View {
        NavigationSplitView{
            List(selection: $selectedNote) {
                ForEach(store.notes){ note in
                    Text(note.title)
                        .tag(note)
                }
            }
            .navigationTitle("My Notes")
            .listStyle(.sidebar)
            .frame(minWidth: 200)
            .toolbar {
                Button("New Note"){
                    let newNote = Note(title: "Untitled", body: "")
                    store.notes.append(newNote)
                    selectedNote = newNote
                }
            }
        }
    detail:
        {
            if let note = selectedNote {
                NoteDetailView(note: binding(for: note))
            } else{
                Text("Select a note")
                    .foregroundStyle(.secondary)
            }
        }
    }
    private func binding(for note: Note) -> Binding<Note> {
        guard let index = store.notes.firstIndex(where: { $0.id == note.id}) else {
            fatalError("Note not found")
        }
        return $store.notes[index]
    }
}

#Preview {
    ContentView()
}
