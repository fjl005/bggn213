#' ---
#' title: "Class 5: R Graphics"
#' author: "Frank Lee"
#' date: "April 17, 2019"
#' output: github_document
#' ---

# Class05 R graphics and plots

# get the data in
weight <- read.table("bimm143_05_rstats 2//weight_chart.txt", 
                     header = TRUE)

# plot a scatterplot of age vs weight

plot(weight$Age, weight$Weight, pch=15, cex=1.5, lwd=2, ylim = c(2,10),
     xlab= "Age (months)", ylab="Weight (kg)", main = "Some title",
     type = "o")

# get the feature_counts.txt data in
# use "\t" to indicate that the data are separated by a tab
featureCounts <- read.table("bimm143_05_rstats 2//feature_counts.txt",
                            header = TRUE, sep = "\t")

# I could also use read.delim() function here like this
read.delim("bimm143_05_rstats 2//feature_counts.txt")

barplot(featureCounts$Count, horiz=TRUE, ylab ="a Title", 
        names.arg = featureCounts$Feature, main = "Some Title", 
        las = 1)

# my labels are clipped I need to change the margins
old.par <- par()$mar

# set new parameters of the graph
par(mar=c(5, 11, 4, 1))

# replot the graph after setting new parameters
barplot(featureCounts$Count, horiz=TRUE, ylab ="a Title", 
        names.arg = featureCounts$Feature, main = "Some Title", 
        las = 1)

# reset the parameters back to normal after plotting
par(mar = old.par)
plot(1:10, typ="l")

# bring in third set of data
maleFemale <- read.delim("bimm143_05_rstats 2/male_female_counts.txt",
                         header = TRUE, sep = "\t")

# you could alternate the colors with col = (some vector of colors)
barplot(maleFemale$Count, names.arg=maleFemale$Sample, las = 2,
        col = c("red", "blue"))

# argument for col could be a number
barplot(maleFemale$Count, names.arg=maleFemale$Sample, las = 2,
        col = heat.colors(10))

# shows all the number codes for each color
colours()

rainbow(10)

# bring in last set of data
genes <- read.delim("bimm143_05_rstats 2/up_down_expression.txt",
                     header = TRUE, sep = "\t")

# Shows how many are in each state: down, unchanging, up
table(genes$State)

# Shows how many rows and columns we have
nrow(genes)
ncol(genes)

# How many unique entries do we have in the State column?
unique(genes$State)

# Shows the same thing as the unique entries
table(genes$State)

plot(genes$Condition1, genes$Condition2, 
     col = genes$State, xlab = "Expression Condition 1",
     ylab = "Expression Condition 2")

# Use this to set the palette of the colors that will show up on
# the plot
old.palette <-palette()
mynewcols <- palette(c("red", "grey", "blue"))
plot(genes$Condition1, genes$Condition2, 
     col = genes$State, xlab = "Expression Condition 1",
     ylab = "Expression Condition 2", main = "Some Title")
levels(genes$State)
