//
//  API_Paractice.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 13/12/2022.
//

import SwiftUI
struct GetAPIModelElement2:Identifiable,Decodable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
    
    // MARK: - Address
    struct Address: Decodable{
        let street, suite, city, zipcode: String
        let geo: Geo
        
    // MARK: - Geo
    struct Geo: Decodable {
        let lat, lng: String
    }
    }
    // MARK: - Company
    struct Company: Decodable {
        let name, catchPhrase, bs: String
    }
}

//*******************
//struct GetAPIModelElement:Identifiable,Decodable,Encodable {
//    let userID, id: Int
//    let title, body: String
//
//    enum CodingKeys: String, CodingKey {
//        case userID = "userId"
//        case id, title, body
//    }
//}
class GetModels:ObservableObject {
    @Published var postArray:[GetAPIModelElement2]=[]
    init(){
        getdata()
    }
    func getdata(){
        guard let url=URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard
                let data = data,
                error == nil,
                let responce = responce as? HTTPURLResponse,
                responce.statusCode >= 200 && responce.statusCode < 300 else {
                print("Error Data")
                return
            }
            print("Data Successsfully Load")
            print(data)
            let jsondata = String(data: data, encoding: .utf8)
            print(jsondata)
            guard let localdata = try? JSONDecoder().decode([GetAPIModelElement2].self, from: data) else {
                print("No Data")
                return
            }
            print("DAta Success")
            DispatchQueue.main.async { [weak self] in
                self?.postArray.append(contentsOf: localdata)
            }
        }.resume()
    }
    func postdata(parameter:[String:Any]){
        guard let url=URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard
                let data = data,
                error == nil,
                let responce = responce as? HTTPURLResponse,
                responce.statusCode >= 200 && responce.statusCode < 300 else {
                print("Error Data")
                return
            }
            print("Data Successsfully Load")
            print(data)
            let jsondata = String(data: data, encoding: .utf8)
            print(jsondata)
            guard let localdata = try? JSONDecoder().decode([GetAPIModelElement2].self, from: data) else {
                print("No Data")
                return
            }
            print("DAta Success")
            DispatchQueue.main.async { [weak self] in
                self?.postArray.append(contentsOf: localdata)
            }
        }.resume()
    }
}


struct API_Paractice: View {
    @StateObject var vm:GetModels=GetModels()
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false){
                VStack{
                    ForEach(vm.postArray){ data in
                        VStack(alignment: .leading){
                                    Text("\(data.id)")
                                        .foregroundColor(.white)
                                    Text(data.email.lowercased())
                                        .foregroundColor(.white)
                                        .bold()
                                    Text(data.username)
                                .bold()
                                .foregroundColor(.gray)
                                    Text(data.phone)
                                }.frame(width: 300, alignment: .leading)
                            .padding()
                            .background(.gray)
                            .cornerRadius(20)
                          


                    }
                }
            }
        }
    }
}

struct API_Paractice_Previews: PreviewProvider {
    static var previews: some View {
        API_Paractice()
    }
}
