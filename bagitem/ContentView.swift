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
    @State var items: [Item] = [
        Item(name: "apple", isChosed: false),
        Item(name: "banana", isChosed: false),
        Item(name: "grape", isChosed: false),
        Item(name: "cake", isChosed: false),
    ]
    
    @State var myBag: [Item] = []
    
    var body: some View {
        HStack {
            VStack {
                // Items container
                ZStack {
                    Rectangle()
                        .frame(width: 180, height: 300)
                        .foregroundColor(.blue.opacity(0.5))
                        .cornerRadius(20)
                    
                    VStack {
                        ForEach(items.indices, id: \.self) { index in
                            HStack {
                                Button(action: {
                                    toggleItem(at: index)
                                }) {
                                    Text(items[index].name)
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
                        Text("My Bag")
                            .font(.headline)
                            .padding()
                        
                        ForEach(myBag, id: \.name) { item in
                            Text(item.name)
                                .padding(.horizontal)
                        }
                        
                        if myBag.isEmpty {
                            Text("Bag is empty")
                                .foregroundColor(.gray)
                                .italic()
                        }
                        if myBag.count >= 3 {
                            Text("Bag is full")
                                .foregroundStyle(.gray)
                                .italic()
                        }
                    }
                }
            }
           
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 180, height: 300)
                        .foregroundColor(.yellow.opacity(0.5))
                        .cornerRadius(20)
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 180, height: 300)
                        .foregroundColor(.yellow.opacity(0.5))
                        .cornerRadius(20)
                }
            }
        }
    }
    
    func toggleItem(at index: Int) {
        items[index].isChosed.toggle()
        if myBag.count < 3 {
            if items[index].isChosed {
                // Add to bag
                myBag.append(items[index])
            } else {
                // Remove from bag
                myBag.removeAll { $0.name == items[index].name }
            }
        } else if myBag.count >= 3 {
            // above
            myBag.removeAll { $0.name == items[index].name }
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
