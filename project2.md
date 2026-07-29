# 🎮 Turtle Games Customer Trends Analysis

---

## 💻 Complete Python Code & Data Visualizations

👉 [Open the Jupyter Notebook (.ipynb)(LSE_DA301_FINAL_Assignment_Python_Limbu_Dipendra_Turtle_games.ipynb)](https://nbviewer.org/github/DKL59/DKL59/blob/main/LSE_DA301_FINAL_Assignment_Python_Limbu_Dipendra_Turtle_games.ipynb)


## 📈 R Script 

👉 [Open the R Script (marketing_analysis.R)](LSE_DA301_Assignment_R_Limbu_Dipendra.R)



## 📄 Technical Report

👉 [Open and Read the Full Technical Report (PDF)](https://github.com/DKL59/DKL59/blob/main/report2.pdf)




---


## 📋 Overview
This project was completed as part of the **Data Analytics Career Accelerator** from **The London School of Economics and Political Science (LSE)** in collaboration with FourthRev.

**Objective:**  
To identify customer trends that can help **Turtle Games** improve its overall sales performance through data-driven insights and customer segmentation.

---

## 🎯 Business Problem
> “How can Turtle Games use customer trends to improve overall sales performance?”

The analysis focused on:
- Understanding the relationship between **customer demographics** (age, remuneration, spending score) and **loyalty points**.  
- Exploring **customer sentiment** from reviews and summaries to gauge perception.  
- Segmenting customers based on **income and spending patterns** to tailor marketing strategies.

---

## 🧰 Tools & Technologies

| Category | Tools Used |
| :--- | :--- |
| **Data Analysis** | Python (pandas, numpy, scikit-learn), R (dplyr) |
| **Data Visualisation** | Python (Matplotlib, Seaborn), R (ggplot2, ggcorrplot) |
| **Statistical Analysis** | Python (Scipy, Statsmodels), R (moments) |
| **Natural Language Processing (NLP)** | Python (nltk, wordcloud, textblob, collections, vaderSentiment) |
| **Environment** | Jupyter Notebook, RStudio |

---

## 🔍 Analytical Approach

### 1. Exploratory Data Analysis (EDA)
* Assessed distributions for key variables including **age**, **remuneration**, **spending score**, and **loyalty points**.
* Calculated **skewness** and **kurtosis** metrics to evaluate structural data symmetry and tail behaviour.

### 2. Correlation Analysis
* Generated an interactive correlation heatmap to map linear dependencies across variables.
* Identified strong positive correlations linking **spending score** and **remuneration** with **loyalty points**.

### 3. Customer Segmentation
* Partitioned the customer base into discrete behavioural categories: **Low**, **Medium**, and **High** income/spending bands.
* Analysed variations in **loyalty point accumulation** profiles across each distinct group.

### 4. Sentiment Analysis
* Evaluated customer review and summary text data to calculate baseline sentiment polarity metrics.
* Generated text word clouds mapped against polarity scores to isolate high-frequency terms and determine overall perception tone.


---

## 📊 Key Insights

### 🧍 Demographic Overview
- **Average customer age:** 39 years (range: 17–72).  
- **Average annual remuneration:** £48,080 (range: £12,300–£112,340).  
- **Average spending score:** 50 (range: 1–99).  
- **Average loyalty points:** 1,578 (range: 25–6,847).
   
---

### 📈 Distribution Analysis
![Distribution Analysis](pic2.png)

---

## 💳 Correlation Findings
![Correlation Findings](pic4.png)

- **Remuneration ↔ Loyalty Points:** Moderate positive correlation (**r = 0.62**)  
- **Spending Score ↔ Loyalty Points:** Stronger positive correlation (**r = 0.67**)  
- Indicates that higher spenders and earners accumulate more loyalty points.

---

## 👥 Customer Segmentation Insights

### Loyalty Points by Remuneration Group
![Loyalty Points by Remuneration Group](pic3.png)


### Loyalty Points by Spending Group
- **High Spending** customers accumulate the **most loyalty points**.  
- **Medium-High** group shows balanced and consistent loyalty accumulation.  
- **Low Spending** group occasionally contains outliers with very high loyalty points.  

### Customer Clustering
- Identified **five customer clusters** based on **spending and remuneration patterns**.  
- These clusters provide opportunities for **targeted promotions** and **personalized campaigns**.

---

## 💬 Sentiment Analysis Results

### Summary Sentiment
- **Mean polarity:** +0.22 → *Generally positive tone*  
- Common positive words: *“great”, “good”, “love”, “cute”*  
- Occasional neutral/negative mentions: *“game”* (some critiques)

### Review Sentiment
- **Mean polarity:** +0.217 → *Slightly positive overall sentiment*  
- Frequent words: *“great”, “fun”, “love”, “good”*  
- Suggests overall positive customer experience with some minor product feedback.

---

## 💡 Recommendation

![Recommendation](recommendation.png)

---

## 🧩 Core Competencies

* **Data Wrangling & Descriptive Statistics**: Programmatically cleaning raw datasets, identifying outliers, and generating core summary statistics (mean, median, skewness, kurtosis).
* **Correlation & Clustering Analysis**: Executing paired correlation tests to isolate dependencies and executing customer segmentation to isolate high-value behavioral groups.
* **Natural Language Processing (NLP)**: Utilizing lexicon-based classifiers (`TextBlob`, `vaderSentiment`) to quantify text polarity and extract user perception trends.
* **Data Visualization & Interpretation**: Constructing scannable exploratory heatmaps and word clouds to translate abstract data tables into strategic business realities.
* **Structured Professional Communication**: Synthesizing dense statistical results into clean, actionable executive summaries tailored for non-technical stakeholders.
  

---

## 👤 Author
**Dipendra Limbu** |📍 Nepal | 💼 Data Analyst | Business Intelligence | 📧 dklimbuz@hotmail.com

---

### 🌐 Connect With Me
<a href="https://www.linkedin.com/in/dipendra-limbu-4234901a9/" target="_blank" rel="noopener noreferrer">LinkedIn</a>
 | <a href="https://github.com/DKL59/Dipendra-Limbu" target="_blank" rel="noopener noreferrer">GitHub</a>

---

## 🏁 Summary
This project demonstrates how data analytics can uncover key customer trends that drive actionable sales strategies.  
Through correlation, segmentation, and sentiment analysis, the study provides **evidence-based recommendations** for improving Turtle Games’ sales and loyalty performance.
