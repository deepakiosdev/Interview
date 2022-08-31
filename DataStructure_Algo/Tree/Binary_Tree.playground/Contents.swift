import Foundation

class BinaryTree<T: Comparable> {
    var value: T
    var parent: BinaryTree?
    var left: BinaryTree?
    var right: BinaryTree?
    var horizotalDistanceFromRoot: Int?
    
    init(value: T) {
        self.value = value
    }
    
    public convenience init(array: [T]) {
      precondition(array.count > 0)
      self.init(value: array.first!)
      for v in array.dropFirst() {
        insert(value: v)
      }
    }

    public var isRoot: Bool {
      return parent == nil
    }

    public var isLeaf: Bool {
      return left == nil && right == nil
    }

    public var isLeftChild: Bool {
      return parent?.left === self
    }

    public var isRightChild: Bool {
      return parent?.right === self
    }

    public var hasLeftChild: Bool {
      return left != nil
    }

    public var hasRightChild: Bool {
      return right != nil
    }

    public var hasAnyChild: Bool {
      return hasLeftChild || hasRightChild
    }

    public var hasBothChildren: Bool {
      return hasLeftChild && hasRightChild
    }

    /* How many nodes are in this subtree. Performance: O(n). */
    public var count: Int {
      return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
}


//Common Operation On binaray tree and binary search tree
extension BinaryTree {
    
    /*
      Calculates the height of this node, i.e. the distance to the lowest leaf.
      Since this looks at all children of this node, performance is O(n).
    */
    public func height() -> Int {
      if isLeaf {
        return 0
      } else {
        return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
      }
    }

    
    /*
      Calculates the depth of this node, i.e. the distance to the root.
      Takes O(h) time.
    */
    public func depth() -> Int {
      var node = self
      var edges = 0
      while let parent = node.parent {
        node = parent
        edges += 1
      }
      return edges
    }

    func depth1() -> Int {
       
        guard let rootNode = self.parent else {
            return 0
        }
        return 1 + rootNode.depth1()
    }
    
    
    //DFS -> inorderTraversal, preorderTraversal, posrtorderTraversal these are types of DFS.
    /*
     https://www.youtube.com/watch?v=XRcC7bAtL3c - Visualization
     (a) Preorder (Root, Left, Right) : 1 2 4 5 3
     (b) Inorder (Left, Root, Right) : 4 2 5 1 3
     (c) Postorder (Left, Right, Root) : 4 5 2 3 1
     */
    //Time Complexity: O(n) where n is the number of nodes in the binary tree
    //Space Complexity: O(1)
        func inorderTraversal(process:(T)->Void) {
            left?.inorderTraversal(process: process)
            process(value)
            right?.inorderTraversal(process: process)
        }

        func preorderTraversal(process:(T)->Void) {
            process(value)
            left?.preorderTraversal(process: process)
            right?.preorderTraversal(process: process)
        }
        
        func posrtorderTraversal(process:(T)->Void) {
            left?.posrtorderTraversal(process: process)
            right?.posrtorderTraversal(process: process)
            process(value)
        }
    
    //Level Order Traversal also called BFS
    //Breadth First or Level Order Traversal : 1 2 3 4 5

    //Time Complexity: O(n) where n is the number of nodes in the binary tree
    //Space Complexity: O(n) where n is the number of nodes in the binary tree
    func levelOrderTraversal(_ root: BinaryTree?) -> [T] {
        
        guard let root = root else {
            return []
        }
        
        var result = [T]()
        var queue: [BinaryTree?] = []
        queue.append(root)

        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                result.append(node.value)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return result
    }
    
    //https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/submissions/
    func zigzagLevelOrder(_ root: BinaryTree?) -> [[T]] {
        
        guard let root = root else {
            return []
        }
        var result = [[T]]()
        var queue: [BinaryTree?] = []
        queue.append(root)
        
        while !queue.isEmpty {
            var levelResult = [T]()
            var levelCount = queue.count
            
            while levelCount != 0 {
                
                if let firstNode = queue.removeFirst() {
                    levelResult.append(firstNode.value)
                    levelCount -= 1
                    
                    if let left = firstNode.left {
                        queue.append(left)
                    }
                    
                    if let right = firstNode.right {
                        queue.append(right)
                    }
                    
                }
            }
            if result.count % 2 == 0 {
                result.append(levelResult)
            } else {
                result.append(levelResult.reversed())
            }
        }
        return result
    }
    
