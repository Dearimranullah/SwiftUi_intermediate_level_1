//
//  Form_data.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 17/05/2023.
//

import SwiftUI

struct Form_data: View {
    @State private var username = ""
       @State private var password = ""
    var body: some View {
        NavigationView {
                   Form {
                       Section(header: Text("Account Information")) {
                           TextField("Username", text: $username)
                           SecureField("Password", text: $password)
                       }

                       Section {
                           Button("Sign In") {
                               // Perform sign-in action
                           }
                       }
                   }
                   .navigationTitle("Login")
               }
    }
}

struct Form_data_Previews: PreviewProvider {
    static var previews: some View {
        Form_data()
    }
}
