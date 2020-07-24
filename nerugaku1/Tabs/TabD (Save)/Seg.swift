import SwiftUI

struct Seg: View {
    var body: some View {
        
        
        Home1()
    }
}

struct Seg_Previews: PreviewProvider {
    static var previews: some View {
        
        Seg()
    }
}

struct Home1 : View {
    
    
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        
        
        VStack(spacing: 0){
            
            AppBar(index: self.$index, offset: self.$offset)
            
            
            GeometryReader{g in
                
                HStack(spacing: 0){
                    
                    First()
                        .frame(width: g.frame(in : .global).width)
                    
                    Scnd()
                        .frame(width: g.frame(in : .global).width)
                    
                    Third()
                        .frame(width: g.frame(in : .global).width)
                }
                .offset(x: self.offset)
                .highPriorityGesture(DragGesture()
                .onEnded({ (value) in
                
                    if value.translation.width > 50{// minimum drag...
                        
                        print("right")
                        self.changeView(left: false)
                    }
                    if -value.translation.width > 50{
                        
                        print("left")
                        self.changeView(left: true)
                    }
                }))
                
            }
        }
        .animation(.default)
        .edgesIgnoringSafeArea(.all)
    }
    
    func changeView(left : Bool){
        
        if left{
            
            if self.index != 3{
                
                self.index += 1
            }
        }
        else{
            
            if self.index != 0{
                
                self.index -= 1
            }
        }
        
        if self.index == 1{
            
            self.offset = self.width
        }
        else if self.index == 2{
            
            self.offset = 0
        }
        else{
            
            self.offset = -self.width
        }
        // change the width based on the size of the tabs...
    }
}

struct AppBar : View {
    
    @Binding var index : Int
    @Binding var offset : CGFloat
    var width = UIScreen.main.bounds.width
    
    
    
    var body: some View{
        
        VStack(alignment: .leading, content: {
            
//            これがヘッダーみたいな感じ
//            Text("Header")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//                .padding(.leading)
//                .padding(.bottom)
            
            
//            ここからは横並びの選択ボタンが入る
            HStack{
                Button(action: {
                    
                    self.index = 1
                    self.offset = self.width
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            

                            
                            Text("Playlist")
                                .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.7))
                        }
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.white : Color.clear)
                            .frame(height: 4)
                    }
                }
                Button(action: {
                    
                    self.index = 2
                    self.offset = 0
                    
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            

                            
                            Text("Phrase")
                                .foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.7))
                        }
                        
                        Capsule()
                            .fill(self.index == 2 ? Color.white : Color.clear)
                            .frame(height: 4)
                    }
                }
                Button(action: {
                    
                    self.index = 3
                    self.offset = -self.width
                    
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            

                            
                            Text("Hisory")
                                .foregroundColor(self.index == 3 ? .white : Color.white.opacity(0.7))
                        }
                        
                        Capsule()
                            .fill(self.index == 3 ? Color.white : Color.clear)
                            .frame(height: 4)
                    }
                }
            }
            
        })
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
        .padding(.horizontal)
            .padding(.top, -10.0)
        .background(Color.red)
    }
    
}
    




struct First : View {
    
    var body: some View{
        
        
        GeometryReader{_ in
            
            VStack{
                
                        List(1..<20) { localIndex in
                    // すべての行で共通のビュー

                    ContentsRow()
                    
                    
                }
            }
        }
        .background(Color.white)
    }
}

struct Scnd : View {
    
    var body: some View{
        
        
        GeometryReader{_ in
            
            VStack{
                
                        List(1..<20) { localIndex in
                    // すべての行で共通のビュー

                    ContentsRow()
                    
                    
                }
            }
        }
        .background(Color.white)
    }
}

struct Third : View {
    
    var body: some View{
        
        GeometryReader{_ in
            
            VStack{
                
                        List(1..<20) { localIndex in
                    // すべての行で共通のビュー

                    ContentsRow()
                    
                    
                }
            }
        }
        .background(Color.white)
    }
}