    /* Left View of Tree
     https://www.geeksforgeeks.org/print-left-view-binary-tree/#
     
     Input :
                      1
                    /   \
                   2     3
                  / \     \
                 4   5     6
     Output : 1 2 4

     Input :
             1
           /   \
         2       3
           \
             4
               \
                 5
                  \
                    6
     Output :1 2 4 5 6
     */
    func leftView(_ root: BinaryTree?) -> [T] {
        
        guard let root = root else {
            return []
        }
        
        var result = [T]()
        var queue: [BinaryTree?] = []
        queue.append(root)
        
        while !queue.isEmpty {
            var level = queue.count
            
            if let firstNode = queue.first, let node = firstNode {
                result.append(node.value)
            }
            
            while level >= 0, let node = queue.removeFirst() {
                level -= 1
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
        }
        return result
    }
    
    /*
     https://www.geeksforgeeks.org/print-right-view-binary-tree-2/
     Right view of following tree is 1 3 7 8

               1
            /     \
          2        3
        /   \     /  \
       4     5   6    7
                       \
                        8
     */
    func rightView(_ root: BinaryTree?) -> [T] {
        
        guard let root = root else {
            return []
        }
        
        var result = [T]()
        var queue: [BinaryTree?] = []
        queue.append(root)
        
        while !queue.isEmpty {
            var level = queue.count
            
            if let firstNode = queue.first, let node = firstNode {
                result.append(node.value)
            }
            
            while level >= 0, let node = queue.removeFirst() {
                level -= 1
                
                if let right =  node.right {
                    queue.append(right)
                }

                if let left = node.left {
                    queue.append(left)
                }
            }
            
        }
        return result
    }
    
    func calculateHorizontalDistance(_ root: BinaryTree?, distance: Int) {
        
        guard let root = root else {
            return
        }
        root.horizotalDistanceFromRoot = distance
        calculateHorizontalDistance(root.left, distance: distance - 1)
        calculateHorizontalDistance(root.right, distance: distance + 1)

    }
    
    /*
     Top View

     https://www.geeksforgeeks.org/print-nodes-top-view-binary-tree/?ref=rp
     
     1
  /     \
 2       3
/  \    / \
4    5  6   7
Top view of the above binary tree is
4 2 1 3 7

      1
    /   \
  2       3
    \
      4
        \
          5
           \
             6
Top view of the above binary tree is
2 1 3 6
     
     */
    //https://therahulgoel.medium.com/binary-tree-swift-4-2-7e2c25990f14
    func printTopView(_ root: BinaryTree?) -> [T] {
        
        guard let root = root else {
            return []
        }
        calculateHorizontalDistance(root, distance: 0)
        
        var result = [T]()
        var queue: [BinaryTree?] = []
        queue.append(root)
        var verticalOrder:[Int: T?] = [:]

        while !queue.isEmpty {
            
            if let node = queue.removeFirst() {
                
                if let distance = node.horizotalDistanceFromRoot, verticalOrder[distance] == nil {
                    verticalOrder[distance] = node.value
                    result.append(node.value)
                }
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right =  node.right {
                    queue.append(right)
                }
                
            }
        }
        return result
    }
    
    func printVerticalView(_ root: BinaryTree?) -> [T] {
        
        guard let root = root else {
            return []
        }
        calculateHorizontalDistance(root, distance: 0)
        
        var result = [T]()
        var queue: [BinaryTree?] = []
        queue.append(root)
        var verticalOrder:[Int: T?] = [:]

        while !queue.isEmpty {
            
            if let node = queue.removeFirst() {
                
                if let distance = node.horizotalDistanceFromRoot, verticalOrder[distance] == nil {
                    verticalOrder[distance] = node.value
                    result.append(node.value)
                }
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
                
            }
        }
        return result
    }
    
    
  
    //https://www.geeksforgeeks.org/diameter-of-a-binary-tree/
   // https://leetcode.com/problems/diameter-of-binary-tree/submissions/
    //https://www.youtube.com/watch?v=P_BpORBQHE0
    
    
    //Time Complexity: O(n)
    func diameterOfBinaryTree(_ root: BinaryTree?) -> Int {
        var maxDiameter = 0
        calculateDiameter(root, maxDiameter: &maxDiameter)
        
        return maxDiameter
    }
    
    func calculateDiameter(_ root: BinaryTree?, maxDiameter: inout Int) -> Int {
        
        guard let rootNode = root else {
            return 0
        }
        //Calculate Height of left tree
        let numberOfNodeInLeft = calculateDiameter(rootNode.left, maxDiameter: &maxDiameter)
        //Calculate Height of right tree
        let numberOfNodeInRight = calculateDiameter(rootNode.right, maxDiameter: &maxDiameter)
        
        //Get max Diameter
        maxDiameter = max(maxDiameter, numberOfNodeInLeft + numberOfNodeInRight + 1)
        
        //Return max height from the current node + 1(include root node)
        return (max(numberOfNodeInLeft, numberOfNodeInRight) + 1)
    }
    
    
}


//Binary Search Tree
extension BinaryTree {
    
