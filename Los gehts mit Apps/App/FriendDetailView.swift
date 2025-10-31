import SwiftUI

struct FriendDetailView: View {
    var body: some View {
        VStack {
            HStack { 
                Image("Friend")
                    .resizable()
                    .scaledToFit()
                VStack {
                    Text("Friend")
                        .font(.largeTitle)
                    Text("Byte is a very good friend of mine...")
                        .font(.caption)
                }
            }
            //#-learning-task(addTextInVStack)
        //#-learning-task(describeFriend)
            
        }
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FriendDetailView()
        }
    }
}
