# Exploring Market Trends: An Exploratory Data Analysis (EDA) Approach


## Introduction

This report dives into an exploratory data analysis (EDA) of a marketing dataset to uncover valuable insights that can help improve campaign performance and guide smarter decision-making.

## Objectives of this project:

The focus is on understanding which marketing channels are the most effective, analyzing ROI trends, and identifying location-based engagement patterns to see where campaigns are performing well and where there’s room for improvement.
Beyond just the numbers, this analysis aims to provide actionable recommendations that can help optimize future marketing strategies and ensure resources are being used in the best possible way.

## 1.Initial dataset
![image](https://github.com/user-attachments/assets/2c1418ae-e614-4e9d-a0d5-79992f83f1d7)

### Tools

- R & RStudio
- Google sheet
- Google Slides

## Data Overview

The dataset consists of:
- Rows - 200,005
- Columns – 15
- No missing values
## 2. first view of the dataset when loaded into the RStudio Environment
![image](https://github.com/user-attachments/assets/a6e744ad-02e4-4d2a-8aac-d210b864080b)

### Key Columns Identified:
- Campaign_ID: Unique identifier for each marketing campaign.
- Channel_Used: Marketing channel (Google Ads, YouTube, etc.).
- Conversion_Rate: Percentage of people who completed a desired action.
- ROI: Return on investment.
- Clicks: Number of ad clicks.
- Impressions: Number of times the ad was displayed.
- Acquisition_Cost: Cost to acquire a customer.
- Location: Region where the campaign was run.

## Data Cleaning and Preparation
This phase we check for missing values, duplicates, data types, count total rows and columns.
### Counting total rows and columns
![image](https://github.com/user-attachments/assets/280241ab-7ce3-460d-8a9b-24572e54ff0a)


We used the code as seen in the image above to count the total number of rows and column and we have a total of 200,005 rows and 15 columns.

### Checking for missing values and data type
![image](https://github.com/user-attachments/assets/329a6d2e-247a-49d0-b74f-d81238fa326b)

The dataset was checked for missing values, duplicates and incorrect data types and we have;
- 0 missing values
- 0 duplicates
- The data types consist of number (num) and character(chr)

The date was saved as a character (chr). And then converted from chr format to date format with this code:
![image](https://github.com/user-attachments/assets/fc100f55-5e44-45dd-9e9e-ef8b6f05fcfe)


## Findings and Insights
### Key Statistics and Observations
We checked the summary of the key columns to see the statistical summary.
![image](https://github.com/user-attachments/assets/8b35d38b-02c6-441b-9501-ac3d9d55a012)

- Conversion Rate: Ranges from 1% to 15%, with an average of 8%.
- Acquisition Cost: Varies between $5,000 and $20,000, with an average of $12,504.
- ROI: Ranges from 2.0 to 8.0, with an average of 5.0.
- Clicks & Impressions:
  - Clicks range from 100 to 1,000, with a mean of ~550.
  - Impressions range from 1,000 to 10,000, averaging 5,507.
- Engagement Score: Ranges from 1 to 10, with an average of 5.5.

### Performing basic statistic

Using the `Summary()` function to find the mean, median standard deviation of Return of Investment (ROI), Conversion Rate and Acquisition Cost.
![image](https://github.com/user-attachments/assets/4e2d5920-52af-4d10-866d-e18d960a4295)

The process was carried out to find the average, median and the standard deviation.

### Unique target audiences and marketing channels

Analyzing the unique target audiences and marketing channels, also to count how many times each of our unique market audience and marketing channel appear using the “table()” function. The table function will count how many times each category appears.
![image](https://github.com/user-attachments/assets/f55076d5-9694-4120-9b65-08823176e31d)

The unique market audience shows the different age and gender categories like “men 18-24” and the the unique marketing channel like “Google Ads”, “YouTube”,” Instagram”, “Website”, “Facebook”, “Email”. We went ahead to count how many times each category appears.

## Checking for Outliers

Outliers are known to be extreme values that are much higher or lower than the rest of the data. Identifying and managing outliers is crucial as they can distort results and lead to misleading conclusions. We will identify outliers in impressions, clicks, and spend.
![image](https://github.com/user-attachments/assets/f30e69ac-c690-4626-93de-7da40ed899af)

We used the “summary()” function to solve some key statistics like minimum, maximum, median and quartiles. These can be used to solve for outliers.

### Calculating to check for outlier using the interquartile range (IQR) method

**Formula**: IQR = Q3 − Q1

Where:

- Q1 (1st quartile) = 25th percentile
- Q3 (3rd quartile) = 75th percentile
- IQR = Q3 - Q1

Outliers are values outside the range: [ Q1 − 1.5 × IQR, Q3 + 1.5 × IQR ]

#### Checking Outliers for impressions

- IQR = 7753 – 3266 = 4487
- Lower Bound = 3266 – (1.5 x 4487) = -3466 (no lower outlier)
- Upper Bound = 7753 + (1.5 x 4487) = 14483 (no upper outlier)
Therefore, No outliers in impressions.

#### Checking Outliers for Clicks

- IQR = 775 - 325 = 450
- Lower Bound = 325 - (1.5 × 450) = -350 (no lower outlier)
- Upper Bound = 775 + (1.5 × 450) = 1450 (no upper outlier)
Therefore, No outliers in Clicks.

#### Checking Outliers for Acquisition Cost

- IQR = 16264 - 8740 = 7524
- Lower Bound = 8740 - (1.5 × 7524) = -2546 (no lower outlier)
- Upper Bound = 16264 + (1.5 × 7524) = 27550 (no upper outlier)
No outliers in Acquisition Cost

### Initial visualization for outlier detection
![image](https://github.com/user-attachments/assets/a7720d8e-834d-402a-89f8-eefb3cbb2302)

## **Key observations**

- The dashed lines A.K.A whiskers extend to the min/max values within the normal range.
- There are no dots or points beyond the whiskers, meaning no outliers based on the IQR (the interquartile range) rule.
- The median (black line) is centered in all boxplots, indicating a relatively balanced distribution.
Base on the boxplots, there aren't any outliers in these datasets

## Calculating metrics to access campaign effectiveness

Calculating metrics like Click Through Rate (CTR), Cost Per Click (CPC), and Conversion Rate per channel to access campaign effectiveness. A new variable named “channel_performance” was declared to compare the campaign effectiveness across different channels.
![image](https://github.com/user-attachments/assets/dbef647c-539e-49b5-842d-ea2051311543)

- The Average of Click Through Rate (CTR = Clicks ÷ Impressions)
- Average Cost Per Click (CPC = Acquisition Cost ÷ Clicks)
- Average Conversion Rate
- Average Return on Investment (ROI)

These were calculated and the result displayed shows the comparison in the campaign effectiveness across different channels used.

## Code and Methodology in Visualizing

### Creating Insights

We analyze the dataset to extract meaningful insights such as comparing campaign performance across different channels. With the ggplot2 library we were able to create meaningful insights.

### A Bar Chart of the Average CTR against Channel Used
![image](https://github.com/user-attachments/assets/d3d94b20-32af-4f6c-8816-f13eb548931f)

**Result**:
![image](https://github.com/user-attachments/assets/33961423-8277-47c9-862d-08c9546f59fc)

This bar chart compares the Average Click Through Rate (CTR) by Channel Used. All channels (Email, Facebook, Google Ads, Instagram, Website, and YouTube) have similar CTR values with no significant outliers. No single channel outperforms or underperforms noticeably. Adding numeric labels could improve clarity for precise comparison.

### Identifying high-performing and underperforming campaigns based on ROI

To identify the performance based on Return on Investment (ROI), the median ROI was calculated by creating a new Variable with this code;
![image](https://github.com/user-attachments/assets/b5023ea4-4aec-4ee2-8ad8-0f04f327dbaa)

The median Return of Investment (ROI) is **5.01**

### Creating a boxplot to show the campaign performance based on ROI and campaign type
![image](https://github.com/user-attachments/assets/263fc0da-924c-4d8c-b333-423b6fa15e53)

To evaluate campaign performance, we analyzed the Return on Investment (ROI) across all campaigns. This boxplot provides a clear visual representation of ROI distribution, helping us distinguish high-performing and underperforming campaigns.

#### ROI Distribution of Campaigns Performance
![image](https://github.com/user-attachments/assets/61028a10-1538-489a-8357-2255e82d2cc8)

This box plot illustrates the Return of Investment (ROI) distribution for various marketing campaigns (Display, Email, Influencer, Search, and Social Media). The median ROI is similar across all campaign types, indicating steady performance. The range of ROI values is fairly consistent, with no significant outliers. This indicates that all campaign types deliver comparable returns with low variation.

## Generating Insights on Location-Based Trends for Campaign Success
![image](https://github.com/user-attachments/assets/154edb1b-8908-4728-bf8c-c5f2858e5eb9)

To uncover demographic or cultural influences on campaign success, we analyze how different locations impact key marketing metrics like ROI, CTR (Click-Through Rate), CPC (Cost Per Click), and Conversion Rate. We achieve this by grouping the dataset by location to get the average performance by each region.

The table shows the average performance metrics for ROI, CTR, CPC, and Conversion Rate.

### Visualizing a heatmap to show performance metrics by location

We visualized a heatmap of Conversion Rate vs CTR by Location.
![image](https://github.com/user-attachments/assets/db4d2963-ee95-4640-a8d1-84543eabd35f)

**Result**:
![image](https://github.com/user-attachments/assets/e0330e49-9726-48d1-a7df-b614de5b13d3)

We use the heatmap for location-based trends because it helps determine which region respond best to campaigns and shows high engagement (CTR) and identifies underperforming locations that may need different marketing strategies.

- **Houston & Los Angeles (Red)** have relatively high CTR but lower conversion rates. It means strong engagement but potential issues in converting clicks into customers.
- **Miami (Purple)** moderate CTR and conversion rate.
- **New York (Blue)** has the lowest CTR among all locations yet a higher conversion rate.

## Plotting the Distribution of Acquisition Cost Across Marketing Channels

We used ggplot2 to create a Density plot because it provides more customization options.
![image](https://github.com/user-attachments/assets/657892f4-b595-489c-b0fa-d42f101f7448)

The density plot shows how acquisition costs are distributed across different marketing channels like YouTube, Website, Instagram, Google Ads, Facebook, and Email. Since the colours are evenly spread, it suggests that costs are fairly consistent across all channels, with no one platform standing out as significantly higher or lower. There aren’t any noticeable peaks or outliers, meaning the spending pattern is pretty balanced across the board.
![image](https://github.com/user-attachments/assets/44e832c3-c739-485b-b1ae-774933c4fb15)

## Recommendations

- Optimize campaigns by focusing on high-ROI channels like email and website and also improve engagement in New York.
- Reduce costs by reallocating budgets from high CPC channels to more cost-effective ones.
- Target high-performing audiences by prioritizing men 18-34 and adjust messaging for women 35-44.
- Improve conversion in key regions like Houston & Los Angeles with high CTR but low conversion.
- Identify common factors in successful campaigns by analyzing ROI drivers.

## Conclusion & Next Steps

The analysis shows that while the campaigns are getting good engagement, they’re not converting as well as they should. Email and Website bring the best ROI, but Houston and Los Angeles have high engagement with low conversions — meaning there's room for improvement. New York, on the other hand, has a high conversion rate but low clicks, so better ad engagement could help.
Since there are no outliers, the insights are solid and reliable.

### Moving forward the focus should be:
- Improve conversion strategies
- Shift budgets to more cost-effective channels
- Refine audience targeting
- Boost ad engagement where needed
- Use predictive modelling and analyze the customer journey for smarter, data-driven decisions
