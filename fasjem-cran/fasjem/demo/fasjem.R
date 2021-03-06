
library(fasjem)


### plotting window reset routine
graphics.off()
par(ask=F)
par(mfrow=c(1,1))


readline(prompt="Press [enter] to continue to cancer demo with 2 tasks (not v. pcr) and 26 features (26 cancer types) ")

### load cancer data (cancer)
data(cancer)

### create a list of cancer data (cancerlist)
cancerlist = list(as.matrix(cancer[[1]][which(cancer[[2]] == "not"),]),
                  as.matrix(cancer[[1]][which(cancer[[2]] == "pcr"),]))

### run fasjem
result = fasjem(X = cancerlist, method = "fasjem-g", 2, 0.1, 0.1, 0.05, 20)

### obtain names for node labelling
label = colnames(cancer[[1]])

### obtain graph for creating layout
graph = returngraph(result)

### create a fixed layout on cancergraph for plotting
layout = layout_nicely(graph,dim=2)



### multiple plotting
readline(prompt="Press [enter] to display four plots showing all graphs, shared graph, task specific 1 and task specific 2")

par(mfrow=c(2,2))

{
  plot.fasjem(result, graphlabel = label, type="task", graphlayout = layout)

  plot.fasjem(result, graphlabel = label, type="share", graphlayout = layout)

  plot.fasjem(result, graphlabel = label, type="taskspecific", subID=1, graphlayout = layout)

  plot.fasjem(result, graphlabel = label, type="taskspecific", subID=2, graphlayout = layout)
}


readline(prompt="Press [enter] to continue to synthetic Gaussian data demo with 2 tasks and 20 features")


### load the example data
data(exampleData)

### run fasjem algorithm to estimate two sparse precision matrices from example data

result = fasjem(X = exampleData, method = "fasjem-g", 0.5, 0.1, 0.1, 0.05, 10)
graph = returngraph(result)
layout = layout_nicely(graph,dim=2)
label = NULL

### multiple display
readline(prompt="Press [enter] to view the four plots showing all graphs, shared graph, task 1 and task 2 specific graphs")
par(mfrow=c(2,2))

{
  plot.fasjem(result, graphlabel = label, type="task", graphlayout = layout)

  plot.fasjem(result, graphlabel = label, type="share", graphlayout = layout)

  plot.fasjem(result, graphlabel = label, type="taskspecific", subID=1, graphlayout = layout)

  plot.fasjem(result, graphlabel = label, type="taskspecific", subID=2, graphlayout = layout)
}


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