    func insert(value: T) {
        
        if value < self.value {
            if let left = self.left {
                left.insert(value: value)
            } else {
                left = BinaryTree.init(value: value)
                left?.parent = self
            }
        } else {
            
            if let right = self.right {
                right.insert(value: value)
            } else {
                right = BinaryTree.init(value: value)
                right?.parent = self
            }
        }
    }
    
    func search(_ value: T) -> BinaryTree? {
       
        if value < self.value {
            return left?.search(value)
        } else if value > self.value {
            return right?.search(value)
        } else {
            return self
        }
    }
    
    func search1(_ value: T) -> BinaryTree? {
        var node: BinaryTree? = self
        while let n = node {
            if value < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return node
            }
        }
        return node
    }

    func minimum()-> BinaryTree? {
        
        var node: BinaryTree? = self
        while let n = node?.left {
            node = n
        }
        return node
    }
    
    func minimum1()-> BinaryTree? {
        
        let node: BinaryTree? = self

        if let leftNode = self.left {
            return leftNode.minimum1()
        }
        return node
    }
    
    func maximum()-> BinaryTree? {
        var node: BinaryTree? = self
        
        while let n = node?.right {
            node = n
        }
        return node
    }
    
    /*
      Finds the node whose value precedes our value in sorted order.
    */
    public func predecessor() -> BinaryTree? { //Just small from current
      if let left = left {
        return left.maximum()
      } else {
        var node = self
        while let parent = node.parent {
          if parent.value < value { return parent }
          node = parent
        }
        return nil
      }
    }

    /*
      Finds the node whose value succeeds our value in sorted order.
    */
    public func successor() -> BinaryTree? { //Just large from current
        if let right = right {
            return right.minimum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value > value { return parent }
                node = parent
            }
            return nil
        }
    }
}


/*
                    2
                9       20
                    15      7
 */
let rootNode = BinaryTree.init(value: 2)
let node9 = BinaryTree.init(value: 9)
let node20 = BinaryTree.init(value: 20)
let node15 = BinaryTree.init(value: 15)
let node7 = BinaryTree.init(value: 7)

rootNode.left = node9
rootNode.right = node20
node9.parent = rootNode
node20.parent = rootNode

node20.left = node15
node20.right = node7
node15.parent = node20
node7.parent = node20

print("height:\(String(describing: node15.height()))")
print("depth:\(String(describing: node7.depth()))")

/*
                    7
                2       9
             1     5        10
 */

//Something wrong in this tree printTopView and zigzagLevelOrder not working
let tree = BinaryTree<Int>(value: 7)
tree.insert(value: 2)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 9)
tree.insert(value: 1)

tree.inorderTraversal { value in
    print(value)
}

//let node1 = tree.search(1)
//print("minimum:\(String(describing: tree.minimum()?.value))")
//print("height:\(String(describing: tree.height()))")
//print("depth 1:\(String(describing: node1?.depth()))")

//print(tree.zigzagLevelOrder(tree))
//print(rootNode.zigzagLevelOrder(rootNode))
print(tree.printTopView(tree))
print(rootNode.printTopView(rootNode))


