//
//  DownloadJson.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 12/12/2022.
//

import SwiftUI
import Foundation
struct PostAPIModel:Decodable,Encodable {
    let userID: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case title, body
    }
}

struct PostModel:Identifiable,Decodable  {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}


class DownloadWihEscapingModel:ObservableObject {
    @Published var postArray:[PostModel] = []
    init() {
        getdata()
    }
    func getdata(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/5") else {return}
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard
                let data = data,
                    error == nil,
                    let responce = responce as? HTTPURLResponse,
                    responce.statusCode >= 200 && responce.statusCode < 300 else {
                print("Error data")
                return
            }
//            guard error == nil else {
//                print("Errror \(String(describing: error))")
//                return
//            }
//            guard  let responce = responce as? HTTPURLResponse else {
//                print("invalid Responce")
//                return
//            }
//            guard responce.statusCode >= 200 && responce.statusCode < 300 else {
//                print("Status code should be 200 but it is \(responce.statusCode)")
//                return
//            }
            print("Data Successfully loaded")
            print(data)
            let jsondata = String(data: data, encoding: .utf8)
            print(jsondata)
            
            guard let newpost = try? JSONDecoder().decode(PostModel.self, from: data) else {
                print("No data")
                return }
            print(newpost)
            DispatchQueue.main.async { [weak self] in
                self?.postArray.append(newpost)
            }

        }.resume()
    }
//   ******* POST*******
    func Postdata(parameters:[String:Any]){
        guard let url = URL(string: "https://jsonplaceholder.   typicode.com/posts") else {return}
        let data = try? JSONSerialization.data(withJSONObject: parameters)
        var reuest = URLRequest(url: url)
        reuest.httpMethod="POST"
        reuest.httpBody=data
        reuest.setValue("application/json", forHTTPHeaderField: "Content_Type")
        URLSession.shared.dataTask(with: reuest) { (data, responce, error) in
            guard
                let data = data,
                    error == nil,
                    let responce = responce as? HTTPURLResponse,
                    responce.statusCode >= 200 && responce.statusCode < 300 else {
                print("Error data")
                return
            }
//            guard error == nil else {
//                print("Errror \(String(describing: error))")
//                return
//            }
//            guard  let responce = responce as? HTTPURLResponse else {
//                print("invalid Responce")
//                return
//            }
//            guard responce.statusCode >= 200 && responce.statusCode < 300 else {
//                print("Status code should be 200 but it is \(responce.statusCode)")
//                return
//            }
            print("Data Successfully loaded")
            print(data)
            let jsondata = String(data: data, encoding: .utf8)
            print(jsondata)
            
            guard let newpost = try? JSONDecoder().decode(PostModel.self, from: data) else {
                print("No data")
                return }
            print(newpost)
            DispatchQueue.main.async { [weak self] in
                self?.postArray.append(newpost)
            }

        }.resume()
    }
}

struct DownloadJson: View {
    @StateObject var vm:DownloadWihEscapingModel=DownloadWihEscapingModel()
    var body: some View {
        List{
            ForEach(vm.postArray) { data in
                VStack(spacing:20){
                    Text("\(data.id)")
                        .font(.headline)
                        .foregroundColor(.red)
                       
                    Text(data.title)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    Text(data.body)
                        .font(.headline)
                        .foregroundColor(.red)
                        
                    
                    
                    
                }
            }
        }.background(.red)
        
    }
}

struct DownloadJson_Previews: PreviewProvider {
    static var previews: some View {
        DownloadJson()
    }
}
