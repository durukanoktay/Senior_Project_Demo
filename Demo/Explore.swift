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
                            Text("Send Friendship Request")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding(8)
                .background(
                    NavigationLink(
                        destination: FriendRequestView(friend: $selectedFriend),
                        isActive: Binding.constant(selectedFriend != nil),
                        label: { EmptyView() }
                    )
                )
            }
            .navigationTitle("Suggested Users")
        }
    }
}

struct FriendRequestView: View {
    @Binding var friend: Friend?

    var body: some View {
        VStack {
            Text("Send friend request to \(friend?.name ?? "")?")
                .padding()
            HStack {
                Button("Cancel") {
                    friend = nil
                }
                .padding()
                Spacer()
                Button("Send Request") {
                    // Handle sending friend request logic here
                    friend?.isFriend = true
                    friend = nil
                }
                .padding()
            }
        }
        .navigationTitle("Friend Request")
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
