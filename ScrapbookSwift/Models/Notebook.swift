//
//  Notebook.swift
//  ScrapbookSwift
//
//  Created by a kandasamy on 2024-05-12.
//

import SwiftData
import Foundation

@Model
final class Notebook {
    @Attribute(.unique) var id: UUID;
    var name: String;
    var timestamp: Date;
    
    var notes: [NoteFile];
    
    
    init(id: UUID, timestamp: Date, name: String) {
        self.name = name;
        self.timestamp = timestamp;

        self.id = id;
        self.notes = [];
        
    }
    
    
}
