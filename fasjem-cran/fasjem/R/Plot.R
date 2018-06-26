returngraph.fasjem <-
  function(fasjemresult,
           type = "task",
           neighbouroption = "task",
           subID = NULL,
           index = NULL) {
    .env = "environment: namespace:fasjem"
    adj = .make.adj.matrix(fasjemresult)
    diag(adj) = 0
    gadj = graph.adjacency(adj, mode = "upper", weighted = TRUE)

    K = length(fasjemresult)
    if (!is.null(E(gadj)$weight)) {
      E(gadj)$color = rainbow(K+1)[E(gadj)$weight]
    }

    if (type == "share") {
      ### ignore subID and index
      gadj = subgraph.edges(gadj, which(E(gadj)$weight == K + 1), delete.vertices = FALSE)
    }

    else if (type == "taskspecific") {
      ### ignore index
      if (0 %in% subID) {
        stop("please specify valid task number(s)")
      }
      if (is.null(subID)) {
        stop("please specify task number(s)")
      }
      if (!prod(subID %in% (1:K))) {
        stop("please specify valid task number(s)")
      }
      gadj = subgraph.edges(gadj, which(E(gadj)$weight %in% subID), delete.vertices = FALSE)

    }

    else if (type == "task") {
      if (!is.null(subID)) {
        if (!prod(subID %in% (0:K))) {
          stop("please specify valid task number(s)")
        }
        ### when subID = 0, gadj will be shared graph
        ### when subID = others, gadj will be graph for task with subID (including shared part)
        gadj = subgraph.edges(gadj, which(E(gadj)$weight %in% c(subID, K + 1)), delete.vertices = FALSE)
      }
      ### when subID is null, return all graphs
    }

    else if (type == "neighbour") {
      if (!prod(index %in% (1:vcount(gadj)))) {
        stop("please specify valid index number(s)")
      }

      gadj = subgraph.edges(gadj, unlist(incident_edges(gadj, index)) , delete.vertices = FALSE)
      if (neighbouroption == "task") {
        if (!is.null(subID)) {
          if (!prod(subID %in% (0:K))) {
            stop("please specify valid task number(s)")
          }
          gadj = subgraph.edges(gadj, which(E(gadj)$weight %in% c(subID, K + 1)), delete.vertices = FALSE)
        }
      }
      else if (neighbouroption == "taskspecific") {
        if (!prod(subID %in% (1:K))) {
          stop("please specify valid task number(s)")
        }
        gadj = subgraph.edges(gadj, which(E(gadj)$weight %in% subID), delete.vertices = FALSE)
      }
      else {
        stop("please specify a valid neighbouroption")
      }

    }

    else {
      stop("please specify a correct type")
    }

    return(gadj)
  }



plot.fasjem <-
  function(fasjemresult,
           graphlabel = NULL,
           type = "task",
           neighbouroption = "task",
           subID = NULL,
           index = NULL,
           graphlayout = NULL,
           ...)
  {
    .env = "environment: namespace:fasjem"
    subID = unique(subID)
    index = unique(index)
    gadj = returngraph.fasjem(
      fasjemresult,
      type = type,
      neighbouroption = neighbouroption,
      subID = subID,
      index = index
    )

    graphlayout = .makelayout(gadj, graphlayout = graphlayout)

    ## make title according to user input
    title = .maketitle(
      type = type,
      subID = subID,
      index = index,
      graphlabel = graphlabel,
      neighbouroption = neighbouroption
    )

      plot(
        gadj,
        layout = graphlayout,
        vertex.label.font = 2,
        vertex.shape = "none",
        vertex.label.color = "gray40",
        vertex.label = graphlabel,
        vertex.label.cex = .7,
        vertex.frame.color = "white",
        vertex.size = 10 ,
        main = title
      )

      legend(
        "topleft" ,
        legend = c(paste("task", c(
          1:length(fasjemresult)
        ), "specific"), "share"),
        col = rainbow(length(fasjemresult) + 1),
        pch = 16
      )

  }

### make adjacency matrix
.make.adj.matrix <-
  function(theta, separate = FALSE)
  {
    K = length(theta)
    adj = list()
    if (separate)
    {
      for (k in 1:K)
      {
        adj[[k]] = (abs(theta[[k]]) > 1e-5) * 1
      }
    }
    if (!separate)
    {
      adj = 0 * theta[[1]]
      for (k in 1:K)
      {
        adj = adj + (abs(theta[[k]]) > 1e-5) * 2 ^ (k - 1)
      }
    }
    return(adj)
  }

.maketitle <-
  function(type = "task",
           subID = NULL,
           index = NULL,
           neighbouroption = "task",
           graphlabel = NULL)
  {
    if (type == "share") {
      return ("Shared Graph")
    }

    if (type == "taskspecific") {
      temp = paste(as.character(subID), collapse = ", ")
      return (paste("Task", temp, "Specific Graph"))
    }

    if (type == "task") {
      if (is.null(subID)) {
        return ("All Graphs")
      }
      else {
        if (length(subID) == 1) {
          if (subID == 0) {
            return ("Shared Graph")
          }
          else{
            return (paste("Task", subID, "Graph"))
          }
        }
        else {
          if (0 %in% subID) {
            temp = subID[-(which(subID %in% 0))]

            return(paste("Task", paste(as.character(temp), collapse = ", ")), "Graph")
          }
          else {
            return (paste("Task", paste(
              as.character(subID), collapse = ", "
            ), "Graph"))
          }
        }
      }
    }

    if (type == "neighbour") {
      second = ""
      first = ""

      if (neighbouroption == "task") {
        if (length(subID) == 1) {
          if (subID == 0) {
            second = "on shared graph"
          }
          else {
            second = paste("on task",
                           paste(as.character(subID), collapse = ", "),
                           "graph")
          }
        }
        else {
          if (!is.null(subID)) {
            if (0 %in% subID) {
              temp = subID[-(which(subID %in% 0))]

              second = paste("on task",
                             paste(as.character(temp), collapse = ", "),
                             "graph")
            }
            else {
              second = paste("on task",
                             paste(as.character(subID), collapse = ", "),
                             "graph")
            }
          }
          else {
            second = "on all graphs"
          }
        }
      }
      else{
        second = paste("on task",
                       paste(as.character(subID), collapse = ", "),
                       "specific graph")
      }

      if (is.null(graphlabel) || is.na(graphlabel)) {
        first = paste("Zoom in at node", paste(as.character(index), collapse = ", "))
      }

      else {
        first = paste("Zoom in at node", paste(as.character(graphlabel[index]), collapse = ", "))
      }

      return (paste(first, second))
    }

  }

## helper function to create layout for graph
.makelayout <-
  function(x,
           graphlayout = NULL)
  {
    if (is.null(graphlayout)) {
        graphlayout = layout_nicely(x, dim = 2)
    }
    return(graphlayout)
  }
