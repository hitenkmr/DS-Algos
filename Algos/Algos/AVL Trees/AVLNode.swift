//
//  AVLNode.swift
//  Algos
//
//  Created by Hitender Kumar on 20/06/20.
//  Copyright © 2020 Hitender Kumar. All rights reserved.
//

import Foundation

class AVLNode<T : Comparable> : Equatable {
    static func == (lhs: AVLNode, rhs: AVLNode) -> Bool {
        return lhs.data == rhs.data && lhs.leftChild == rhs.leftChild && lhs.rightChild == rhs.rightChild
    }
    
    internal init(data: T, leftChild: AVLNode? = nil, rightChild: AVLNode? = nil, height: Int) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.height = height
    }
    
    var data : T
    var leftChild : AVLNode?
    var rightChild : AVLNode?
    var height : Int
}
