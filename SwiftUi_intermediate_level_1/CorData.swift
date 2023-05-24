//
//  CorData.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 04/12/2022.
//

import SwiftUI
import CoreData
class CordataModel:ObservableObject {
    let container:NSPersistentContainer
    @Published  var saveEntities:[FruitsEntity]=[]
    init() {
    container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { (description,error) in
            if let error = error {
                print("Error Load persistance \(error)")
            }
            
        }
        fetchrequest()
    }
    func fetchrequest(){
        let request = NSFetchRequest<FruitsEntity>(entityName: "FruitsEntity")
        do {
           saveEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fetching . \(error)")
        }
        
    }
    func addfruite(text:String){
        let newfruite = FruitsEntity(context: container.viewContext)
        newfruite.name = text
        saveEntity()
    }
    func saveEntity(){
        do{
           try container.viewContext.save()
            fetchrequest()
        } catch let error {
            print("Save Error \(error)")
        }
        
    }
    func Delete(indexset:IndexSet){
        guard let index = indexset.first else {return}
        let entity = saveEntities[index]
        container.viewContext.delete(entity)
        saveEntity()
    }
}

struct CorData: View {
    @StateObject var vm:CordataModel=CordataModel()
    @State var Fieldfruite:String = ""
    var body: some View {
        NavigationView{
            VStack(spacing:20){
                TextField("Enter Fruite here...", text: $Fieldfruite)
                    .padding()
                    .font(.headline)
                    .frame(maxWidth:.infinity)
                    .frame(height: 55)
                    .background(.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
                HStack{
                    Button {
                        vm.addfruite(text: Fieldfruite)
                        Fieldfruite=""
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth:.infinity)
                            .frame(height: 55)
                            .background(.pink)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }

                }
                List{
                    ForEach(vm.saveEntities) { entity in
                        Text(entity.name ?? "No Name")
                        
                    }
                    .onDelete(perform: vm.Delete)
                }
                .listStyle(PlainListStyle())
                   
            }
            .navigationTitle("Fruite")
        }
    }
}

struct CorData_Previews: PreviewProvider {
    static var previews: some View {
        CorData()
    }
}
