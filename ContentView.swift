import SwiftUI
struct ContentView: View {
    
     @State var email: String = ""
     @State var password: String = ""
     @State var isLoading: Bool = false
     @State var loginFailed: Bool = false
     @State var showErrorMessage: Bool = false
     
     var body: some View {
         ZStack {
             Color("BackgroundColor").ignoresSafeArea()
             
             VStack {
                 Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 280)
                 
                 Spacer().frame(height: 64)
                 
                 VStack {
                     TextField("Email", text: $email).padding(.top, 24).padding(.bottom, 22).padding(.horizontal).keyboardType(.emailAddress)
                         
                     Divider()
                     
                     SecureField("Password", text: $password).padding(.top, 12).padding(.bottom, 22).padding(.horizontal)
                         
                 }.background(.white).cornerRadius(4.0)
                 
                 Spacer().frame(height: 16)
                 
                 Button("Login") {
                     isLoading = true
                     loginFailed = false
                     
                     DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                         isLoading = false // Desativar o Carregamento
                         if email != "user@example.com" || password != "password" {
                             loginFailed = true
                             showErrorMessage = true
                             
                             // Ocultar a mensagem após 3 segundos
                             DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                 withAnimation {
                                     showErrorMessage = false
                                 }
                             }
                         }
                     }
                 }.font(.title3).bold().foregroundColor(.white).padding(20).frame(maxWidth: .infinity)
                     .background(Color("ButtonColor")).cornerRadius(4.0)
                 

                 if showErrorMessage {
                
                     Text("We couldn't access your account. Please check your login information")
                         .foregroundColor(.red)
                         .bold()
                         .padding()
                         .background(Color.white)
                         .cornerRadius(8)
                         .shadow(radius: 5)
                         .transition(.move(edge: .bottom).combined(with: .opacity))
                         .animation(.easeInOut, value: showErrorMessage)
                         .multilineTextAlignment(.center)
                 }
                 
                 Spacer().frame(height: 64)

                 VStack(spacing: 8) {
                     Button("Don't have an account? Sign up.") {
                         /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                     }.foregroundColor(.white).bold().padding(.top, 20)
                     
                     Button("Forgot your password") {
                         /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                     }.foregroundColor(Color("TextColor"))
                 }
                 
             }.padding()
             
             if isLoading {
                 ZStack {
                     Color.black.opacity(0.5)
                         .ignoresSafeArea()
                     
                     ProgressView("")
                         .progressViewStyle(CircularProgressViewStyle(tint: .white))
                         .scaleEffect(2)
                         .frame(width: 100, height: 100)
                 }
                 .transition(.opacity)
             }
         }
     }
 }

#Preview {
    ContentView()
}
