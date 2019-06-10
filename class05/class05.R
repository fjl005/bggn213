#' ---
#' title: "Class 5: R Graphics"
#' author: "Frank Lee"
#' date: "April 17, 2019"
#' output: github_document
#' ---

# Class05 R graphics and plots

# Get the data in
weight <- read.table("bimm143_05_rstats 2//weight_chart.txt", 
                     header = TRUE)

# Plot a scatterplot of age vs weight

plot(weight$Age, weight$Weight, pch=15, cex=1.5, lwd=2, ylim = c(2,10),
     xlab= "Age (months)", ylab="Weight (kg)", main = "Baby Weight with Age",
     type = "o")

# Get the feature_counts.txt data in
# Use "\t" to indicate that the data are separated by a tab
featureCounts <- read.table("bimm143_05_rstats 2//feature_counts.txt",
                            header = TRUE, sep = "\t")

# I could also use read.delim() function here like this
read.delim("bimm143_05_rstats 2//feature_counts.txt")

barplot(featureCounts$Count, horiz=TRUE, xlab ="Counts", 
        names.arg = featureCounts$Feature, main = "Number of Features in GRCm38 Genome", 
        las = 1, xlim = c(0,80000))

# My labels are clipped I need to change the margins
old.par <- par()$mar

# Set new parameters of the graph
par(mar=c(5, 12, 5, 4))

# Replot the graph after setting new parameters
barplot(featureCounts$Count, horiz=TRUE, xlab ="Counts", 
        names.arg = featureCounts$Feature, main = "Number of Features in GRCm38 Genome", 
        las = 1)

# Reset the parameters back to normal after plotting
par(mar = old.par)
plot(1:10, typ="l")

# Bring in third set of data
maleFemale <- read.delim("bimm143_05_rstats 2/male_female_counts.txt",
                         header = TRUE, sep = "\t")

# You could alternate the colors with col = (some vector of colors)
barplot(maleFemale$Count, names.arg=maleFemale$Sample, las = 2,
        col = c("red", "blue"), ylab = "Counts")

# Argument for col could be a number
barplot(maleFemale$Count, names.arg=maleFemale$Sample, las = 2,
        col = heat.colors(10))

# Shows all the number codes for each color
colours()

rainbow(10)

# Bring in last set of data
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

# Use this to set the palette of the colors that will show up on the plot
old.palette <-palette()
mynewcols <- palette(c("red", "grey", "blue"))
plot(genes$Condition1, genes$Condition2, 
     col = genes$State, xlab = "Expression Condition 1",
     ylab = "Expression Condition 2", main = "Up/Down Expression Comparison")
levels(genes$State)


# Meth Expression
meth <- read.delim("bimm143_05_rstats 2/expression_methylation.txt")
nrow(meth)
length(meth$X)
plot(meth$gene.meth, meth$expression)


# This is a busy plot with lots of data points in top of one another.
# Let improve it a little by coloring by point density.
dcols <- densCols(meth$gene.meth, meth$expression)
plot(meth$gene.meth, meth$expression, col = dcols, pch = 20)

# It looks like most of the data is clustered near the origin.
# Lets restrict ourselves to the genes that have more than zero "expression" values
inds <- meth$expression > 0
plot(meth$gene.meth[inds], meth$expression[inds])

dcols <- densCols(meth$gene.meth[inds], meth$expression[inds])
plot(meth$gene.meth[inds], meth$expression[inds], col = dcols, pch = 20)

dcols.custom <- densCols(meth$gene.meth[inds], meth$expression[inds],
                         colramp = colorRampPalette(c("blue2",
                                                      "green2",
                                                      "red2",
                                                      "yellow")) )

plot(meth$gene.meth[inds], meth$expression[inds], 
     col = dcols.custom, pch = 20)
