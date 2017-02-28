# pHeatmap

## Install pHeatmap
```r
source("https://bioconductor.org/biocLite.R")
biocLite("pheatmap")
```

## Launch it
```r
library(pheatmap)
```

# Example

## Create test matrix
```r
test = matrix(rnorm(200), 20, 10) # random generation for the normal distribution (200 numbers in 20 rows and 10 columns matrix)
test[1:10, seq(1, 10, 2)] = test[1:10, seq(1, 10, 2)] + 3
test[11:20, seq(2, 10, 2)] = test[11:20, seq(2, 10, 2)] + 2
test[15:20, seq(2, 10, 2)] = test[15:20, seq(2, 10, 2)] + 4
colnames(test) = paste("Test", 1:10, sep = "")
rownames(test) = paste("Gene", 1:20, sep = "")
```

## Draw heatmaps
```r
pheatmap(test)
pheatmap(test, kmeans_k = 2) # aggregate the rows before drawing heatmap
pheatmap(test, scale = "row", clustering_distance_rows = "correlation") # the values are centered and scaled by row directions 
pheatmap(test, color = colorRampPalette(c("navy", "white", "firebrick3"))(50)) # change colors
pheatmap(test, cluster_row = FALSE) # remove rows cluster and keep the order of the genes
pheatmap(test, legend = FALSE) # remove legend
```

## Show text within cells
```r
pheatmap(test, display_numbers = TRUE) # show values in the cells
pheatmap(test, display_numbers = TRUE, number_format = "/%.1e") # shows number in exponential format
pheatmap(test, display_numbers = matrix(ifelse(test > 5, "*", ""), nrow(test))) # put '*' if expr value > 5
```

## Fix cell sizes and save to file with correct size
```r
pheatmap(test, cellwidth = 15, cellheight = 12, main = "Example heatmap") # change the size of the cells
pheatmap(test, cellwidth = 15, cellheight = 12, fontsize = 8, filename = "test.pdf") # save img as pdf
```

## Generate annotations for rows and columns
```r
annotation_col = data.frame(
  CellType = factor(rep(c("CT1", "CT2"), 5)),
  Time = 1:5
)
rownames(annotation_col) = paste("Test", 1:10, sep = "")

annotation_row = data.frame(
  GeneClass = factor(rep(c("Path1", "Path2", "Path3"), c(10, 4, 6)))
)
rownames(annotation_row) = paste("Gene", 1:20, sep = "")
```

## Display row and color annotations
```r
pheatmap(test, annotation_col = annotation_col)
pheatmap(test, annotation_col = annotation_col, annotation_legend = FALSE)
pheatmap(test, annotation_col = annotation_col, annotation_row = annotation_row)
```
