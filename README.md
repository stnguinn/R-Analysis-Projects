# R-Statistical-Analysis-Projects
A portfolio of applied statistical analysis projects developed in R, demonstrating exploratory data analysis, regression modeling, clustering, statistical diagnostics, predictive analysis, data visualization, and analytical interpretation.

Overview

This repository contains selected R projects demonstrating practical application of statistical methods to structured datasets.

The projects focus on translating data into interpretable analytical results through:

Exploratory data analysis
Data preparation and transformation
Statistical modeling
Regression analysis
Model diagnostics
K-means clustering
Hierarchical clustering
Predictive analysis
Data visualization
Reproducible analytical workflows

The repository is being standardized from earlier individual analyses into a more consistent portfolio structure emphasizing reproducibility, statistical reasoning, and decision-oriented interpretation.

Projects
Project	Analytical Methods	Primary Skills Demonstrated
Toyota Corolla Regression Analysis	Correlation, simple regression, multiple regression, categorical predictors, residual diagnostics, VIF, model selection, validation, prediction intervals	Predictive modeling, model diagnostics, statistical interpretation
Young Professionals K-Means Analysis	Data standardization, K-means clustering, elbow method, cluster statistics, cluster profiling	Unsupervised learning, segmentation, exploratory modeling
Employee Hierarchical Cluster Analysis	Variable selection, normalization, Manhattan distance, hierarchical clustering, average linkage, dendrogram analysis	Segmentation, similarity analysis, clustering
Employee K-Means Cluster Analysis	Standardization, within-cluster sum of squares, elbow method, K-means modeling	Unsupervised learning, employee segmentation
Austin Weather Analysis	Data preparation, descriptive analysis, ranking, filtering, aggregation and visualization	Exploratory data analysis, time-oriented analysis, ggplot2
Featured Analysis: Toyota Corolla Price Modeling

The Toyota Corolla project demonstrates an end-to-end regression analysis examining factors associated with vehicle price.

The analysis includes:

exploratory summary statistics
correlation analysis
simple linear regression
multiple linear regression
categorical predictor modeling
standardized regression coefficients
residual analysis
normal probability analysis
multicollinearity assessment using Variance Inflation Factors
training and validation data partitioning
candidate model selection
prediction of previously unseen observations
95% prediction intervals

This project demonstrates not only fitting a statistical model, but also evaluating assumptions, examining predictors, validating the modeling process, and applying the resulting model to prediction.

Clustering Analysis

Several projects examine unsupervised statistical learning techniques.

Methods demonstrated include:

variable selection
feature standardization
Euclidean and Manhattan distance
within-cluster sum of squares
elbow-method analysis
K-means clustering
hierarchical clustering
average-linkage clustering
dendrogram interpretation
cluster assignment
cluster-level descriptive statistics

These analyses demonstrate approaches for discovering structure and meaningful groups within datasets when predetermined classifications are not available.

Exploratory Data Analysis

The Austin weather project demonstrates exploratory analysis of historical weather observations using R.

The workflow includes:

importing and inspecting structured data
date transformation
descriptive statistics
sorting and filtering observations
identifying extreme values
annual aggregation
exploratory visualizations with ggplot2
R Technologies and Packages

Primary technologies represented in this repository include:

Language

R

Data manipulation

tidyverse
dplyr
tidyr
readr
purrr

Visualization

ggplot2

Statistical modeling

stats
lm.beta
car
olsrr

Cluster analysis

cluster
fpc
factoextra

Statistical Techniques Demonstrated

The repository currently demonstrates experience with:

Descriptive statistics
Correlation analysis
Simple linear regression
Multiple linear regression
Categorical variables in regression
Regression diagnostics
Standardized coefficients
Variance Inflation Factors
Residual analysis
Train/validation partitioning
Model selection
Prediction intervals
Data normalization
K-means clustering
Hierarchical clustering
Distance metrics
Cluster profiling
Exploratory data visualization
Repository Modernization

Earlier analyses in this repository were originally created as independent R exercises and projects.

The repository is currently being standardized to improve:

reproducibility
project organization
dependency documentation
dataset attribution
statistical interpretation
visualization
code consistency
recruiter-facing documentation

Future updates will increasingly emphasize the complete analytical workflow:

Business Question → Data Preparation → Statistical Method → Validation → Findings → Decision Implications

Portfolio Context

This repository represents the applied statistical-analysis portion of a broader Data & Decision Analytics portfolio.

The objective is to demonstrate the ability to move beyond basic reporting and use statistical methods to identify relationships, evaluate uncertainty, segment observations, build predictive models, and support evidence-based decisions.

Maintainer

Stan Guinn, M.S.

Data & Decision Analytics
Enterprise Data Analytics
Statistical Analysis
Decision Support
AI-Augmented Analytics
