//
//  Friends.swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//

import SwiftUI

struct Friends: View {
    var messages: [Message] = [
        Message(senderName: "Mert ç.", content: "Merhaba!", seen: true),
        Message(senderName: "Alper D.", content: "Nasılsın?", seen: false),
        Message(senderName: "Durukan O.", content: "Selam!", seen: false)
    ]

    var body: some View {
        NavigationView {
            List(messages) { message in
                NavigationLink(destination: Text(message.content)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(message.senderName)
                                .font(.headline)
                            if
                                (message.seen == true)
                            {
                                Text(message.content)
                                    .foregroundColor(.gray)
                            }
                            else 
                            {
                                Text(message.content)
                                    .foregroundColor(.black)
                            }
                            
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
