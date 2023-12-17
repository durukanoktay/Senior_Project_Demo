//
//  profile .swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//

import SwiftUI

struct profile_: View {
    var body: some View {
        
            VStack {
                
                Image("")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 5)
                )
                Text("Name")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.black)
                Text("Personal info")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                VStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/).padding(.all, 10.0).frame( height: 60.0).foregroundColor(.cyan).overlay(Text("E-mail"))
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/).padding(.all, 10.0).frame( height: 60.0).foregroundColor(.cyan).overlay(Text("city"))
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/).padding(.all, 10.0).frame( height: 60.0).foregroundColor(.cyan).overlay(Text("age"))
                    Text("you have 2 friends")
            }
        }
        
    }
}


#Preview {
    profile_()
}
