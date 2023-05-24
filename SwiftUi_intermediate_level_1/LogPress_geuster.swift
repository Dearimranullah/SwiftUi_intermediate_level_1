//
//  LogPress_geuster.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 16/10/2022.
//

import SwiftUI

struct LogPress_geuster: View {
    @State var isComplete:Bool = false
    @State var isSuccess:Bool = false
    var body: some View {
//        VStack{
//        RoundedRectangle(cornerRadius: 10)
//                .fill(isSuccess ? Color.green : Color.orange)
//                .frame(maxWidth: isComplete ? .infinity : 0)
//                .frame(height: 70)
//                .frame(maxWidth: .infinity,alignment: .leading)
//                .background(.gray)
//
//            Text("CLICK ME")
//                .foregroundColor(.red)
//                .font(.system(size: 18))
//                .bold()
//                .background(.black)
//                .cornerRadius(30)
//                .onLongPressGesture(minimumDuration: 1.0,maximumDistance: 50) { (istrue) in
//                    if istrue {
//                        withAnimation (.easeInOut(duration: 1.0)){
//                            isComplete.toggle()
//                        }
//                    }
//                } perform: {
//                    withAnimation(.easeInOut){
//                        isSuccess.toggle()
//                       isComplete.toggle()
//                    }
//                }
//
//        }
        VStack{

            Rectangle()
                .fill(isSuccess ? Color.orange :  Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 30)
                .frame(height:55)
                .frame(maxWidth:.infinity, alignment: .leading)
                .background(.gray)
            HStack{
                Text("Click Here")
                    .padding()
                    .padding(.horizontal)
                    .background(.orange)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0,maximumDistance: 50) { (ispressing) in
                        if ispressing {
                            withAnimation(.easeOut(duration: 1.0)) {
                                isComplete = true
                            }
                        }
                        else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ){
                                if !isSuccess {
                                    withAnimation(.easeOut){
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }
                     perform:{
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }

                    }
                Text("Reset")
                    .padding()
                    .padding(.horizontal)
                    .background(.orange)
                    .cornerRadius(10)
                    .onTapGesture {
                        isSuccess = false
                        isComplete = false
                    }

            }
            Text(isComplete ? "Completed" : "Not Completed")
                .foregroundColor(.red)
                .padding()
                .padding(.horizontal)
                .background(isComplete ? Color.orange : Color.gray)
                .cornerRadius(10)
                .onTapGesture {
                    isComplete.toggle()
                }
                .onLongPressGesture(minimumDuration: 3,maximumDistance: 50) {
                    isComplete.toggle()
                }
        }
        
    }
}

struct LogPress_geuster_Previews: PreviewProvider {
    static var previews: some View {
        LogPress_geuster()
    }
}
