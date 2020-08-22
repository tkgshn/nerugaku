//
//  TabDView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/22.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct TabDView: View {
    @State var currentSubCategoryIndex = 0
    var body: some View {
                NavigationView {
                    YourLibraryView(currentSubCategoryIndex: self.$currentSubCategoryIndex).padding(.top)
            .edgesIgnoringSafeArea(.bottom)
        //        }.navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct TabDView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TabDView()
                .padding(.top)
        }
    }
}
