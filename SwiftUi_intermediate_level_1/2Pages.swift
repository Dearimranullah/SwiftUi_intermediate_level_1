//
//  2Pages.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 18/10/2022.
//

import SwiftUI

struct _Pages: View {
    var body: some View {
        NavigationView{
            VStack(){
                VStack(alignment: .leading){
                    Image("group")
                }
//                VStack(){
//                    HStack{
//                        Text("Login")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color("login"))
//                    }
//                    HStack{
//                        Text("Please enter the mobile number")
//                    }
//                }
               
            }
            .edgesIgnoringSafeArea(.all)
            }
    }
}

struct _Pages_Previews: PreviewProvider {
    static var previews: some View {
        _Pages()
    }
}
