import SwiftUI

struct Test: View {

@State private var isActive : Bool = false

var body: some View {
    NavigationView {
        NavigationLink(destination: AudioView(), isActive: self.$isActive) {
                Image(systemName: "play.circle.fill")
                .padding(.bottom, 10.0)
                .frame(width: nil)
                .font(.system(size: 55.0, weight: .thin))
                .foregroundColor(.gray)
        }.buttonStyle(PlainButtonStyle())
    }
  }
}


struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
