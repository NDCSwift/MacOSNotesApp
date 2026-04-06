# 📝 macOS Notes App — SwiftUI

A native macOS notes app built with SwiftUI — featuring a sidebar list, a detail editor, and persistent JSON file storage.

---

## 🤔 What this is

This is a clean, functional macOS notes app built entirely in SwiftUI. A `NoteStore` persists notes as JSON in the app's sandboxed documents directory, a sidebar list handles navigation, and `NoteDetailView` handles reading and editing. It's a solid reference for building two-pane macOS apps with `NavigationSplitView`.

## ✅ Why you'd use it

- **`NavigationSplitView` layout** — sidebar + detail pane, the standard macOS two-column structure
- **`NoteStore`** — handles JSON encode/decode and file persistence across app launches
- **`Note` model** — clean value type with id, title, body, and date fields
- **macOS-native feel** — no UIKit bridging, pure SwiftUI macOS APIs throughout
- **Sandbox entitlements** — shows the correct `.entitlements` setup for sandboxed file access

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/-g2N4x3dtnc)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/MacOSNotesApp.git
cd MacOSNotesApp
```

### 2. Open in Xcode
Double-click `MacOSNotesApp.xcodeproj`.

### 3. Set Your Development Team
TARGET → Signing & Capabilities → Team

### 4. Update the Bundle Identifier
Change `com.example.MyApp` to a unique identifier.

---

## 🛠️ Notes
- Notes are saved to the app's sandboxed documents directory.
- If you see a code signing error, verify Team and Bundle ID match.

## 📦 Requirements
- Xcode 16+
- macOS 14+

📺 [Watch the guide on YouTube](https://youtu.be/-g2N4x3dtnc)
