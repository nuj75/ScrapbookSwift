//
//  ContentView.swift
//  ScrapbookSwift
//
//  Created by a kandasamy on 2024-05-12.
//

import SwiftUI
import SwiftData



let customGray = Color("customGray");
let customGrayLighter = Color("customGrayLighter");


struct ContentView: View {
    

    @State var newNote = false
    
    @State var currNotebook : Notebook? = nil;
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Notebook.timestamp) private var notebooks: [Notebook]
    @State var text = ""
    @State var searchQuery = "";
    
    var filteredNotebooks: [Notebook] {
        print(searchQuery)
        if searchQuery.isEmpty {
            return notebooks
        }
        
        let filteredItems = notebooks.compactMap { notebook in
            let titleContainsQuery = notebook.name.range(of: searchQuery, options: .caseInsensitive) != nil
            
            return titleContainsQuery ? notebook : nil
        }
        
        return filteredItems
    }
    
    
    

    

    var body: some View {
        GeometryReader { geometry in
            
            NavigationStack {
                
                
                
                    
                   
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Spacer()
                            
                            Text("Notes App")
                                .font(.system(size: geometry.size.height * 0.06))
                                .bold()
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.1)
                                .background(customGray)
                                .cornerRadius(geometry.size.width * 0.03)
                            
                            
                            Spacer()
                        } .padding(geometry.size.width * 0.02)
                        
                        
                        
                        
                        HStack {
                            Spacer()
                            VStack(alignment: .leading){
                                if let currNotebook = currNotebook {
                                    
                                    
                                    var filteredNotes: [NoteFile] {
                                        print(searchQuery)
                                        if searchQuery.isEmpty {
                                            return currNotebook.notes
                                        }
                                        
                                        let filteredItems = currNotebook.notes.compactMap { note in
                                            let titleContainsQuery = note.name.range(of: searchQuery, options: .caseInsensitive) != nil
                                            
                                            return titleContainsQuery ? note : nil
                                        }
                                        
                                        return filteredItems
                                    }
                                    
                                    
                                    
                                    ZStack {
                                        VStack(alignment: .leading){
                                            
                                            searchBar(title: "Search Notes", width: geometry.size.width * 0.8, height: geometry.size.height, contentView: self, text: $searchQuery)
                                            
                                            
                                            ZStack {
                                                
                                                
                                                NavigationStack {
                                                    List(filteredNotes) { note in
                                                       
                                                      
                                                        
#if os(iOS)
                                                        NavigationLink(destination:
                                                                        NoteEditFork(note: note)
                                                        ) {
                                                            Text(note.name)
                                                        }
                                                        
#elseif os(macOS)
//                                                        NoteEdit()
#endif
                                                        
                                                    }
                                                    
                                                    
                                                } .frame(width: geometry.size.width * 0.75,
                                                         height: geometry.size.height * 0.6)
                                                
                                                
                                                
                                                
                                                
                                                
                                                VStack {
                                                    Spacer().frame(height: geometry.size.width * 0.75)
                                                    Button(action: {
                                                        withAnimation {
                                                            newNote.toggle()
                                                        }
                                                        
                                                        
                                                        
                                                    }) {
                                                        
                                                        
                                                        Image(systemName: ("pencil.tip.crop.circle"))
                                                            .font(.system(size: geometry.size.width * 0.1))
                                                            .background(customGrayLighter)
                                                            .cornerRadius(100)
                                                        
                                                        
                                                    }
                                                    
                                                    .buttonStyle(PlainButtonStyle())
                                                }
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                            }
                                        }
                                        
                                        Rectangle()
                                            .frame(width: geometry.size.width,
                                                   height: geometry.size.height)
                                            .foregroundColor(.white)

                                            .background(.ultraThinMaterial)
                                            .opacity((newNote) ? 0.6 : 0)
                                        
                                        
                                        VStack {
                                            Spacer()
                                        
                                        
                                        
                                            
                                        
                                            TextField("Note Name",
                                                      text: $text)
                                                .textFieldStyle(PlainTextFieldStyle())
                                                .font(Font.system(size: 32))

                                                .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 0.035)
                                                .padding([.horizontal], geometry.size.width * 0.01)
                                                .disabled(!newNote)
                                                .onSubmit {
                                                    withAnimation {
                                                        newNote.toggle()
                                                    }
                                                    
                                                    let note = NoteFile(id: UUID(), timestamp: Date(), notebook: currNotebook, name: text);
                                                    
                                                    modelContext.insert(note);
                                                    
                                                    
                                                    
                                                    
                                                    do {
                                                        
                                                        try modelContext.save()
                                                    } catch {
                                                        fatalError()
                                                    }
                                                    
                                                    currNotebook.notes.append(note);
                                                    
                                                    text = ""
                                        
                                                }
                                                .textInputAutocapitalization(.never)
                                                .disableAutocorrection(true)
                                                .multilineTextAlignment(.center)

                                                .opacity(newNote ? 1 : 0)
                                        
                               
                                        
                                            Button("Cancel") {
                                                withAnimation {
                                                    newNote.toggle()
                                                }
                                            } .disabled(!newNote)
                                                .opacity(newNote ? 1 : 0)
                                            
                                            
                                            
                                        
                                        
                                            Spacer()
                                        
                                        }
                                    }
                                    
                                    
                                    
                                }
                                
                                else {
                                    
                                    ZStack {
                                        
                                        VStack(alignment: .leading){
                                            searchBar(title: "Search Notebooks", width: geometry.size.width * 0.8, height: geometry.size.height, contentView: self, text: $searchQuery)
                                            
                                            
                                            
                                            let items = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
                                            
                                            ScrollView {
                                                LazyVGrid (columns: items) {
                                                    ForEach(filteredNotebooks) {notebook in
                                                        Button(action: {currNotebook = notebook}){
                                                            Text("\(notebook.name)")
                                                                .font(.system(size: geometry.size.height * 0.02))
                                                                .foregroundColor(.black)
                                                                .frame(width: geometry.size.height * 0.125,
                                                                       height: geometry.size.height * 0.125
                                                                )
                                                            
                                                        }
                                                        .background(customGrayLighter)
                                                        .cornerRadius(20)
                                                        .padding(geometry.size.height * 0.01)
                                                    }
                                                }
                                            }.frame(width: geometry.size.width * 0.7,
                                                    height: geometry.size.height * 0.6
                                            )
                                        }
                                        
                                        
                                        VStack {
                                            Spacer().frame(height: geometry.size.width * 0.75)
                                            Button(action: {
                                                withAnimation {
                                                    newNote.toggle()
                                                }
                                                
                                                
                                                
                                            }) {
                                                
                                                
                                                Image(systemName: ("plus.circle.fill"))
                                                    .font(.system(size: geometry.size.width * 0.1))
                                                    .foregroundColor(customGray)
                                                    .cornerRadius(100)
                                                
                                                
                                            }
                                            
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                        
                                        

                                        
                                        Rectangle()
                                            .frame(width: geometry.size.width,
                                                   height: geometry.size.height)
                                            .foregroundColor(.white)

                                            .background(.ultraThinMaterial)
                                            .opacity((newNote) ? 0.6 : 0)
                                        
                                        
                                        
                                        
                                        
                                        VStack {
                                            Spacer()
                                        
                                        
                                        
                                            
                                        
                                            TextField("Notebook Name",
                                                      text: $text)
                                                .font(Font.system(size: 32))
                                                .textFieldStyle(PlainTextFieldStyle())
                                                .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 0.035)
                                                .padding([.horizontal], geometry.size.width * 0.01)
                                                .disabled(!newNote)
                                                .onSubmit {
                                                    withAnimation {
                                                        newNote.toggle()
                                                        
                                                    }
                                                    
                                                    let notebook = Notebook(id: UUID(), timestamp: Date(), name: text);
                                                    modelContext.insert(notebook);
                                                    
                                                    do {
                                                        try modelContext.save()
                                                    } catch {
                                                        fatalError()
                                                    }
                                                    
                                                    text = ""
                                        
                                                }
                                                .textInputAutocapitalization(.never)
                                                .disableAutocorrection(true)
                                                .multilineTextAlignment(.center)
                                                .opacity(newNote ? 1 : 0)
                                        
                               
                                        
                                            Button("Cancel") {
                                                withAnimation {
                                                    newNote.toggle()
                                                }
                                            }
                                            .disabled(!newNote)
                                            .opacity(newNote ? 1 : 0)


                                                
                                        
                                            Spacer()
                                        
                                        }
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                
                                
                                
                                
                            }
                            .frame(width: geometry.size.width * 0.75,
                                   height: geometry.size.height * 0.6)
                            .padding(geometry.size.width * 0.05)
                            .border(.blue)
                            
                            
                            Spacer()
                        }
                    }
                    
                    
                    Spacer()
                    .frame(height: geometry.size.height * 0.03)
                                        
                    
                    
                    
                    
                  
                    
                    
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
                
                

                
                
                
                
                
            }
            
           
            
            
        }
        
                    
            
        
    
  
    
    
}

    



private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()



                





struct searchBar: View {
    var title: String;
    var width: CGFloat;
    var height: CGFloat;
    let contentView: ContentView
    @Binding var text: String;

    var body: some View {

            HStack {
                if (contentView.currNotebook != nil) {
                    Button(action: {contentView.currNotebook = nil}){
                        Image(systemName: ("arrow.turn.up.left"))
                            .font(.system(size: width * 0.02))
                            .foregroundColor(.black)
                    }.padding([.trailing], width * 0.01)
                }

                Image(systemName: ("magnifyingglass"))


                TextField(title, text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(width: width * 0.75, height: height * 0.035)
                    .padding([.horizontal], width * 0.01)
                    .overlay(RoundedRectangle(cornerRadius: width * 0.01).stroke(Color.gray))




            }





    }
}


//#Preview {
//    ContentView()
//        .modelContainer(for: [NoteFile.self, Notebook.self], inMemory: true)
//}




