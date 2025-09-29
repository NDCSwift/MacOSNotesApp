//
    // Project: MacOSNotesApp
    //  File: NoteStore.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import Foundation
import Combine

@MainActor
class NoteStore: ObservableObject {
    @Published var notes: [Note] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    private let saveURL: URL = {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docs.appendingPathComponent("notes.json")
    }()
    
    init(){
        load()
        
        $notes
            .sink { [weak self]_ in self?.save()}
            .store(in: &cancellables)
    }
    func load() {
        do{
            let data = try Data(contentsOf: saveURL)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            notes = [Note(title: "Welcome", body: "Start writing notes here!")]
        }
    }
    
    func save(){
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let data  = try encoder.encode(notes)
            try data.write(to: saveURL, options: .atomic)
        } catch {
            print("Failed to save notes: \(error)")
        }
    }
    
    func update(note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id}) {
            notes[index] = note
            
            if let url = note.exportURL {
                do {
                    try note.body.write(to: url, atomically: true, encoding: .utf8)
                }
                catch {
                    print("Failed to export note to file: \(error)")
                }
            }
        }
    }
    
}
