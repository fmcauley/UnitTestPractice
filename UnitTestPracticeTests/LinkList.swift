//
//  LinkList.swift
//  UnitTestPracticeTests
//
//  Created by Frank McAuley on 1/31/20.
//  Copyright © 2020 Frank McAuley. All rights reserved.
//

import XCTest

class LinkList: XCTestCase {
    
    var wordList: Array<String>!
    
     override func setUp() {
           super.setUp()
           wordList =  ["Frank", "Rosalyn", "Caroline", "Frankie", "Taco", "Ginger"]
       }
    
    func buildLinkList() -> LinkedList<String>! {
        
        let linkedList = LinkedList<String>()
              
              for name in wordList {
                  linkedList.append(element: name)
              }
              
              if (linkedList.count != wordList.count) {
                  XCTFail("linked list count doesn't match number list..")
                  return nil
              }
            
              return linkedList
        
        
    }
    
    func test_howRunLinkedList() {
       
        let linkedList: LinkedList<String> = self.buildLinkList()
        
        XCTAssertEqual(linkedList.count, 6)
        
    }
    
    func test_find_givenTheIndexOfZero() {
        let linkedList: LinkedList<String> = self.buildLinkList()
        
        let expected = "Frank"
        let ac
    }

}

// linked list structure
class LLNode<T> {
    var key: T?
    var next: LLNode?
    var previous: LLNode?
}


public class LinkedList<T: Equatable> {
    // new instance
    private var head = LLNode<T>()
    private var counter: Int  = 0
    
    
    // the number of items - O(1) constant time
    var count: Int {
        return counter
    }
    
    // find subscipt shortcut
    subscript(index: Int) -> LLNode<T>? {
        get {
            return find(at: index)
        }
    }
    
    // obtain link at a specific index
    func find(at index: Int) -> LLNode<T>? {
        
        // check empty conditions
        if ((index < 0 ) || (index > (self.count - 1)) || (head.key == nil)) {
            return nil
        }
        
        else {
            var current: LLNode<T>? = head
            var x: Int = 0
            
            //cycle through elements
            while (index != x) {
                current = current?.next!
                x += 1
            }
            return current
        }
    }
    
    
    // insert at specfic index
    func insert(_ key: T, at index: Int) {
        
        // check for nil conditions
        if ((index < 0) || (index > (self.count - 1))) {
            print("link index does not exist..")
        }
        
        // establish the head node
        guard head.key != nil else {
            head.key = key
            counter += 1
            return
        }
        
        // establish the trailer, currnt, and new items
        var current: LLNode<T>? = head
        var trailer: LLNode<T>?
        var listIndex: Int = 0
        
        // iterate through the list to find the insertion point
        while (current != nil) {
            
            if (index == listIndex) {
                
                let childToUse: LLNode = LLNode<T>()
                
                // create the new node
                childToUse.key = key
                
                // connect the node infront of the current node
                childToUse.next = current
                childToUse.previous = trailer
                
                // point new node to the current / previous
                current!.previous = childToUse
                
                // replace the head node if required
                if (index == 0) {
                    head = childToUse
                }
                
                break
    
            } //end if
            
            //iterate through the next item
            trailer = current
            current = current?.next
            listIndex += 1
            
        }// end of while loop
        
        counter += 1
    }
    
    
    // empty list check
    func isEmpty() -> Bool {
        return counter == 0 || head.key == nil
    }
    
    
    // add item
    func append(element key: T) {
        
        // trivial check
        guard head.key != nil else {
            head.key = key
            counter += 1
            return
        }
        
        var current: LLNode? = head
        
        while current != nil {
            if current?.next == nil {
                let childToUse = LLNode<T>()
                
                childToUse.key = key
                childToUse.previous = current
                current!.next = childToUse
                break
            }
            
            else {
                current = current?.next
            }
        }
        
        counter += 1
    }
    
    func printAllKeys() {
        var current: LLNode? = head
        
        while current != nil {
            print("link item is:\(String(describing: current?.key!))")
            current = current?.next
        }
    }
    
    // remove at specific index
    func remove(at index: Int) {
        //check for nil conditions
        if((index < 0) || (index > (self.count - 1)) || head.key == nil) {
            print("link index does not exist..")
            return
        }
        
        var current: LLNode<T>? = head
        var trailer: LLNode<T>?
        var listIndex: Int = 0
        
        //determine if the removal is at the head
        if (index == 0) {
            current = current?.next
            
            if let headitem = current {
                head = headitem
                counter -= 1
            }
            return
        }
        
        // iterate through the remianing items
        while current != nil {
            if listIndex == index {
                
                //redirect the trailer and next pointer
                trailer!.next = current?.next
                current = nil
                break
                
            }
            
            // update the assignments
            trailer = current
            current = current?.next
            listIndex += 1
        }//end of while loop
        counter -= 1
    }// end of remove at specific index
    
    // reverse the order of the linked list
    func reverse() {
        // if conut == 1 or count == 0, no need to reverse
        if self.count <= 1 {
            return
        }
        
        var current: LLNode<T>? = head
        var next: LLNode<T>? = nil
        
        while(current != nil) {
            
            // reverse
            next = current!.next
            current!.next = current!.previous
            current!.previous = next
            
            if next == nil {
                head = current!
            }
            
            // move to next node
            current = next
        }
    }
    
    //MARK: Closure operations
    
    /*
     notes: These "generic methods" mimic the map & filter array
     functions found in the Swift standard library.
     */
    
    // filter list content - higher order function
    func filter(_ formula: (LLNode<T>) -> Bool) -> LinkedList<T>? {
        
        // check for instance
        guard head.key != nil else {
            return nil
        }
        
        var current: LLNode! = head
        let results: LinkedList<T>? = LinkedList<T>()
        
        while current != nil {
            
            // filter based on formula
            if formula(current) == true {
                if let key = current.key {
                    results?.append(element: key)
                }
            }
            
            current = current.next
        }
        
        return results
    }
    
    
    func map(_ formula: (LLNode<T>) -> T) -> LinkedList<T>! {
        
        // check for instance
               guard head.key != nil else {
                   return nil
               }
        
        var current: LLNode! = head
        let results: LinkedList<T> = LinkedList<T>()
        var newKey: T!
        
        while current != nil {
            
            // map based on formula
            newKey = formula(current)
            
            // add non-nil entries
            if newKey != nil {
                results.append(element: newKey)
            }
            
            current = current.next
        }
        
        return results
    }
    
} //end class
