//
//  FinalModel.swift
//  Final
//
//  Created by user260677 on 12/1/24.
//

import Foundation
import FirebaseFirestore


struct FinalModel : Codable, Identifiable {
    @DocumentID var id : String?
    var Title : String
    var Author : String
    var ISBN : String
    var Notes : String
    
}
