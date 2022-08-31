//: [Previous](@previous)

import Foundation

//----------------Graph traversals BFS/DFS in Swift----------------//

class Node {
    var value: Int?
    var edges: [Edge]
    var visited = false
    init(value: Int?) {
        self.value = value
        self.edges = []
    }
}

class Edge {
    var value: Int?
    var nodeFrom: Node? //Sourse
    var nodeTo: Node? //Destination

    init(value: Int?, nodeFrom: Node?, nodeTo: Node?) {
        self.value = value
        self.nodeFrom = nodeFrom
        self.nodeTo = nodeTo
    }

}

class Graph {
    var nodes: [Node]
    var edges: [Edge]

    init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }

    // Create an iterative implementation.
    // Return a list of the node values.
    func bfs(_ startNode: Node) -> [Int] {

        var visited: [Int] = []
        var toVisit: [Node] = [] // Treat this array as a queue
        toVisit.append(startNode)
        visited.append(startNode.value!)
        startNode.visited = true

        while !toVisit.isEmpty {

            let node = toVisit.removeFirst()
            for edgeObject in node.edges {

                let neighborNode = edgeObject.nodeTo
              
                if !(neighborNode?.visited)! {
                    toVisit.append(neighborNode!)
                    neighborNode?.visited = true
                    visited.append((neighborNode?.value)!)
                }
            }
        }
        return visited
    }


    // Create a recursive implementation.
    // Return a list of the node values.

    func dfs(_ startNode: Node) -> [Int] {
        let visited = [startNode.value!]
        return dfsHelper(startNode, visited: visited)
    }

    // helper method - use to implement DFS recursively

    func dfsHelper(_ current: Node, visited: [Int]) -> [Int] {

        var result = visited

        for edgeObject in current.edges {

            if !result.contains((edgeObject.nodeTo?.value)!) {
                result.append(edgeObject.nodeTo!.value!)
                result = dfsHelper(edgeObject.nodeTo!, visited: result)
            }
        }

        return result
    }

    // creates a now with a given value and inserts it into the graph

    func insertNodeWithValue(_ value: Int) {
        let newNode = Node(value: value)
        nodes.append(newNode)
    }


    // inserts an edge between the "to" and "from" nodes with the given value
    func insertEdgeWithValue(_ newEdgeValue: Int, nodeFromValue: Int, nodeToValue: Int) {
        
        var fromFound: Node? = nil
        var toFound: Node? = nil

        for node in nodes {

            if nodeFromValue == node.value {
                fromFound = node
            }

            if nodeToValue == node.value {
                toFound = node
            }
        }


        if fromFound == nil {
            fromFound = Node(value: nodeFromValue)
            nodes.append(fromFound!)
        }

        if toFound == nil {
            toFound = Node(value: nodeToValue)
            nodes.append(toFound!)
        }

        let newEdge = Edge(value: newEdgeValue, nodeFrom: fromFound, nodeTo: toFound)

        fromFound?.edges.append(newEdge)
        toFound?.edges.append(newEdge)
        edges.append(newEdge)

    }

}



//Test cases

let graph = Graph(nodes: [], edges: [])
graph.insertEdgeWithValue(100, nodeFromValue: 1, nodeToValue: 2)
graph.insertEdgeWithValue(101, nodeFromValue: 1, nodeToValue: 3)
//: [Next](@next)
