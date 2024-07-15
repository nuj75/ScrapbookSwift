//
//  Item.swift
//  ScrapbookSwift
//
//  Created by a kandasamy on 2024-05-12.
//

import Foundation
import SwiftData


@Model
final class NoteFile {
    @Attribute(.unique) var id: UUID;
    var timestamp: Date;
    var notebook: Notebook;
    var name: String;
    var content: String;
    var drawing: Data;
    var pagesInNote: Int;
    
    
    
    
    init(id: UUID, timestamp: Date, notebook : Notebook, name: String) {
        self.name = name;
        self.timestamp = timestamp;
        self.id = id;
        self.notebook = notebook;
        self.content = "";
        self.drawing = Data();
        self.pagesInNote = 1;
    }
    
  
        
    
}
