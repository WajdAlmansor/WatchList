
import SwiftUI

struct EmptyListView: View {
    var body: some View {
        ContentUnavailableView {
            Circle()
                .fill(.blue.gradient)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 30)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 60)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 90)
                .frame(width: 180)
                .overlay{
                    Image(systemName: "movieclapper")
                        .resizable()
                        .scaledToFit()
                        .frame(width:100)
                        .foregroundStyle(Color(UIColor.secondarySystemBackground))
                        .padding(.top, -6)
                }
                .padding(.bottom, 90)
        }//End ContentUnavailableView
        description: {
            
            //boxed section with a label and grouped content
            GroupBox{
                
                //container that provides tab-based navigation
                TabView{
                    PageTabView(icon: "1.circle", description: "Add some movies to the WatchList if you plan to watch them later.")
                        .padding(.bottom, 36)
                    PageTabView(icon: "2.circle", description: "later on you can also choose a random film to watch.")
                        .padding(.bottom, 36)
                }//End tabView
                
                //display TabView as swipeable pages with page indicator dots
                .tabViewStyle(PageTabViewStyle())
                .frame(minWidth:0,maxWidth: 560, minHeight: 120, maxHeight: 180)
            }//End groupBox
        }
    }
}


//light mode
#Preview("Light Theme"){
    EmptyListView()
}

//dark mode
#Preview("Dark Theme"){
    EmptyListView()
        .preferredColorScheme(.dark)
}
