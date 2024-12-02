//
//  ContentView.swift
//  Final
//
//  Created by user260677 on 12/1/24.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject var finalApp = FinalViewModel()
    @State var book = FinalModel(Title: "", Author: "", ISBN: "", Notes: "")
    
    var body: some View {
        NavigationStack{
            List {
                ForEach($finalApp.library) { $book in NavigationLink {
                    BookDetail(book: $book)
                } label: {
                    HStack{
                        Image(systemName: "book.closed.fill")
                            .resizable()
                            .frame(width: 30, height: 40)
                            .foregroundColor(.green)
                            .padding(10)
                            
                        VStack {
                            Text(book.Title)
                                .font(.system(size: 25))
                            Text(book.Author)
                                .font(.system(size:15))
                        }
                    }
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
            .refreshable {
                finalApp.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
