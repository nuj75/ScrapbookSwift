//
//  MyAttributedString.swift
//  ScrapbookSwift
//
//  Created by a kandasamy on 2024-05-27.
//

import Foundation


class MyAttributedString : Encodable & Decodable {
    let attributedString : NSAttributedString
        
    init(nsAttributedString : NSAttributedString) {
        self.attributedString = nsAttributedString
    }
    
    public required init(from decoder: Decoder) throws {
        let singleContainer = try decoder.singleValueContainer()
        guard let attributedString = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSAttributedString.self, from: singleContainer.decode(Data.self)) else {
            throw DecodingError.dataCorruptedError(in: singleContainer, debugDescription: "Data is corrupted")
        }
        self.attributedString = attributedString
    }
    
    public func encode(to encoder: Encoder) throws {
        var singleContainer = encoder.singleValueContainer()
        try singleContainer.encode(NSKeyedArchiver.archivedData(withRootObject: attributedString, requiringSecureCoding: false))
    }
    


    
}
