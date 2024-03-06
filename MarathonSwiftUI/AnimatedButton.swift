
import SwiftUI

struct AnimatedButton: View {
    var size: CGSize = CGSize(width: 70, height: 40)
    
    @State private var tapped = true
    @Namespace private var animation
    @State private var animationInProgress = false
    
    private let buttonImage = Image(systemName: "play.fill").resizable()

    var body: some View {
        Button() {
            guard !animationInProgress else { return }
            animationInProgress.toggle()
            
            withAnimation(.bouncy(duration: 0.3, extraBounce: 0.2)) {
                tapped.toggle()
            } completion: {
                tapped.toggle()
                animationInProgress.toggle()
            }
        } label: {
            if tapped {
                HStack(spacing: 0) {
                    buttonImage.matchedGeometryEffect(id: "Shape1", in: animation)
                        .frame(width: 0, height: 0)
                    buttonImage.matchedGeometryEffect(id: "Shape2", in: animation)
                    buttonImage.matchedGeometryEffect(id: "Shape3", in: animation)
                }
            } else {
                HStack(spacing: 0) {
                    buttonImage.matchedGeometryEffect(id: "Shape1", in: animation)
                    buttonImage.matchedGeometryEffect(id: "Shape2", in: animation)
                    buttonImage.matchedGeometryEffect(id: "Shape3", in: animation)
                        .frame(width: 0, height: 0)
                        
                }
            }
        }
        .frame(width: size.width, height: size.height)
    }
}

#Preview {
    AnimatedButton()
}
