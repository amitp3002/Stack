import UIKit

var str = "Hello, playground"

// A stack is a LIFO data structure.
class Stack<T> {
    
    // Inner node class that will be used to manage the stack implementation
    private final class Node {
        var value:T
        var next:Node?
        init (value:T, next:Node?) {
            self.value = value
            self.next = next
        }
    }

    private var top:Node?
    
    func push(value:T) {
        let oldTop = top
        let newNode = Node(value: value, next: nil)
        top = newNode
        top?.next = oldTop
    }
    
    func pop()->T? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    func peek()->T? {
        return top?.value
    }
    
    func isEmpty()->Bool {
        return (top == nil)
    }
}

// Test stack implementation to make sure it is valid.  Assert if false
var myStack = Stack<Int>()
myStack.push(value: 1)
myStack.push(value:2)
myStack.push(value:3)

let empty = myStack.isEmpty()
assert(empty == false)

let firstPop = myStack.pop()
assert(firstPop == 3)

let r = myStack.peek()
assert(r == 2)

let secondPop = myStack.pop()
let thirdPop = myStack.pop()
let lastPop = myStack.pop()

let isEmpty = myStack.isEmpty()
assert(isEmpty == true)




