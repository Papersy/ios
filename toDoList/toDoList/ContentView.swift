//
//  ContentView.swift
//  toDoList
//
//  Created by user224043 on 11/25/22.
//

import SwiftUI

struct ContentView: View {
    
    
    struct Task : Identifiable {
        let id = UUID()
        let title:String
        let description : String
        let img: String
        @State var isDone: Bool = false
    }
    
    @State var tasks = [
        Task(title: "tasks 1", description: "opis1", img: "Photo1", isDone: false) ,
        Task(title: "tasks 2", description: "opis2", img: "Photo2", isDone: true) ,
        Task(title: "tasks 3", description: "opis3", img: "Photo3", isDone: false)
    ]

    var body: some View {
        NavigationView{
            List{
                ForEach(tasks) {
                    task in HStack {
                        NavigationLink(task.title, destination: TaskView(opis: task.description, img: task.img))
                        Toggle("", isOn: task.$isDone)
                    }
                }
                .onDelete{indexSet in
                    tasks.remove(atOffsets: indexSet)
                }
                .onMove { indexSet, index in
                    tasks.move(fromOffsets: indexSet, toOffset: index)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
