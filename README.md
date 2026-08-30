# R Statistical Analysis Projects

A portfolio of applied statistical analysis projects developed in **R**, demonstrating regression modeling, exploratory data analysis, clustering, statistical diagnostics, predictive analysis, data visualization, and analytical interpretation.

## Overview

This repository contains selected statistical analysis projects developed in R using structured real-world and instructional datasets.

The purpose of this portfolio is to demonstrate the application of statistical methods to practical analytical questions, including:

* Exploratory Data Analysis (EDA)
* Data preparation and transformation
* Descriptive statistics
* Correlation analysis
* Simple and multiple linear regression
* Regression diagnostics
* Predictive modeling
* K-means clustering
* Hierarchical clustering
* Feature standardization
* Cluster profiling
* Statistical visualization
* Analytical interpretation

The repository is currently being modernized and standardized to improve code quality, reproducibility, documentation, and decision-oriented interpretation.

---

## Featured Project

### Toyota Corolla Regression Analysis

**File:** [`toyota-corolla-regression-analysis.R`](./toyota-corolla-regression-analysis.R)

This project examines the relationship between Toyota Corolla vehicle characteristics and price using linear regression techniques.

### Methods Demonstrated

* Exploratory summary statistics
* Correlation analysis
* Simple linear regression
* Multiple linear regression
* Categorical predictor variables
* Standardized regression coefficients
* Residual analysis
* Normal probability analysis
* Variance Inflation Factor (VIF)
* Multicollinearity assessment
* Training and validation data partitioning
* Model comparison and selection
* Prediction of unseen observations
* Prediction intervals

### Analytical Objective

The analysis demonstrates how statistical modeling can be used to identify variables associated with vehicle price, evaluate model assumptions, assess predictor importance, and generate predictions.

This project will serve as the primary regression-modeling example in the repository.

---

## Project Portfolio

| Project                                    | Primary Methods                                                                  | R Script                                                                               |
| ------------------------------------------ | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| **Toyota Corolla Regression Analysis**     | Linear regression, multiple regression, diagnostics, VIF, prediction, validation | [`toyota-corolla-regression-analysis.R`](./toyota-corolla-regression-analysis.R)       |
| **Young Professionals K-Means Clustering** | Standardization, K-means, elbow method, cluster profiling                        | [`young-professionals-kmeans-clustering.R`](./young-professionals-kmeans-clustering.R) |
| **Employee Hierarchical Clustering**       | Standardization, distance metrics, hierarchical clustering, dendrogram analysis  | [`employee-hierarchical-clustering.R`](./employee-hierarchical-clustering.R)           |
| **Employee K-Means Clustering**            | Feature selection, standardization, K-means, within-cluster analysis             | [`employee-kmeans-clustering.R`](./employee-kmeans-clustering.R)                       |
| **Austin Weather Analysis**                | Exploratory analysis, aggregation, filtering, ranking, visualization             | [`austin-weather-analysis.R`](./austin-weather-analysis.R)                             |

---

## Toyota Corolla Regression Analysis

The Toyota Corolla analysis represents the most comprehensive statistical modeling project currently contained in this repository.

The workflow explores relationships between vehicle characteristics and selling price using progressively more advanced regression techniques.

Key areas demonstrated include:

1. Exploring the dataset and predictor relationships
2. Examining correlations between numerical variables
3. Building simple regression models
4. Developing multiple regression models
5. Incorporating categorical variables
6. Evaluating standardized coefficients
7. Examining regression residuals
8. Assessing multicollinearity using VIF
9. Partitioning data into training and validation samples
10. Comparing candidate models
11. Predicting previously unseen observations
12. Calculating prediction intervals

The project demonstrates the statistical modeling process beyond simply fitting a regression equation by incorporating diagnostics, validation, and predictive interpretation.

---

## Young Professionals K-Means Clustering

**File:** [`young-professionals-kmeans-clustering.R`](./young-professionals-kmeans-clustering.R)

This project applies unsupervised learning techniques to identify groups of observations with similar characteristics.

### Methods Demonstrated

* Numerical feature selection
* Data normalization and standardization
* K-means clustering
* Within-cluster sum of squares
* Elbow-method analysis
* Cluster assignment
* Cluster-level summary statistics
* Cluster profiling

### Analytical Objective

The analysis demonstrates how clustering can be used to identify naturally occurring groups within a dataset when predefined classifications are not available.

