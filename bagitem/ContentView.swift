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
        Item(name: "grape", isChosed: false)
    ]
    
    @State var myBag: [Item] = []
    
    var body: some View {
        VStack {
            // Items container
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.blue.opacity(0.5))
                    .cornerRadius(20)
                
                VStack {
                    Text("Available Items")
                        .font(.headline)
                        .padding()
                    
                    ForEach(items.indices, id: \.self) { index in
                        HStack {
                            Text(items[index].name)
                            Spacer()
                            Button(items[index].isChosed ? "Remove" : "Add") {
                                toggleItem(at: index)
                            }
                            .foregroundColor(items[index].isChosed ? .red : .green)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
            // Bag container
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 300)
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
                }
            }
        }
        .padding()
    }
    
    func toggleItem(at index: Int) {
        items[index].isChosed.toggle()
        
        if items[index].isChosed {
            // Add to bag
            myBag.append(items[index])
        } else {
            // Remove from bag
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
