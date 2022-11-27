//
//  TaskView.swift
//  toDoList
//
//  Created by user224043 on 11/26/22.
//

import SwiftUI

struct TaskView: View {
    var opis: String
    var img: String
    
    var body: some View {
        VStack{
            Image(img).resizable().aspectRatio(contentMode: .fit)
            Text(opis)
        }.frame(width: 250, height: 250)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(opis: "opis1", img: "Photo1")
    }
}
