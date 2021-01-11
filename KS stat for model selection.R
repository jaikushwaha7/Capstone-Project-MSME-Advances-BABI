install.packages("InformationValue")
library(InformationValue)
library(ggplot2)
setwd("D:/Study/Great Lakes/Capstone/Final Data")
# 1. Import dataset
df <- read.csv('MSME Data Modified_v1.9_featureEngineered.csv')
library(caTools)        #really just using this for the sample.split command
split <- sample.split(df$loan_default, SplitRatio = 0.80)#here ware splitting it based on the Class column



trainData <- subset(df, split == TRUE)
testData <- subset(df, split == FALSE)


# 2. Build Logistic Model
logitmod <- glm(loan_default ~., family = "binomial", data=trainData)

# 3. Predict on testData
pred <- predict(logitmod, newdata = testData, type = "response")

# 4. If p > .5, then Class is 1 else 0
y_pred <- ifelse(pred > 0.5, 1, 0)
y_act <- testData$loan_default

# 5. Accuracy
mean(y_pred == y_act)  # 94%

ks_table <- InformationValue:::ks_table

ks_plot <- function (actuals, predictedScores) {
  rank <- 0:10
  ks_table_out <- ks_table(actuals = actuals, predictedScores = predictedScores)
  perc_positive <- c(0, ks_table_out$cum_perc_responders) * 100
  perc_negative <- c(0, ks_table_out$cum_perc_non_responders) * 100
  random_prediction <- seq(0, 100, 10)
  df <- data.frame(rank, random_prediction, perc_positive, perc_negative)
  df_stack <- stack(df, c(random_prediction, perc_positive, perc_negative))
  df_stack$rank <- rep(rank, 3)
  df_stack$delta <- df_stack$values[12:22] - df_stack$values[1:11]
  values <- df_stack$values
  ind <- df_stack$ind
  
  rowmax <- which.max(ks_table_out$difference)
  l_start <- ks_table_out[rowmax, "cum_perc_non_responders"]
  l_end <- ks_table_out[rowmax, "cum_perc_responders"]
  
  print(ggplot2::ggplot(df_stack, aes(x = rank, y = values, 
                                      colour = ind, label = paste0(round(values, 2), "%"))) + 
          geom_line(size = 1.25) + 
          labs(x = "rank", y = "Percentage +Ve & -Ve Captured", 
               title = "KS Chart", subtitle=paste("KS Statistic: ", ks_stat(actuals, predictedScores))) + 
          theme(plot.title = element_text(size = 20, 
                                          face = "bold")) + 
          geom_text(aes(y = values + 4)) + 
          scale_x_continuous(breaks=0:10, labels=0:10) + 
          geom_segment(x = rowmax, y = l_start*100, xend = rowmax, yend = l_end*100, col="red", arrow = arrow(length = unit(0.05, "npc"), ends="both"), linetype = "dashed", lwd=1))
}


ks_plot(y_act, y_pred)

InformationValue::plotROC(y_act, pred)
InformationValue::AUROC(y_act, pred)



