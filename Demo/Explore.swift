//
//  Explore.swift
//  Demo
//
//  Created by Durukan Oktay on 17.12.2023.
//

import SwiftUI

struct Friend: Identifiable {
    var id = UUID()
    var name: String
    var mutual: Int
    var avatar: String
    var isFriend: Bool = false  // New property to track friendship status
}

var friends: [Friend] = [
    Friend(name: "Mert ç.", mutual: 3, avatar: "Mert"),
    Friend(name: "Alper D.", mutual: 8, avatar: "alper"),
    Friend(name: "Durukan O.", mutual: 43, avatar: "Durukan")
]

struct Explore: View {
    @State private var selectedFriend: Friend?  // Track selected friend for friendship request

    var body: some View {
        NavigationView {
            List(friends) { friend in
                HStack {
                    Image(friend.avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50).clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.green, lineWidth: 2)
                    )
                    VStack(alignment: .leading) {
                        Text(friend.name)
                        Text("Mutual friends: \(friend.mutual)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    if !friend.isFriend {
                        Button(action: {
                            selectedFriend = friend
                        }) {
                            Button("Send Friendship request") {
                                
                                                }.font(.headline)
                            }
                                        }
                                    }
                .padding(8)
                .background(
                )
            }
            .navigationTitle("Suggested Users")
        }
    }
}



struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}


#Preview {
    Explore()
}
