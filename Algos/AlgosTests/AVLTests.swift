//
//  AVLTests.swift
//  AlgosTests
//
//  Created by Hitender Kumar on 19/06/20.
//  Copyright © 2020 Hitender Kumar. All rights reserved.
//

import Foundation
import XCTest
@testable import Algos

class AVLTests: XCTestCase {
    
    func test_build_avl_tree() {
        let tree = AVLTree.init()
        let root = tree.build(with: [10,5,2])
        XCTAssertTrue(root != nil)
    }
    
    func test_LLRotation_on_avl_tree() {
        let tree = AVLTree.init()
        let root = tree.build(with: [10,5,2])
        XCTAssertTrue(tree.balanceFactor(node: root) == 0)
        XCTAssertTrue(root?.data == 5)
    }
    
    func test_RRRotation_on_avl_tree_with_dataset1() {
        let tree = AVLTree.init()
        let root = tree.build(with: [10,5,20,19,30,40])
        XCTAssertTrue(tree.balanceFactor(node: root) == 0)
        XCTAssertTrue(root?.data == 20)
    }
    
    func test_RRRotation_on_avl_tree_with_dataset2() {
        let tree = AVLTree.init()
        let root = tree.build(with: [10,20,30])
        XCTAssertTrue(tree.balanceFactor(node: root) == 0)
        XCTAssertTrue(root?.data == 20)
    }
    
    func test_RRRotation_on_avl_tree_with_dataset3() {
        let tree = AVLTree.init()
        let root = tree.build(with: [20,10,30])
        XCTAssertTrue(tree.balanceFactor(node: root) == 0)
        XCTAssertTrue(root?.data == 20)
    }
    
    func test_LRRotation_on_avl_tree_with_dataset1() {
        let tree = AVLTree.init()
        let root = tree.build(with: [30,10,20])
        XCTAssertTrue(tree.balanceFactor(node: root) == 0)
        XCTAssertTrue(root?.data == 20)
        XCTAssertTrue(root?.leftChild?.data == 10)
        XCTAssertTrue(root?.rightChild?.data == 30)
    }
    
    func test_RLRotation_on_avl_tree_with_dataset1() {
        let tree = AVLTree.init()
        let root = tree.build(with: [30,40,60])
        XCTAssertTrue(tree.balanceFactor(node: root) == 0)
        XCTAssertTrue(root?.data == 40)
        XCTAssertTrue(root?.leftChild?.data == 30)
        XCTAssertTrue(root?.rightChild?.data == 60)
    }
 }
