//
//  StoreView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 18/09/22.
//

import SwiftUI

struct StoreView: View {
    //@StateObject used for creating class the first time
    @StateObject var model = StoreViewModel()
//    @ObservedObject private var settings = UserSettings()
    
    @State var isList: Bool = false
    @State var filtered: Bool = false
    
    var columns = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    
    var body: some View {
                
        
        NavigationView {
            ZStack{
                if isList {
                    List(model.storeData, id: \.id) { product in
                        NavigationLink(destination: ProductView(product: product)) {
                            HStack(alignment: .top) {
                                AsyncImage(url: URL(string: product.image)) {
                                    image in image.resizable().aspectRatio(contentMode: .fit)
                                } placeholder: {
                                ProgressView()
                                }
                                .frame(width:104, height: 150)
                                VStack(alignment: .leading) {
                                    Text(product.title)
                                        .font(.callout)
                                    Text("$"+(String(format:"%.02f", product.price)))
                                        .fontWeight(.bold)
                                        
                                }
                            }
                        }
                    }
                    
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(model.storeData, id: \.id) {product in
                                NavigationLink(destination: ProductView(product: product)) {
                                    ProductCard(product: product)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .task {
                await model.loadProductData()
            }
            .navigationTitle("FakeStore")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing)
                {
//                    Button("Log Out") {
//                        UserDefaults.standard.set(false,forKey: "LOG_IN_KEY")
//                    }
//                    .foregroundColor(.red)
                    
                    HStack {
                        Button {
                            filtered.toggle()
                        } label: {
                            Image("filters")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:20, height:20)
                        }
                        Button {
                            isList.toggle()
                        } label: {
                            Image(systemName: isList ? "tablecells" : "list.dash")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:20, height:20)
                        }
                    }
                    .padding(.trailing, 5)
                }
            }
            
        }
//        .flipsForRightToLeftLayoutDirection(true)
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
//        StoreView()
//            .environment(\.locale, .init(identifier: "ar"))
    }
}
