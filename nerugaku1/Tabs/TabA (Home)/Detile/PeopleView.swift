//
//  PeopleView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/08/06.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI
import QGrid

struct PeopleView: View {
    var items: [AudioContent]
    
    var body: some View {
        QGrid(self.items, columns: 2) { GridCell(audioContent: $0) }
    }
}

struct GridCell: View {
    //    var person: Person
    var audioContent: AudioContent
    
    var body: some View {
        VStack() {
            audioContent.image
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(color: .primary, radius: 5)
                .padding([.horizontal, .top], 7)
            Text(audioContent.name).lineLimit(1)
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(items: Array(audioContetsData.prefix(10)))
    }
}
