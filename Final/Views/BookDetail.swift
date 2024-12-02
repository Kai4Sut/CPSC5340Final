//
//  BookDetail.swift
//  Final
//
//  Created by user260677 on 12/1/24.
//

import SwiftUI

struct BookDetail: View {
    
    @Binding var book : FinalModel
    @StateObject var finalApp = FinalViewModel()
    
    var body: some View {
        
        VStack {
            TextField("Book Title", text: $book.Title)
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            TextField("Book Author", text: $book.Author)
                .font(.system(size: 25))
            
            TextField("ISBN (optional)", text: $book.ISBN)
                .font(.system(size:15))
            
            TextEditor(text: $book.Notes)
                .font(.system(size:20))
            
            if !book.ISBN.isEmpty {
                AsyncImage(url: URL(string:"https://covers.openlibrary.org/b/isbn/\(book.ISBN)-M.jpg"))
                    
                
                Link("View Book Details", destination: URL(string:"https://openlibrary.org/isbn/\(book.ISBN)")!)
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    finalApp.saveData(book: book)
                    book.Title = ""
                    book.Author = ""
                    book.ISBN = ""
                    book.Notes = ""
                } label: {
                    Text("Save")
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    finalApp.deleteData(book: book)
                    book.Title = ""
                    book.Author = ""
                    book.ISBN = ""
                    book.Notes = ""
                } label: {
                    Text("Delete")
                }
            }
        }
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: .constant(FinalModel(Title: "Wrath", Author: "Sharon Moalem", ISBN: "9781454955382", Notes: "Review of Book")))
    }
}
