//
    // Project: MacOSNotesApp
    //  File: NoteDetailView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI
import UniformTypeIdentifiers

struct NoteDetailView: View {
    @Binding var note: Note
    @State private var previewMode = false
    var body: some View {
        VStack(alignment: .leading){
            TextField("Title", text: $note.title)
                .font(.title)
                .padding(.bottom)
            
            Toggle("Markdown", isOn: $previewMode)
                .toggleStyle(.checkbox)
            
            if previewMode {
                ScrollView{
                    Text(.init(note.body))
                        .padding()
                        .textSelection(.enabled)
                }
            }
            
            else {
                TextEditor(text: $note.body)
                    .font(.body)
                    .border(Color.white.opacity(0.5))
                    .frame(minWidth:200)
            }
            
        }
        .toolbar{
            Button("save"){
                NoteStore().update(note: note)
                NoteStore().save()
            }
            Button("Export") {
                exportNote()
            }
        }
        .padding()
        .navigationTitle(note.title)
    }
    func exportNote() {
        let panel = NSSavePanel()
        panel.allowedContentTypes = [UTType.plainText]
        panel.nameFieldStringValue = note.title + ".txt"
        
        if panel.runModal() == .OK, let url = panel.url {
            do{
                try note.body.write(to: url, atomically: true, encoding: .utf8)
                note.exportURL = url
            } catch {
                print("failed to export note \(error)")
            }
        }
    }
}

#Preview {
    @State var sampleNote = Note(title: "preview", body: "Preview body")
    NoteDetailView(note: $sampleNote)
}
