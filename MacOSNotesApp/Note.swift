//
    // Project: MacOSNotesApp
    //  File: Note.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI
import Foundation

struct Note: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var body: String
    var exportURL: URL?
    
    init(id: UUID = UUID(), title: String, body: String, exportURL: URL? = nil) {
        self.id = id
        self.title = title
        self.body = body
        self.exportURL = exportURL
    }
}
