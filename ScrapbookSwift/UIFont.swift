//
//  UIFont.swift
//  ScrapbookSwift
//
//  Created by a kandasamy on 2024-05-15.
//


#if os(iOS)
import Foundation
import SwiftUI

extension UIFont {
    var bold: UIFont {
        return with([.traitBold])
    }
    
    var italic: UIFont {
        return with([.traitItalic])
    }
    
    var boldItalic: UIFont {
        return with([.traitBold, .traitItalic])
    }
    
    func fontWith(attributes: [UIFontDescriptor.SymbolicTraits]) -> UIFont {
        return with(attributes)
    }
    
    
    
    func with(_ traits: [UIFontDescriptor.SymbolicTraits]) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
    
    func without(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits))) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}


#endif
