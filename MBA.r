library(arules)
library(arulesViz)
library(datasets)
data(Groceries)
itemFrequencyPlot(Groceries,topN=10,type="absolute")
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))
inspect(rules[1:6])
options(digits=2)
inspect(rules[1:6])
rules<-sort(rules, by="confidence", decreasing=TRUE)
inspect(rules[1:6])
rules
red_rules<-is.redundant(rules)
summary(red_rules)
rules<-rules[!red_rules]
rules
rules<-apriori(Groceries, parameter=list(supp=0.001,conf = 0.8), 
               appearance = list(default="lhs",rhs="whole milk"))
inspect(rules[1:5])
plot(rules,method="graph",interactive=TRUE,shading=NA)



