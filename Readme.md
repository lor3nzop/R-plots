# Volcano Plot

Visualization of differentially expressed genes between two categories, according to P-value and fold-change.

## Code Example

### Import data
```{r }
## Import differentially expressed genes (DEGs) analysis
df = read.table("Limma_DEGs.txt", header=T, sep="\t", na.strings = "NA", dec=".")
```

### Plot Basic Volcano Plot

```{r }
with(df, plot(logFC, -log10(P.Value),
                    pch=18, 
                    main="GroupA vs GroupB", 
                    xlim=c(-2.5,2), 
                    col="gray",
                    cex.axis=2,  
                    cex.lab=2,
                    cex.main=3,
                    cex.sub=2))
```

### Add threshold colors (fold-change & p-value)
```{r }
with(subset(df, adj.P.Val<.05), points(logFC, -log10(P.Value), pch=18, col="red"))
with(subset(df, abs(logFC)>1), points(logFC, -log10(P.Value), pch=18, col="green"))
with(subset(df, adj.P.Val<.05 & abs(logFC)>1), points(logFC, -log10(P.Value), pch=18, col="blue"))
```

### Add line
```{r }
abline(h=-log10(0.05),col="black",lty="44") # horizontal line at P=0.05
abline(v=c(-1,1),col="black",lty="1343")   # vertical lines at 2-fold
```

### Add text
```{r }
text(1.8,1.5,"pVal=0.05",srt=0.2, pos=3, cex=1.2)
text(-1.4,18,"FCH=0.5",srt=0.2, pos=3,cex=1.2)
text(+1.4,18,"FCH=2",srt=0.2, pos=3, cex=1.2)
```
