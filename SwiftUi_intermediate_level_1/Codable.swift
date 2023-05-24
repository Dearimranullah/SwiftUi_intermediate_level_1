//
//  Codable.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 06/12/2022.
//
//Codable = Decodable + Encodable

import SwiftUI
import Foundation
// if we write Codable there is no need of Decodable and  Encodable
//struct CustomerModel:Identifiable , Decodable , Encodable {
    struct CustomerModel: Identifiable, Decodable , Encodable {
    let id:String
    let name:String
    let point:Int
    let ispremium:Bool
//    init(id: String, name: String, point: Int, ispremium: Bool) {
//        self.id = id
//        self.name = name
//        self.point = point
//        self.ispremium = ispremium
//    }
//    enum CodingKeys: CodingKey {
//        case id
//        case name
//        case point
//        case ispremium
//    }
////    ********Code for Decodable
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.point = try container.decode(Int.self, forKey: .point)
//        self.ispremium = try container.decode(Bool.self, forKey: .ispremium)
//    }
////   ******** Code for Encodable
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(point, forKey: .point)
//        try container.encode(ispremium, forKey: .ispremium)
//        try container.encode(id, forKey: .id)
//    }
}
class CodableModel:ObservableObject{
    @Published var customer:CustomerModel? = nil
    init(){
        getdata()
    }
    func getdata(){
        guard  let data = Jsondata() else {return}
//        do {
//            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        } catch let error {
//            print("Error is Equale to \(error)")
//        }
//        *** we can also wrte the code like this
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
       
//        print("Json Data")
        print(data)
//        print("Local Data")
        print(customer ?? "Not Fount")
//        let jsonString=String(data: data, encoding: .utf8)
//        print(jsonString)
//        if
//            let localdata = try? JSONSerialization.jsonObject(with:data ,options: []),
//            let dictionary = localdata as? [String:Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let poit = dictionary["point"] as? Int,
//                let ispremium = dictionary["ispremium"] as? Bool{
//            let newcustomer=CustomerModel(id: id, name: name, point: poit, ispremium: ispremium)
//            customer=newcustomer
//        }
    }
    func Jsondata() ->Data? {
        let customer = CustomerModel(id: "1111", name: "Imranullah", point: 65, ispremium: true)
        let jsondata = try? JSONEncoder().encode(customer)
//        let dictionary:[String:Any] = [
//            "id":"1234",
//            "name":"Imranullah",
//            "point": 5,
//            "ispremium":true
//        ]
//        let jsondata = try? JSONSerialization.data(withJSONObject:dictionary,options: [])
        return jsondata
    }
}
struct Codable: View {
    @StateObject var vm:CodableModel=CodableModel()
    var body: some View {
        VStack(spacing:20){
//            VStack{
//                Text(vm.customer?.name ?? "imran")
//                Text(vm.customer?.id ?? "45")
//            }
//            Text("\(vm.customer?.name ?? "imran")")
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.point)")
                Text("\(customer.ispremium.description)")
            }
            
        }
    }
}

struct Codable_Previews: PreviewProvider {
    static var previews: some View {
        Codable()
    }
}
