//
//  ContentView.swift
//  AppDemo1
//
//  Created by Kyley Jones on 11/1/23.
//


import SwiftUI

// global url for now since the site is the same
let websiteURL = "https://codingincolor.net/tech-development-application/"

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("codingIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                
                Text("My Awesome App")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                
                Text("Making people's tech dreams come true!")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding()
                
                NavigationLink(destination: StateView()) {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
            }
        }
    }
}

struct StateView: View {
    // Define an array of state options for the dropdown menu
    let stateOptions = ["Select State", "AZ", "CA", "NV"]
    
    @State private var selectedStateIndex = 0
    
    var body: some View {
        VStack {
            Text("Products by State")
                .font(.title)
                .padding()

            Picker("Select a state", selection: $selectedStateIndex) {
                ForEach(0..<stateOptions.count, id: \.self) { index in
                    Text(self.stateOptions[index])
                }
            }
            .pickerStyle(MenuPickerStyle())

            if selectedStateIndex != 0 {
                NavigationLink(destination: selectedStateIndex == 1 ? AZProductsView() : AZProductsView()) {
                    Text("Go to Product Page")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
            } else {
                Text("Please select a state first.")
                    .foregroundColor(.red)
                    .padding(.top, 20)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct SignUpView: View {
//    @State private var firstName = ""
//    @State private var lastName = ""
//    @State private var email = ""
//    
//    var body: some View {
//        VStack {
//            Image("codingIcon")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50, height: 50)
//            
//            Text("Sign Up Here")
//                .font(.largeTitle)
//                .foregroundColor(.black)
//                .padding()
//            
//            // Sign-up form elements
//            // First Name TextField
//            TextField("First name", text: $firstName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            
//            // Last Name TextField
//            TextField("Last Name", text: $lastName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            
//            // Email TextField
//            TextField("Email", text: $email)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            NavigationLink(destination: ProductsView()) {
//                Text("Next")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.black)
//                    .cornerRadius(8)
//            }
//        }
//        
//    }
//}

struct ProductsView: View {
    var body: some View {
        Text("Product List")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
        
        let gridItems = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
        
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(1 ..< 7) { imageNumber in
                    NavigationLink(destination: getPageViewForImage(imageNumber)) {
                        VStack {
                            Spacer() // Pushes the text to the top
                            Image("image\(imageNumber)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                            
                            Text("Product \(imageNumber)")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                        
                    }
                }
            }
            .padding()
        }
    
    }

    // Helper function to return the appropriate destination view for each image
    func getPageViewForImage(_ imageNumber: Int) -> some View {
        switch imageNumber {
        case 1:
            return AnyView(Page1View())
        case 2:
            return AnyView(Page2View())
        case 3:
            return AnyView(Page3View())
        case 4:
            return AnyView(Page4View())
        case 5:
            return AnyView(Page5View())
        case 6:
            return AnyView(Page6View())
        default:
            return AnyView(EmptyView())
        }
    }
}

struct Page1View: View {
    var body: some View {
        Text("Product 1")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
        
        Image("image1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)

        Button(action: {
            // Open the website URL
            if let url = URL(string: websiteURL) {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Visit Website")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
        }
        .padding(.top, 20)
    }
}

struct AZProductsView: View {
    var body: some View {
        Text("Product 1")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
        
        Image("image1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)

        Button(action: {
            // Open the website URL
            if let url = URL(string: websiteURL) {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Product Website")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
        }
        
        NavigationLink(destination: Page2View()) {
            Text("Next Product")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
        }
        .padding(.top, 20)
    }
}

struct Page2View: View {
    var body: some View {
        Text("Product 2")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
        
        Image("image2")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)


        Button(action: {
            // Open the website URL
            if let url = URL(string: websiteURL) {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Visit Website")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
        }
        
        NavigationLink(destination: ProductsView()) {
            Text("All Products")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(8)
        }
        .padding(.top, 20)
    }
}

struct Page3View: View {
    var body: some View {
        Text("Product 3")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
        
        Image("image3")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)


        Button(action: {
            // Open the website URL
            if let url = URL(string: websiteURL) {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Visit Website")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
        }
        .padding(.top, 20)
    }
}

struct Page4View: View {
    var body: some View {
        Text("Product 4")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
        
        Image("image4")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)


        Button(action: {
            // Open the website URL
            if let url = URL(string: websiteURL) {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Visit Website")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
        }
        .padding(.top, 20)
    }
}

struct Page5View: View {
    var body: some View {
        Text("Product 5")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
        
        Image("image5")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)


        Button(action: {
            // Open the website URL
            if let url = URL(string: websiteURL) {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Visit Website")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
        }
        .padding(.top, 20)
    }
}

struct Page6View: View {
    var body: some View {
        Text("Product 6")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
        
        Image("image6")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)

        
        Button(action: {
            // Open the website URL
            if let url = URL(string: websiteURL) {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Visit Website")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
        }
    }
}
