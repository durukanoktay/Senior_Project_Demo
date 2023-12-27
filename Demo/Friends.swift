//
//  Friends.swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//

import SwiftUI

struct Friends: View {
    var messages: [Message] = [
        Message(senderName: "Mert ç.", content: "Merhaba!", seen: true, date: "11.12.2023", time: "12.03"),
        Message(senderName: "Alper D.", content: "Nasılsın?", seen: false, date: "17.11.2023", time: "02.53"),
        Message(senderName: "Durukan O.", content: "Selam!", seen: false, date: "18.02.2023", time: "21.23")
    ]

    var body: some View {
        NavigationView {
            List(messages) { message in
                NavigationLink(destination: ChatManager()) {
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
