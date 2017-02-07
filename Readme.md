## Volcano Plot

Visualization of differentially expressed genes between two categories, according to P-value and fold-change.

## Code Example
####(NOTE: random input data not optimized yet!!!)

```{r }
## create random data frame with genes, fold-change etc.
gene = c(paste("Gene", 1:15000, sep=""))
log2FoldChange = c(rnorm(1:15000, -2,2)) 
pvalue = c(runif(15000, 1.86e-08, 1.0))
adjPvalue = c(runif(15000, 0.0003053, 1.0))
df = data.frame(gene, log2FoldChange, pvalue, adjPvalue) # this is our data frame
df
```

## Plot Basic Volcano Plot

```{r }
with(df, plot(log2FoldChange, -log10(pvalue),
                    pch=18, 
                    main="GroupA vs GroupB", 
                    xlim=c(-2.5,2), 
                    col="gray",
                    cex.axis=2,  
                    cex.lab=2,
                    cex.main=3,
                    cex.sub=2))
```

## Add threshold colors (fold-change & p-value)
```{r }
with(subset(df, adjPvalue<.05), points(log2FoldChange, -log10(pvalue), pch=18, col="red"))
with(subset(df, abs(log2FoldChange)>1), points(log2FoldChange, -log10(pvalue), pch=18, col="green"))
with(subset(df, adjPvalue<.05 & abs(log2FoldChange)>1), points(log2FoldChange, -log10(pvalue), pch=18, col="blue"))
```

## Add line
```{r }
abline(h=-log10(0.05),col="black",lty="44") # horizontal line at P=0.05
abline(v=c(-1,1),col="black",lty="1343")   # vertical lines at 2-fold
```

## Add text
```{r }
text(1.8,1.5,"pVal=0.05",srt=0.2, pos=3, cex=1.2)
text(-1.4,7,"FCH=0.5",srt=0.2, pos=3,cex=1.2)
text(+1.4,7,"FCH=2",srt=0.2, pos=3, cex=1.2)
```
