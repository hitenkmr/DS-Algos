//
//  AVLTree.swift
//  Algos
//
//  Created by Hitender Kumar on 19/06/20.
//  Copyright © 2020 Hitender Kumar. All rights reserved.
//

import Foundation

class AVLTree {
    
    var root : AVLNode?
    
    var isEmpty : Bool {
        return root == nil
    }
    
    var leftChild : AVLNode? {
        get {
            return self.root?.leftChild
        }
    }
    
    var rightChild : AVLNode? {
        get {
            return self.root?.rightChild
        }
    }
    
    func NodeHeight(node : AVLNode?) -> Int {
        let hl = (node != nil && node?.leftChild != nil) ? node!.leftChild!.height : 0
        let hr = (node != nil && node?.rightChild != nil) ? node!.rightChild!.height : 0
        return hl > hr ? hl+1 : hr+1
    }
    
    func balanceFactor(node : AVLNode?) -> Int {
        let hl = (node != nil && node?.leftChild != nil) ? node!.leftChild!.height : 0
        let hr = (node != nil && node?.rightChild != nil) ? node!.rightChild!.height : 0
        return hl-hr
    }
    
    //using recursion
    func insert(node : inout AVLNode?, data : Int)-> AVLNode? {
        var rootNode = node
        let newNode = AVLNode.init(data: data, height: 1)
        if rootNode == nil {
            rootNode = newNode
            return rootNode
        }
        if data < rootNode?.data ?? 0 {
            var left = rootNode?.leftChild
            rootNode?.leftChild = self.insert(node: &left, data: data)
        } else {
            var right = rootNode?.rightChild
            rootNode?.rightChild = self.insert(node: &right, data: data)
        }
        rootNode?.height = self.NodeHeight(node: rootNode)
        self.root = rootNode
        performRotation(node: rootNode)
        return self.root
    }
    
    func build(with array : [Int]) -> AVLNode? {
        var node : AVLNode?
        for data in array {
            node = insert(node: &node, data: data)
        }
        return node
    }
}

extension AVLTree {
    
    //MARK: ROTATION HELPERS
    
    fileprivate func performRotation(node : AVLNode?)  {
        var p = node
        if balanceFactor(node: p) == 2 && balanceFactor(node: p?.leftChild) == 1 {
            LLRotationOn(node: &p)
        } else if balanceFactor(node: p) == -2 && balanceFactor(node: p?.rightChild) == -1 {
            RRRotationOn(node: &p)
        }
    }
    
    //LL Rotation
    fileprivate func LLRotationOn(node : inout AVLNode?) {
        let p = node
        let pl = p?.leftChild
        let plr = pl?.rightChild
        
        p?.leftChild = plr
        pl?.rightChild = p
        
        p?.height = NodeHeight(node: p)
        pl?.height = NodeHeight(node: pl)
        
        if root == p {
            root = pl
        }
    }
    
    fileprivate func RRRotationOn(node : inout AVLNode?) {
        let p = node
        let pr = p?.rightChild
        let prl = pr?.leftChild
        
        pr?.leftChild = p
        p?.rightChild = prl

        p?.height = NodeHeight(node: p)
        pr?.height = NodeHeight(node: pr)
        
        if root == p {
            root = pr
        }
    }
}

extension AVLTree {
    
    //MARK: other functions
    
    //simple method(nor used)
    func insertNode(with key : Int) {
        let newNode = AVLNode.init(data: key, height: 1)
        if root == nil {
            root = newNode
            return
        }
        var node : AVLNode? = root
        while node != nil {
            if let data = node?.data {
                if key > data {
                    if node?.rightChild == nil {
                        //newNode.height = node!.height + 1
                        node?.rightChild = newNode
                        //node?.rightChild?.height = node!.height + 1
                        node?.rightChild?.height = self.NodeHeight(node:  node)
                        break
                    } else {
                        node = node?.rightChild
                    }
                } else {
                    if node?.leftChild == nil {
                        //newNode.height = node!.height + 1
                        node?.leftChild = newNode
                        //node?.leftChild?.height = node!.height + 1
                        node?.leftChild?.height = self.NodeHeight(node:  node)
                        break
                    } else {
                        node = node?.leftChild
                    }
                }
            }
            //node?.height = self.height(node: node)
        }
    }
}
