//
//  OrderView.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 14/4/2023.
//

import SwiftUI

import SwiftUI

struct OrderView: View {
    var body: some View {
        VStack {
            Text("Orders")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            List {
                ForEach(0..<5) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Order #12345")
                                .fontWeight(.semibold)
                            Text("April 10, 2023")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text("$50.00")
                                .foregroundColor(.green)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
