(1+perc.over) *7040 / ((1+perc.over)*7040 + 25151) 

df <- read.csv('MSME Data Modified_v1.9_featureEngineered.csv')

table(df$loan_default)

library(DMwR)

df_smote<- df
df_smote$loan_default<- as.factor(df_smote$loan_default)
table(df_smote$loan_default)
df_smote<- SMOTE(loan_default ~ .,df_smote, perc.over = 100, perc.under = 200)

table(df_smote$loan_default)

write.csv(df_smote, 'MSME data featEngg_Smote.csv', row.names = F)
smoted_data <- SMOTE(loan_default~., df, perc.over=100)

######################################################################################

df <- read.csv('MSME data_FeatEngg_CorrFeatRemoved.csv')
df_featengg <- read.csv('MSME Data Modified_v1.9_featureEngineered.csv')
df$loan_default<- df_featengg$loan_default
table(df$loan_default)

library(DMwR)

df_smote<- df
df_smote$loan_default<- as.factor(df_smote$loan_default)
table(df_smote$loan_default)
df_smote<- SMOTE(loan_default ~ .,df_smote, perc.over = 100, perc.under = 200)

table(df_smote$loan_default)

write.csv(df_smote, 'MSME data featEngg_corrRemoved_Smote.csv', row.names = F)
smoted_data <- SMOTE(loan_default~., df, perc.over=100)

#######################################################################################

df <- read.csv('MSME Data Modified_v1.10_clean_withoutNA_ImpFeatures10.csv')
df_featengg <- read.csv('MSME Data Modified_v1.9_featureEngineered.csv')
df$loan_default<- df_featengg$loan_default
table(df$loan_default)

library(DMwR)

df_smote<- df
df_smote$loan_default<- as.factor(df_smote$loan_default)
table(df_smote$loan_default)
df_smote<- SMOTE(loan_default ~ .,df_smote, perc.over = 100, perc.under = 200)

table(df_smote$loan_default)

write.csv(df_smote, 'MSME data featEngg_top10_Smote.csv', row.names = F)
smoted_data <- SMOTE(loan_default~., df, perc.over=100)
