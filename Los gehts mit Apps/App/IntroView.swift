//#-learning-task(getStartedWithApps)
import SwiftUI

/*#-code-walkthrough(1.first)*/
struct/*#-code-walkthrough(1.introView)*/ IntroView: /*#-code-walkthrough(1.introView)*/ View {
    /*#-code-walkthrough(1.body)*/
    var body: some View {
        //#-learning-task(placeOneViewInsideAnother)
        //#-learning-task(addImageInHStack)
        //#-learning-task(modifierWalkthrough)

        //#-learning-task(modifier)
        /*#-code-walkthrough(2.bothModifiers)*/
        //#-learning-task(changeText)
        /*#-code-walkthrough(1.text)*/
        Text("Hello, World.")
        Text("Hello, Creator.")
        HStack {
            Text("Inner View")
            Image("FriendAndGem")
                .resizable()
                .scaledToFit()
        }
        /*#-code-walkthrough(1.text)*/
        //#-learning-task(textElement)
    }
    /*#-code-walkthrough(1.body)*/
}

/*#-code-walkthrough(1.preview)*/
struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IntroView()
        }
    }
}
/*#-code-walkthrough(1.preview)*/
