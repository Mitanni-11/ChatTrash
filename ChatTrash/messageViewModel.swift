//
//  messageViewModel.swift
//  ChatTrash
//
//  Created by 三谷大典 on 2020/06/23.
//  Copyright © 2020 三谷大典. All rights reserved.
//

import Foundation
import Firebase

struct messageDataType: Identifiable {
    var id: String
    var name: String
    var message: String
}

class MessageViewModel: ObservableObject {
    @Published var messages = [messageDataType]()

    init() {
        let db = Firestore.firestore()

        db.collection("messages").addSnapshotListener { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snap = snap {
                for i in snap.documentChanges {
                    if i.type == .added {
                        let name = i.document.get("name") as! String
                        let message = i.document.get("message") as! String
                        let id = i.document.documentID

                        self.messages.append(messageDataType(id: id, name: name, message: message))
                    }
                }
            }
        }
    }

    func addMessage(message: String , user: String) {
        let data = [
            "message": message,
            "name": user
        ]

        let db = Firestore.firestore()

        db.collection("messages").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            print("success")
        }
    }

}
