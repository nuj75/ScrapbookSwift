////
////  NoteEdit.swift
////  ScrapbookSwift
////
////  Created by a kandasamy on 2024-05-12.
//
//
//import SwiftUI
//import UIKit
//import PencilKit
//
//
//
//
//
//
//
//
//
//struct NoteEdit: View {
//    
//    @State var note: NoteFile;
//    
//    @State private var canvas = PKCanvasView()
//   @State private var isDrawing = true
//   @State private var color: Color = .black
//   @State private var pencilType: PKInkingTool.InkType = .pencil
//   @State private var colorPicker = false
//    @State var draw = false;
//    @State private var range = NSRange()
//    @State var bold = false
//    @State var italics = false
//    @State var underline = false
////    @State var fontSize = 26;
//    @State var pagesInNote = 1;
//
//    
//    
//    
//    var body: some View {
//        let hello = TextView(content: $note.content, range: $range)//, attributedString: $note.text)
//        
//        
//        GeometryReader { geometry in
//            
//            
//            VStack {
//                
//                HStack {
//                    
//                    Button(action: {
//                        draw = !draw
//                    }) {
//                        
//                        if(draw) {
//                        
//                            Image(systemName: ("pencil.circle.fill"))
//                                .font(.system(size: geometry.size.width * 0.05))
//                                .foregroundColor(.blue)
//                        } else {
//                            Image(systemName: ("pencil.circle"))
//                                .font(.system(size: geometry.size.width * 0.05))
//                                .foregroundColor(.blue)
//                                .cornerRadius(100)
//                        }
//                        
//                    }
//                    
//                    
//                    
//                    
//                    
//                }
//                
//                Spacer()
//
//                HStack {
//                    
//                    
////                    Button (action:  {
////                        bold.toggle()
////
////                        let styleStr = ((bold || italics || underline) ? "#{" : "") + (bold ? "B" : "") + (italics ? "I" : "") + (underline ? "U" : "") + ((bold || italics || underline) ? "}" : "")
////                        print(styleStr)
////                        hello.addStyle(styleStr: styleStr)
////
////                    }) {
////
////                        if (bold) {
////                            Image(systemName: ("pencil.circle.fill"))
////                                .font(.system(size: geometry.size.width * 0.05))
////                                .foregroundColor(.green)
////                        } else {
////                            Image(systemName: ("pencil.circle"))
////                                .font(.system(size: geometry.size.width * 0.05))
////                                .foregroundColor(.green)
////                        }
////                    }
////
////                    Button (action:  {
////                        italics.toggle()
////
////                        let styleStr = ((bold || italics || underline) ? "#{" : "") + (bold ? "B" : "") + (italics ? "I" : "") + (underline ? "U" : "") + ((bold || italics || underline) ? "}" : "")
////                        print(styleStr)
////                        hello.addStyle(styleStr: styleStr)
////                    }) {
////                        if (italics) {
////                            Image(systemName: ("pencil.circle.fill"))
////                                .font(.system(size: geometry.size.width * 0.05))
////                                .foregroundColor(.blue)
////                        } else {
////                            Image(systemName: ("pencil.circle"))
////                                .font(.system(size: geometry.size.width * 0.05))
////                                .foregroundColor(.blue)
////                        }
////                    }
////
////                    Button (action:  {
////                        underline.toggle()
////
////                        let styleStr = ((bold || italics || underline) ? "#{" : "") + (bold ? "B" : "") + (italics ? "I" : "") + (underline ? "U" : "") + ((bold || italics || underline) ? "}" : "")
////                        print(styleStr)
////                        hello.addStyle(styleStr: styleStr)
////
////                    }) {
////                        if (underline) {
////                            Image(systemName: ("pencil.circle.fill"))
////                                .font(.system(size: geometry.size.width * 0.05))
////                                .foregroundColor(.red)
////                        } else {
////                            Image(systemName: ("pencil.circle"))
////                                .font(.system(size: geometry.size.width * 0.05))
////                                .foregroundColor(.red)
////                        }
////                    }
////
//
//                    
//                    Spacer()
//#if os(iOS)
//                    
//                    
//                    ScrollView(.vertical) {
//                        
//                        ZStack {
//                            hello
//                                .frame(height: geometry.size.height * CGFloat(note.pagesInNote))
//                            
//                            DrawingView(isDrawing: $isDrawing, pencilType: $pencilType, color: $color, noteDrawing: $note.drawing)
//                                .navigationBarTitleDisplayMode(.inline).disabled(!draw)
//                                .frame(height: geometry.size.height * CGFloat(note.pagesInNote))
//                            
//                            
//                            
//                            
//                            
//                        }
//                        
//                        Button(action: {
//                            note.pagesInNote += 1
//                        }) {
//                            
//                            
//                            Image(systemName: ("plus.circle.fill"))
//                                .font(.system(size: geometry.size.width * 0.1))
//                                .foregroundColor(customGray)
//                                .cornerRadius(100)
//                            
//                           
//                            
//                        }
//                        
//                        
//                        
//                        
//                        
//                    }
//                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.92)
//                    .cornerRadius(geometry.size.width * 0.01)
//                    .shadow(color: customGrayLighter, radius: 20, x: 0, y: 0)
//                    .scrollDisabled(draw)
//                    
//                    
//#elseif os(macOS)
//
//#endif
//
//                    
//                    Spacer()
//                    
//                }
//                
//                Spacer()
//
//            }
//            
//            
//            
//            
//        }
//        
//        
//        
//        
//    }
//    
//}
//
//#if os(iOS)
//
//
//
//
//struct TextView: UIViewRepresentable {
//    @Binding var content: String;
//    @Binding var range: NSRange;
////    @Binding var attributedString: AttributedString;
//    
//    
//    func makeUIView(context: Context) -> UITextView {
//        let textview = UITextView(frame: .zero);
//        textview.delegate = context.coordinator;
//        textview.isEditable = true;
//        
//        
//        return textview;
//    }
//    
//    func updateUIView(_ uiView: UITextView, context: Context) {
//        styled();
//        
////        uiView.attributedText = NSAttributedString(self.attributedString)
//        
//        uiView.selectedRange = range;
//
//        
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(text: $content, range: $range)
//    }
//    
//    
//    
//    
//    class Coordinator: NSObject, UITextViewDelegate {
//        
//        @Binding var content: String;
//        @Binding var range: NSRange
//        
//        init(text: Binding<String>, range: Binding<NSRange>) {
//            self._content = text;
//            self._range = range
//            
//        }
//        
//        func textViewDidChangeSelection(_ textView: UITextView) {
//            content = textView.text ?? ""
//            range = textView.selectedRange
//            
//            
//        }
//        
//    }
//    
//    
//    
//    
//    typealias UIViewType = UITextView
//    
//    
//    func styled() {
//        
//        
//        
//        let baseAttributes = [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 26)]
//        var attributedString = NSMutableAttributedString(string: self.content, attributes: baseAttributes)
//        
//        attributedString = style(text: self.content, attributedString: attributedString);
//
//        
//        
////        self.attributedString = AttributedString(attributedString);
//        
//        
//    }
//
//
//
//    func style(text: String, attributedString: NSMutableAttributedString) -> NSMutableAttributedString {
//
//        let matched = matches(for: "#\\{[^}]*\\}", in: text)
//        var remove: [NSRange] = [];
//
//
//
//        for var match1 in matched {
//
//            let styleAsString = extractStyle(str: match1);
//
//
//            match1 = match1.replacingOccurrences(of: "{", with: "\\{")
//            match1 = match1.replacingOccurrences(of: "}", with: "\\}")
//
//
//            do {
//                let regex = try NSRegularExpression(pattern: match1)
//                let matches = regex.matches(in: text, options: [], range: NSRange(text.startIndex..., in: text))
//
//
//                var matchIndexes: [Int] = []
//                matches.map { match2 in
//                    matchIndexes.append(match2.range.location)
//
//                }
//
//
//
//                if matchIndexes.count % 2 == 0 {
//                    for index in stride(from: matchIndexes.startIndex, to: matchIndexes.endIndex, by: 2) {
//
//
//                        // Define styled substrings
//                        let importantRange = NSRange(location: matchIndexes[index] + styleAsString.count + 3, length: matchIndexes[index + 1] -  matchIndexes[index] - styleAsString.count - 3)
//
//
//
//                        let importantAttributes = createAttributes(style: styleAsString)
//                        // Apply styles
//                        attributedString.setAttributes(importantAttributes, range: importantRange)
//
//                        remove.append(NSRange(location: matchIndexes[index], length: styleAsString.count + 3))
//                        remove.append(NSRange(location: matchIndexes[index + 1], length: styleAsString.count + 3))
//
//                    }
//
//
//                }
//
//
//            } catch {
//
//
//            }
//
//
//
//        }
//
//        for range in remove {
//            attributedString.setAttributes([.font: UIFont.systemFont(ofSize: 0.01)], range: range)
//
//        }
//
//        return attributedString
//    }
//
//
//
//    func createAttributes(style: String) -> [NSMutableAttributedString.Key : Any] {
//
//
//        var styling = "";
//        var fontSizeStr = "";
//
//        for char in style {
//            if char.isNumber {
//
//                fontSizeStr = fontSizeStr + "\(char)"
//
//            } else {
//                styling = styling + "\(char)"
//            }
//
//
//        }
//
//
//        let fontSize = Int(fontSizeStr) ?? 26
//
//        var traits: [UIFontDescriptor.SymbolicTraits] = [];
//
//        if styling.contains("B") {
//            traits.append(.traitBold)
//        }
//
//        if styling.contains("I") {
//            traits.append(.traitItalic)
//        }
//
//
//
//
//        var returnAttributes: [NSAttributedString.Key : Any] =  [NSAttributedString.Key.font: UIFont.systemFont(ofSize: CGFloat(fontSize)).with(traits)]
//
//
//
//
//
//        if styling.contains("U") {
//            returnAttributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
//        }
//
//
//        return returnAttributes
//
//    }
//
//    
//    
//}
//
//
//struct DrawingView: UIViewRepresentable {
//    // Capture drawings for saving in the photos library
//    @Binding var isDrawing: Bool
//    // Ability to switch a pencil
//    @Binding var pencilType: PKInkingTool.InkType
//    // Ability to change a pencil color
//    @Binding var color: Color
//    @Binding var noteDrawing: Data
//    
//    
//    
//    // Update ink type
//    var ink: PKInkingTool {
//        PKInkingTool(pencilType, color: UIColor(color))
//    }
//    
//    let eraser = PKEraserTool(.bitmap)
//    
//    func makeUIView(context: Context) -> PKCanvasView {
//        // Allow finger and pencil drawing
//        let canvas = PKCanvasView();
//        canvas.delegate = context.coordinator;
//        canvas.drawingPolicy = .anyInput
//        
//        
//        canvas.backgroundColor = UIColor(white: 1, alpha: 0)
//
//
//        
//        
//        // Eraser tool
//        canvas.tool = isDrawing ? ink : eraser
//        canvas.alwaysBounceVertical = true
//        
//        
//        // Toolpicker
//        let toolPicker = PKToolPicker.init()
//        toolPicker.setVisible(true, forFirstResponder: canvas)
//        toolPicker.addObserver(canvas) // Notify when the picker configuration changes
//        canvas.becomeFirstResponder()
//        
//        
//        do {
//            canvas.drawing = try PKDrawing.init(data: noteDrawing)
//        } catch {
//        }
//        
//        
//        return canvas
//    } // makeUIView
//    
//    func updateUIView(_ uiView: PKCanvasView, context: Context) {
//        // Update tool whenever the main view updates
//        uiView.tool = isDrawing ? ink : eraser
//        
//        
//        
//
//    } // updateUIView
//    
//    class Coordinator: NSObject, PKCanvasViewDelegate  {
//        
//        @Binding var drawing: Data;
//        
//        init(drawing: Binding<Data>) {
//            self._drawing = drawing;
//            
//        }
//        
//        func canvasViewDrawingDidChange(_ drawingView: PKCanvasView) {
//            drawing =  drawingView.drawing.dataRepresentation()
//            
//        }
//        
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(drawing: $noteDrawing)
//    }
//
//} // DrawingView
//    
//    
//    
//    
//    
//
//
//
//
//#elseif os(macOS)
//
//#endif
//
//
//
//                                                                                                         
//func extractStyle (str: String) -> String {
//    let start = str.startIndex
//    let begin = str.index(start, offsetBy: 2)
//    let end = str.index(start, offsetBy: max(3, str.count - 1))
//                        
//    
//    return String(str[begin..<end])
//
//
//}
//
//func matches(for regex: String, in text: String) -> [String] {
//
//    do {
//        let regex = try NSRegularExpression(pattern: regex)
//        let nsString = text as NSString
//        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
//        return results.map { nsString.substring(with: $0.range)}
//    } catch let error {
//        print("invalid regex: \(error.localizedDescription)")
//        return []
//    }
//}
//                                                                                                         
//  
//
//
//
//
//
//
//
//
