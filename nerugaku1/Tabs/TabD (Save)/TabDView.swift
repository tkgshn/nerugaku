//
//  TabDView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/22.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct TabDView: View {
    var body: some View {
        YourLibraryView().edgesIgnoringSafeArea(.bottom)
    }
}

struct TabDView_Previews: PreviewProvider {
    static var previews: some View {
        TabDView()
    }
}