---

## Employee Hierarchical Clustering

**File:** [`employee-hierarchical-clustering.R`](./employee-hierarchical-clustering.R)

This project examines employee characteristics using hierarchical clustering techniques.

### Methods Demonstrated

* Variable selection
* Data normalization
* Distance calculations
* Manhattan distance
* Hierarchical clustering
* Average-linkage clustering
* Dendrogram visualization
* Cluster assignment
* Cluster interpretation

### Analytical Objective

The analysis demonstrates an alternative to partition-based clustering by building a hierarchy of similarity between observations and using that structure to identify groups.

---

## Employee K-Means Clustering

**File:** [`employee-kmeans-clustering.R`](./employee-kmeans-clustering.R)

This analysis applies K-means clustering to selected employee characteristics.

### Methods Demonstrated

* Feature selection
* Numerical data preparation
* Standardization
* K-means clustering
* Within-cluster sum of squares
* Elbow-method analysis
* Cluster comparison

This project is currently scheduled for additional code cleanup and documentation as part of the repository modernization process.

---

## Austin Weather Analysis

**File:** [`austin-weather-analysis.R`](./austin-weather-analysis.R)

This project performs exploratory analysis of historical weather observations for Austin, Texas.

### Methods Demonstrated

* CSV data ingestion
* Data inspection
* Descriptive statistics
* Sorting and filtering
* Date transformation
* Identification of extreme observations
* Annual aggregation
* Conditional analysis
* Data visualization using `ggplot2`

Examples include identifying the hottest and coldest observations and examining the frequency of specified temperature conditions over time.

---

## Statistical Techniques

The repository demonstrates experience with the following statistical and analytical techniques:

### Exploratory Analysis

* Descriptive statistics
* Data inspection
* Data filtering
* Sorting and ranking
* Aggregation
* Feature selection
* Visualization

### Regression

* Correlation analysis
* Simple linear regression
* Multiple linear regression
* Categorical predictors
* Standardized coefficients
* Regression diagnostics
* Residual analysis
* Multicollinearity analysis
* Variance Inflation Factor
* Model comparison
* Train/validation partitioning
* Predictive modeling
* Prediction intervals

### Unsupervised Learning

* K-means clustering
* Hierarchical clustering
* Data standardization
* Distance metrics
* Elbow-method analysis
* Within-cluster sum of squares
* Cluster profiling
* Dendrogram analysis

---

## R Technologies

### Core Language

* R

### Data Manipulation

* `dplyr`
* `tidyr`
* `readr`
* `tibble`
* `purrr`
* `forcats`
* `stringr`
* `lubridate`

### Visualization

* `ggplot2`

### Statistical Modeling

* Base R statistical functions
* `lm.beta`
* `car`
* `olsrr`

### Clustering

* `cluster`
* `fpc`
* `factoextra`

---

## Analytical Workflow

The long-term objective of these projects is to demonstrate a complete analytical workflow:

**Analytical Question → Data Preparation → Statistical Method → Model Evaluation → Findings → Decision Implications**

This approach emphasizes not only performing statistical calculations but also interpreting analytical results in a form that can support evidence-based decision-making.

---

## Repository Modernization

Several projects in this repository originated as individual statistical exercises and analyses and are currently being standardized into a more consistent professional portfolio.

Current modernization priorities include:

* [x] Standardize project filenames
* [x] Create recruiter-facing root documentation
* [ ] Refactor and clean R scripts
* [ ] Remove environment-specific working directories
* [ ] Standardize package dependencies
* [ ] Improve reproducibility
* [ ] Add individual project documentation
* [ ] Add saved analytical outputs and visualizations
* [ ] Document data sources
* [ ] Add statistical findings and interpretations
* [ ] Add business and decision implications
* [ ] Organize major analyses into individual project directories

---

## Portfolio Focus

This repository represents the **applied statistics and R analysis** component of a broader Data & Decision Analytics portfolio.

The goal is to demonstrate the ability to move beyond descriptive reporting and apply statistical methods to:

* identify relationships within data
* quantify predictor effects
* evaluate uncertainty
* detect patterns and segments
* assess statistical models
* generate predictions
* communicate analytical findings
* support evidence-based decision-making

---

## Maintainer

**Stanley Guinn, M.S.**

Data & Decision Analytics
Statistical Analysis
Enterprise Data Analytics
Decision Support
AI-Augmented Analytics

