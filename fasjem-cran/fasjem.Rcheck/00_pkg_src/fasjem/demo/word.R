library(fasjem)

### plotting window reset routine
graphics.off()
par(ask=F)
par(mfrow=c(1,1))


readline(prompt="Press [enter] to continue to NIPS word count demo with 2 tasks (before 2006 and after 2006) and 37 features (37 words)")

### load the nips word count data
data(nip_37_data)
label = colnames(nip_37_data[[1]])
result = fasjem(X = nip_37_data, method = "fasjem-g", 0.004, 0.1, 0.1, 0.05, 20)

# return igraph object
graph = returngraph(result)

# fix plot layout
layout = layout_nicely(graph, dim = 2)

### multiple plotting
readline(prompt="Press [enter] to display four plots showing all graphs, shared graph, task specific 1 and task specific 2")

par(mfrow=c(2,2))

{
  plot.fasjem(result, graphlabel = label, type="task", graphlayout = layout)

  plot.fasjem(result, graphlabel = label, type="share", graphlayout = layout)

  plot.fasjem(result, graphlabel = label, type="taskspecific", subID=1, graphlayout = layout)

  plot.fasjem(result, graphlabel = label, type="taskspecific", subID=2, graphlayout = layout)
}


readline(prompt="Press [enter] to display four plots zooming into node figure and probability on previous four plots")


nodeid = which(label %in% c("figure","probability")) ### look for id
{
  plot.fasjem(result, option = "2D", graphlabel = label, type="neighbour", index = nodeid, graphlayout = layout)

  plot.fasjem(result, option = "2D", graphlabel = label, type="neighbour", subID = 0, index = nodeid,graphlayout = layout)

  plot.fasjem(result, option = "2D", graphlabel = label, type="neighbour", neighbouroption = "taskspecific",
              subID=1, index = nodeid,
              graphlayout = layout)

  plot.fasjem(result, option = "2D", graphlabel = label, type="neighbour", neighbouroption = "taskspecific",
              subID=2, index = nodeid,
              graphlayout = layout)
}

### it is also possible to zoom into multiple nodes on multiple graphs specified by input
