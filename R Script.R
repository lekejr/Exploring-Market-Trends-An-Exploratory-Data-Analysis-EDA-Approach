# Loaded the librart to recognize excel file
library(readxl)



# readiing the excel file into the R environment and assigning a variable named df(dataframe) making the df holds the content of the dataset
df <- read_excel("marketing_campaign_dataset.xlsx")



#check the total number of row
nrow(df)



#check the total number of column
ncol(df)



#Checking for missing values in our dataset
sum(is.na(df))



#checking for duplicates
sum(duplicated(df))



#checking the structure/type
str(df)



#checking the date column to see the format
class(df$Date)



#the date was in Chr format so we change it to a date fomat
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")




#summary of all the columns
summary(df)




#mean, median, standard deviation of ROI
mean(df$ROI)
median(df$ROI)
sd(df$ROI)


#mean, median, standard deviatio of Conversion rate
mean(df$Conversion_Rate)
median(df$Conversion_Rate)
sd(df$Conversion_Rate)

#mean, median, standard deviation of acquisition cost
mean(df$Acquisition_Cost)
median(df$Acquisition_Cost)
sd(df$Acquisition_Cost)




# checking the Unique target audiences and marketing channels.
unique(df$Target_Audience)
unique(df$Channel_Used)




#checking the amount of times target audience and marketing channels appear
table(df$Channel_Used)
table(df$Target_Audience)




#Handling outliers in numerical fields
#finding unusually high/low values using summary

library(dplyr)
df %>%
  select(Impressions,Clicks,Acquisition_Cost) %>%
  summary()




#visualizing outliers with Botplots

par(mfrow = c(1,3))

boxplot(df$Impressions, main = "Boxplot of Impressions", 
        ylab = "Impressions", col = "lightpink") 


boxplot(df$Clicks, main = "Boxplot of Clicks",
        ylab = "Clicks", col = "lightyellow") 

boxplot(df$Acquisition_Cost, main="Boxplot of Acquistion_Cost",
        ylab="Acquisition_Cost", col="lightblue") 





#calculating metrics like Click-Through Rate (CTR), Cost Per Click (CPC), and Conversion Rate per channel.
library(dplyr)

channel_performance <- df %>%
  group_by(Channel_Used) %>%
  summarise(
    Average_CTR = mean(Clicks / Impressions, na.rm = TRUE),  
    Average_CPC = mean(Acquisition_Cost / Clicks, na.rm = TRUE),  
    Average_Conversion_Rate = mean(Conversion_Rate, na.rm = TRUE), 
    Average_ROI = mean(ROI, na.rm = TRUE)  
  )

print(channel_performance)




#Visualization
#visualizing a bar chart of the Average CTR against Channel used
library(ggplot2)

ggplot(channel_performance, aes(x = Channel_Used, y = Average_CTR, 
                                fill = Channel_Used))+
  geom_bar(stat = "identity") +
  labs(title = "Average Click-Through Rate by Channel", 
       x = "Channel Used", y = "Average CTR") +
  theme_minimal()




#Identifying high-performing and underperforming campaigns based on ROI.

#Calculating the median ROI by creating a new Variable

median_roi <- median(df$ROI, na.rm = TRUE)





#creating a boxplot of ROI to compare campaign performance
ggplot(df, aes(Campaign_Type, y = ROI))+
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "ROI Distribution of Campaigns Performance",
       y= "Return on Investment (ROI)",
       x = "campaign type") +
  theme_minimal()





#To generate insight on location based trends for campaign success
#first we get the average performance of each region by grouping location to create a new variable called "location_analysis"

library(dplyr)
location_analysis <- df %>% 
  group_by(Location) %>% 
  summarise(
    average_CTR = mean(Clicks/Impressions, na.rm = TRUE),
    average_CPC = mean(Acquisition_Cost/Clicks, na.rm = TRUE),
    average_conversion_rate = mean(Conversion_Rate, na.rm = TRUE),
    average_ROI = mean(ROI, na.rm = TRUE)
  )

print(location_analysis)




#Visualizing a heatmap to show performance metrics by location
library(ggplot2)
ggplot(location_analysis, aes(x = Location, y = average_conversion_rate,
                              fill = average_CTR)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red")+
  labs(title = "Conversion Rate vs CTR by Location", x = "Location", y = "Conversion Rate") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))





#Plotting the Distribution of Acquisition Cost Across Marketing Channels

library(ggplot2)

ggplot(df, aes( x = Acquisition_Cost, y = Channel_Used)) +
  geom_density(fill = "blue", alpha = 0.4) +
  labs(title = "Density Plot of Acquisition Cost by Channel USed", x = "Acquisition Cost", y = "Channel Used") +
  theme_minimal()




#End_of_line
#Slack ID: Lekejr
#Email: Joelevanssamuel@gmail.com














