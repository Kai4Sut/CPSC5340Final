//
//  ContentView.swift
//  Final
//
//  Created by user260677 on 12/1/24.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject var finalApp = FinalViewModel()
    @State var book = FinalModel(Title: "", Author: "", Notes: "")
    
    var body: some View {
        NavigationStack{
            List {
                ForEach($finalApp.library) { $book in NavigationLink {
                    BookDetail(book: $book)
                } label: {
                    Text(book.Title)
                }
                }
                Section {
                    NavigationLink {
                        BookDetail(book: $book)
                    } label: {
                        Text("Add Book")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
            }
            .onAppear {
                finalApp.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
