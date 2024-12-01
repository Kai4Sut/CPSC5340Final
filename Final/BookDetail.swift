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
            
            TextEditor(text: $book.Notes)
                .font(.system(size:20))
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    finalApp.saveData(book: book)
                    book.Title = ""
                    book.Author = ""
                    book.Notes = ""
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: .constant(FinalModel(Title: "Title of Book", Author: "Author of Book", Notes: "Review of Book")))
    }
}
