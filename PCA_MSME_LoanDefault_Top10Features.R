library(PCAtools)

library(dplyr)
library(factoextra)

setwd("D:/Study/Great Lakes/Capstone/Final Data")
# 1. Import dataset
df <- read.csv('MSME Data Modified_v1.10_clean_withoutNA_ImpFeatures10.csv')
str(df)
df_x = select(df, -c('loan_default','X'))
df_x$loan_default <- ifelse(df$loan_default == 1, 'default', 'no default')

pca <- princomp(scale(df_x))
#pct_var_explained <- pca$sdev^2 / sum(pca$sdev^2)
#pct_var_explained

pct_var_explained <- pca$sdev^2 / sum(pca$sdev^2)
pct_var_explained

cumsum(pct_var_explained)

summary(pca)

#variance explained
varExp = (100*pca$sdev^2)/sum(pca$sdev^2)
varExp
write.csv(varDF,'PCA_VarianceExplained_Top10Feat_loan_default.csv', row.names = F)
varDF = data.frame(Dimensions=1:length(varExp),varExp=varExp)
varDF
ggplot(varDF,aes(x=Dimensions,y=varExp)) + geom_point() + 
  geom_col(fill="steelblue") + geom_line() + 
  theme_bw() + scale_x_continuous(breaks=1:nrow(varDF)) + 
  ylim(c(0,100)) + ylab("Perc variance explained")

res.pca <- prcomp(df_x, scale = TRUE)
res.pca

library(ggfortify)
library("FactoMineR")
res.pca <- PCA(df_x, graph = FALSE)

print(res.pca)

library("factoextra")
eig.val <- get_eigenvalue(res.pca)
eig.val

fviz_eig(res.pca, addlabels = TRUE)

df_x$loan_default <- df$loan_default
pca.plot <- autoplot(res.pca, data = df_x, colour = 'loan_default')
pca.plot


biplot(res.pca, main = "PCA using prcomp")

fviz_eig(res.pca)

fviz_pca_ind(res.pca,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
############################################################################################
str(df_x)
wdbc.pr <- prcomp(df_x[1:10], center = TRUE, scale = TRUE)
summary(wdbc.pr)
# PC1 accounts for >17% of total variance in the data alone!
# the first 8 components we would be able to account for >95% of total variance in the data.
par(mfrow=c(1,2))
summary(wdbc.pr$x)
df_pca = data.frame(wdbc.pr$x)
nrow(df_pca)
str(df_pca)

write.csv(df_pca,'df_pca_top10.csv', row.names = F)
screeplot(wdbc.pr)#, type = "lines", npcs = 10, main = "Screeplot of the first 10 PCs")
abline(h = 1, col="red", lty=5)
legend("topright", legend=c("Eigenvalue = 1"),
       col=c("red"), lty=5, cex=0.6)
cumpro <- cumsum(wdbc.pr$sdev^2 / sum(wdbc.pr$sdev^2))
plot(cumpro[0:15], xlab = "PC #", ylab = "Amount of explained variance", main = "Cumulative variance plot")
abline(v = 8, col="blue", lty=5)
abline(h = 0.95552, col="blue", lty=5)
legend("topleft", legend=c("Cut-off @ PC6"),
       col=c("blue"), lty=5, cex=0.6)


#add a training set with principal components
train.data <- data.frame(loan_default = df$loan_default, pca$)
