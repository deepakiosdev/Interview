/*
 https://leetcode.com/problems/clone-graph/
 https://www.cnblogs.com/strengthen/p/9963297.html
 
 133. Clone Graph
 Medium

 Given a reference of a node in a connected undirected graph.

 Return a deep copy (clone) of the graph.

 Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.

 class Node {
     public int val;
     public List<Node> neighbors;
 }
  

 Test case format:

 For simplicity, each node's value is the same as the node's index (1-indexed). For example, the first node with val == 1, the second node with val == 2, and so on. The graph is represented in the test case using an adjacency list.

 An adjacency list is a collection of unordered lists used to represent a finite graph. Each list describes the set of neighbors of a node in the graph.

 The given node will always be the first node with val = 1. You must return the copy of the given node as a reference to the cloned graph.
 */


public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}


class Solution {
    func cloneDFSGraph(_ root: Node?) -> Node? {
        var cloneds = [Int: Node]() //adjacencyList
        return worker(root, cloneds: &cloneds)
    }
    
    func worker(_ node: Node?, cloneds: inout [Int: Node]) -> Node? {
        
        guard let node = node else { return nil }
        
        if let cloned = cloneds[node.val] {
            return cloned
        }
        
        let new = Node(node.val)
        cloneds[node.val] = new
        new.neighbors = node.neighbors.map { clone in
            //print(clone?.val)
            return worker(clone, cloneds: &cloneds)
        }
        //print("New val:\(new.val)")
       // print("New neighbors:\(new.neighbors.count)")
        return new
    }
}


let ns = (0..<4).map {
    Node($0)
}
print("Node initilation")
ns.forEach { node in
    print(node.val)
}
ns[0].neighbors = [ns[1], ns[2]]
ns[1].neighbors = [ns[2]]
ns[2].neighbors = [ns[3]]
ns[3].neighbors = [ns[1]]

print("Graph initilation")
ns.forEach { node in
    print(node.val)
}


func printGraph(_ node: Node?) {
    print("Clone Graph")
    guard let node = node else {
        return
    }
    var visited = Set<Int>()
    var queue = [Node?]()
    queue.append(node)
    
    while !queue.isEmpty {
        
        if let topNode = queue.removeFirst() {
            var neighbors = [Int]()
            topNode.neighbors.forEach { newNode in
                neighbors.append(newNode!.val)
                if let val = newNode?.val, !visited.contains(val) {
                    visited.insert(val)
                    queue.append(newNode)
                }
            }
            print("\(topNode.val):\(neighbors)")
        }
    }
    
}

//printGraph(Solution().cloneDFSGraph(ns.first!))


//This solution is failing for the input [[]]. Expected output is [[]] but getting []

class SolutionBFS {
    func cloneGraph(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        
        if root.neighbors.count < 1 {
            return nil
        }
        
        var cloneds = [Int: Node]()
        var queue = [Node?]()
        queue.append(root)
        cloneds[root.val] = Node.init(root.val)
        
        while !queue.isEmpty {
            
            if let current = queue.removeFirst() {
                for nieghbour in current.neighbors {
                    
                    if cloneds[nieghbour!.val] == nil {
                        queue.append(nieghbour)
                        cloneds[nieghbour!.val] = Node.init(nieghbour!.val)
                    }
                    cloneds[current.val]?.neighbors.append(cloneds[nieghbour!.val])
                }
            }
        }
        return cloneds[root.val]
    }
}

printGraph(SolutionBFS().cloneGraph(ns.first!))
