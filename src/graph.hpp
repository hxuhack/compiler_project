#pragma once

#include <assert.h>
#include <iostream>
#include <map>
#include <set>
#include <unordered_map>
#include <vector>

namespace GRAPH {

template <typename T>
class Graph;
template <typename T>
struct Node;
typedef std::set<int> NodeSet;

template <typename T>
struct Node {
    int mykey;
    Graph<T>* mygraph;
    NodeSet succs;
    NodeSet preds;
    T info;
    int color;

    Node() {}
    Node(int _mykey, Graph<T>* _mygraph, T _info, int _color)
        : mykey(_mykey), mygraph(_mygraph), info(_info), color(_color) {
        succs = NodeSet();
        preds = NodeSet();
    }

    T nodeInfo();
    NodeSet* succ();
    NodeSet* pred();
    int nodeid();
    int outDegree();
    int inDegree();
};

template <typename T>
class Graph {
   public:
    std::map<int, Node<T>*> mynodes;
    int nodecount;
    Graph() {
        nodecount = 0;
        mynodes = std::map<int, Node<T>*>();
    }
    /* Make a new node in graph "g", with associated "info" */
    Node<T>* addNode(T info);

    void rmNode(Node<T>*);

    /* Get the list of nodes belonging to "g" */
    std::map<int, Node<T>*>* nodes();

    /* Make a new edge joining nodes "from" and "to", which must belong
        to the same graph */
    void addEdge(Node<T>* from, Node<T>* to);

    /* Delete the edge joining "from" and "to" */
    void rmEdge(Node<T>* from, Node<T>* to);

    /* Tell if there is an edge from "from" to "to" */
    bool goesTo(Node<T>* from, Node<T>* n);
};

template <typename T>
T Node<T>::nodeInfo() {
    return this->info;
}

template <typename T>
NodeSet* Node<T>::succ() {
    return &this->succs;
}

template <typename T>
NodeSet* Node<T>::pred() {
    return &this->preds;
}

template <typename T>
int Node<T>::nodeid() {
    return this->mykey;
}

template <typename T>
int Node<T>::inDegree() {
    int deg = 0;
    return this->preds.size();
}

/* return length of successor list for node n */
template <typename T>
int Node<T>::outDegree() {
    int deg = 0;
    return this->succs.size();
}

template <typename T>
std::map<int, Node<T>*>* Graph<T>::nodes() {
    return &this->mynodes;
}

template <typename T>
Node<T>* Graph<T>::addNode(T info) {
    Node<T>* node = new GRAPH::Node<T>(this->nodecount++, this, info, 0);
    this->mynodes.insert({node->mykey, node});
    return node;
}

template <typename T>
void Graph<T>::rmNode(Node<T>* node) {
    assert(node->outDegree == 0);
    assert(node->inDegree == 0);
    node->mygraph->mynodes.erase(node->mykey);
}

template <typename T>
void Graph<T>::addEdge(Node<T>* from, Node<T>* to) {
    assert(from);
    assert(to);
    assert(from->mygraph == to->mygraph);

    if (goesTo(from, to))
        return;
    to->preds.insert(from->mykey);
    from->succs.insert(to->mykey);
}

template <typename T>
void Graph<T>::rmEdge(Node<T>* from, Node<T>* to) {
    assert(from && to);
    to->preds.erase(to->preds.find(from->mykey));
    from->succs.erase(from->succs.find(to->mykey));
}

template <typename T>
bool Graph<T>::goesTo(Node<T>* from, Node<T>* n) {
    return from->succs.count(n->mykey);
}
}  // namespace GRAPH
