//
//  FinalViewModel.swift
//  Final
//
//  Created by user260677 on 12/1/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore


class FinalViewModel : ObservableObject {
    
    @Published var library = [FinalModel]()
    let db = Firestore.firestore()
    
    
    func fetchData() {
        self.library.removeAll()
        db.collection("library")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.library.append(try document.data(as: FinalModel.self))
                        } catch {
                            print(error)
                        }
                    }
                    
                }
                
                
            }
        
    }
    
    func saveData (book: FinalModel) {
        if let id = book.id {
            //Edit book
            if !book.Title.isEmpty {
                let  docRef = db.collection("library").document(id)
                
                docRef.updateData([
                    "Title": book.Title,
                    "Author": book.Author,
                    "Notes": book.Notes
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
            
            
        } else {
            //Add book
            if !book.Title.isEmpty {
                var ref: DocumentReference? = nil
                ref = db.collection("library").addDocument(data: [
                    "Title": book.Title,
                    "Author": book.Author,
                    "Notes": book.Notes
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
            
        }
        
    }
    
}
