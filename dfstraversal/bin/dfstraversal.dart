class Graph {
  late List<List<int>> adjacencyList;
  int vertexCount;

  Graph(this.vertexCount) {
    adjacencyList = List.generate(vertexCount, (_) => []);
  }

  void addEdge(int source, int destination) {
    adjacencyList[source].add(destination);
    adjacencyList[destination].add(source);
  }

  void printGraph() {
    for (int i = 0; i < vertexCount; i++) {
      String row = "$i: ";
      for (int j = 0; j < adjacencyList[i].length; j++) {
        row += "${adjacencyList[i][j]} ";
      }
      print(row);
    }
  }

  void dfs(int startVertex) {
    List<bool> visited = List.filled(vertexCount, false);
    List<int> dfsOrder = [];

    List<int> stack = [startVertex];
    visited[startVertex] = true;

    while (stack.isNotEmpty) {
      int currentVertex = stack.removeLast();
      dfsOrder.add(currentVertex);

      for (int neighbor in adjacencyList[currentVertex]) {
        if (!visited[neighbor]) {
          visited[neighbor] = true;
          stack.add(neighbor);
        }
      }
    }

    print('DFS order: ${dfsOrder.join(" ")}');
  }
}

void main() {
  Graph graph = Graph(5);
  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);

  graph.printGraph();

  print(' ');
  graph.dfs(0);
}
