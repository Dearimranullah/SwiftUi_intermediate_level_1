//
//  ModelAPI.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 15/12/2022.
//

import Foundation
struct PostAPIModelp:Decodable,Encodable {
    let userID: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case title, body
    }
}

struct PostModelpp:Identifiable,Decodable,Encodable  {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}


class APIMODEL:ObservableObject {
    @Published var postArray1:[PostModelpp] = []
    init() {
        getdata()
    }
    func getdata(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard
                let data = data,
                    error == nil,
                    let responce = responce as? HTTPURLResponse,
                    responce.statusCode >= 200 && responce.statusCode < 300 else {
                print(" get Error data")
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
            
            guard let newpost = try? JSONDecoder().decode([PostModelpp].self, from: data) else {
                print("No data")
                return }
            print(newpost)
            DispatchQueue.main.async { [weak self] in
                self?.postArray1 = newpost
                print(self?.$postArray1)
            }

        }.resume()
    }
//   ******* POST*******
    func Postdata(parameters:[String:Any]){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
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
                print("post Error data")
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
            print("json data")
            let jsondata = String(data: data, encoding: .utf8)
            print(jsondata)
            
            guard let newpost = try? JSONDecoder().decode([PostModelpp].self, from: data) else {
                print("No data")
                return }
            
            DispatchQueue.main.async {
//                self?.postArray1.append(newpost)
                print(newpost)
            }

        }.resume()
    }
//    ***** PUT******
    func Putdata(parameters:[String:Any]){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        let data = try? JSONSerialization.data(withJSONObject: parameters)
        var reuest = URLRequest(url: url)
        reuest.httpMethod="PUT"
        reuest.httpBody=data
        reuest.setValue("application/json", forHTTPHeaderField: "Content_Type")
        URLSession.shared.dataTask(with: reuest) { (data, responce, error) in
            guard
                let data = data,
                    error == nil,
                    let responce = responce as? HTTPURLResponse,
                    responce.statusCode >= 200 && responce.statusCode < 300 else {
                print(" put Error data")
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
            print("Data Successfully update")
            print(data)
            let jsondata = String(data: data, encoding: .utf8)
            print(jsondata)
            
            guard let newpost = try? JSONDecoder().decode([PostModelpp].self, from: data) else {
                print("data not Update")
                return }
            print(newpost)
            DispatchQueue.main.async {
                print(newpost)
            }

        }.resume()
    }
// MARK: DELETE
    func Deletedata(parameters:[String:Any]){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        let data = try? JSONSerialization.data(withJSONObject: parameters)
        var reuest = URLRequest(url: url)
        reuest.httpMethod="DELETE"
        reuest.httpBody=data
        reuest.setValue("application/json", forHTTPHeaderField: "Content_Type")
        URLSession.shared.dataTask(with: reuest) { (data, responce, error) in
            guard
                let data = data,
                    error == nil,
                    let responce = responce as? HTTPURLResponse,
                    responce.statusCode >= 200 && responce.statusCode < 300 else {
                print(" Delete Error data")
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
            
            guard let newpost = try? JSONDecoder().decode([PostModelpp].self, from: data) else {
                print("No data")
                return }
            print(newpost)
            DispatchQueue.main.async {
                print(newpost)
            }

        }.resume()
    }
}
