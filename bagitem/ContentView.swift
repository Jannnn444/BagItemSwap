//
//  ContentView.swift
//  bagitem
//
//  Created by Hualiteq International on 2025/8/25.
//

//
//  ContentView.swift
//  bagitem
//
//  Created by Hualiteq International on 2025/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var leftsideItems: [Item] = [
        Item(name: "apple", isChosed: false),
        Item(name: "banana", isChosed: false),
        Item(name: "grape", isChosed: false),
        Item(name: "cake", isChosed: false),
    ]
    @State var rightsideItems: [Item] = [
        Item(name: "cookie", isChosed: false),
        Item(name: "strawberry", isChosed: false),
        Item(name: "berry", isChosed: false),
        Item(name: "watermelon", isChosed: false)
    ]
    
    @State var myLeftsideBag: [Item] = []
    @State var myRightSideBag: [Item] = []
    
    var body: some View {
        HStack {
            
          // MARK: Left side bag
            VStack {
                // Items container
                ZStack {
                    Rectangle()
                        .frame(width: 180, height: 300)
                        .foregroundColor(.blue.opacity(0.5))
                        .cornerRadius(20)
                    
                    VStack {
                        ForEach(leftsideItems.indices, id: \.self) { index in
                            HStack {
                                Button(action: {
                                    toggleItem(at: index, myItems: leftsideItems)
                                }) {
                                    Text(leftsideItems[index].name)
                                        .font(.title)
                                        .foregroundStyle(.black)
                                        .bold()
                         //   Text(items[index].isChosed ? "Remove" : "Add")
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                // Bag container
                ZStack {
                    Rectangle()
                        .frame(width: 180, height: 300)
                        .foregroundColor(.yellow.opacity(0.5))
                        .cornerRadius(20)
                    
                    VStack {
                        Text("Container Bag")
                            .font(.headline)
                            .padding()
                        
                        ForEach(myLeftsideBag, id: \.name) { item in
                            Text(item.name)
                                .padding(.horizontal)
                        }
                        
                        if myLeftsideBag.isEmpty {
                            Text("Bag is empty")
                                .foregroundColor(.gray)
                                .italic()
                        } else if myLeftsideBag.count >= 3 {
                            Text("Bag is full")
                                .foregroundStyle(.gray)
                                .italic()
                        }
                    }
                }
            }
           
           // MARK: Right side bag
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 180, height: 300)
                        .foregroundColor(.blue.opacity(0.5))
                        .cornerRadius(20)
                    
                    VStack {
                        ForEach(rightsideItems.indices, id: \.self) { index in
                            HStack {
                                Button(action: {
                                  toggleItem(at: index, myItems: rightsideItems)
                                }) {
                                    Text(rightsideItems[index].name)
                                        .font(.title)
                                        .foregroundStyle(.black)
                                        .bold()
                                }
                            }.padding(.horizontal)
                        }
                    }
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 180, height: 300)
                        .foregroundColor(.yellow.opacity(0.5))
                        .cornerRadius(20)
                    VStack {
                        Text("Container Bag")
                            .font(.headline)
                            .padding()
                        
                        ForEach(myRightSideBag, id: \.name) { item in
                            Text(item.name)
                                .padding(.horizontal)
                        }
                        
                        if myRightSideBag.isEmpty {
                            Text("Bag is empty")
                                .foregroundStyle(.gray)
                                .italic()
                        } else if myRightSideBag.count >= 3 {
                            Text("Bag is full")
                                .foregroundStyle(.gray)
                                .italic()
                        }
                        
                    }
                }

            }
        }
    }
    
    func toggleItem(at index: Int, myItems: inout [Item]) {
        myItems[index].isChosed.toggle()
        if myItems.count < 3 {
            if myItems[index].isChosed {
                myLeftsideBag.append(leftsideItems[index])
            } else {
                myLeftsideBag.removeAll { $0.name == leftsideItems[index].name }
            }
        } else if myLeftsideBag.count >= 3 {
            myLeftsideBag.removeAll { $0.name == leftsideItems[index].name }
        }
    }
}

#Preview {
    ContentView()
}

struct Item {
    var name: String
    var isChosed: Bool
}
