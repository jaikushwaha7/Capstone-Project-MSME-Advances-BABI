if (!requireNamespace('BiocManager', quietly = TRUE))
  install.packages('BiocManager')

BiocManager::install('PCAtools')
install.packages("factoextra")
library(PCAtools)

library(dplyr)
library(factoextra)

setwd("D:/Study/Great Lakes/Capstone/Final Data")
# 1. Import dataset
df <- read.csv('MSME Data Modified_v1.9_featureEngineered.csv')
str(df)
df_x = select(df, -c('loan_default','MobileNo_Avl_Flag'))
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
write.csv(varDF,'PCA_VarianceExplained_loan_default.csv', row.names = F)
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

pca.plot <- autoplot(res.pca, data = df_x, colour = 'loan_default')
pca.plot


biplot(res.pca, main = "PCA using prcomp")

fviz_eig(res.pca)

fviz_pca_ind(res.pca,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)


p <- pca(df_x, metadata = metadata, removeVar = 0.1)
screeplot(p, axisLabSize = 18, titleLabSize = 22)

write.csv(p,"MSME_Data_PCA_.csv", row.names = FALSE)
#Different interpretations of the biplot exist. In the OMICs era, for most general users,
#a biplot is a simple representation of samples in a 2-dimensional space, usually focusing on just the first two PCs:
biplot(p)

pairsplot(p)


eigencorplot(p,
             metavars = c('Study','Age','Distant.RFS','ER',
                          'GGI','Grade','Size','Time.RFS'))


p$rotated[1:5,1:5]


elbow <- findElbowPoint(p$variance)
elbow

library(ggplot2)

screeplot(p,
          components = getComponents(p, 1:20),
          vline = c(horn$n, elbow)) +
  
  geom_label(aes(x = horn$n + 1, y = 50,
                 label = 'Horn\'s', vjust = -1, size = 8)) +
  geom_label(aes(x = elbow + 1, y = 50,
                 label = 'Elbow method', vjust = -1, size = 8))


which(cumsum(p$variance) > 80)[1]