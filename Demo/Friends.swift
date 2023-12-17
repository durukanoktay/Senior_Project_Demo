//
//  Friends.swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//

import SwiftUI

struct Message: Identifiable {
    var id = UUID()
    var senderName: String
    var content: String
}

struct Friends: View {
    var messages: [Message] = [
        Message(senderName: "Mert ç.", content: "Merhaba!"),
        Message(senderName: "Alper D.", content: "Nasılsın?"),
        Message(senderName: "Durukan O.", content: "Selam!")
    ]

    var body: some View {
        NavigationView {
            List(messages) { message in
                NavigationLink(destination: Text(message.content)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(message.senderName)
                                .font(.headline)
                            Text(message.content)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(8)
                }
            }
            .navigationTitle("Messages")
        }
    }
}

struct Friends_Previews: PreviewProvider {
    static var previews: some View {
        Friends()
    }
}


#Preview {
    Friends()
}
