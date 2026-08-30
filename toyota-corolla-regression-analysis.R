# ==============================================================================
# Toyota Corolla Price Regression Analysis
# ==============================================================================
# Purpose:
#   Analyze factors associated with Toyota Corolla prices using exploratory
#   analysis, linear regression, regression diagnostics, model validation,
#   and prediction intervals.
#
# Required data:
#   ToyotaCorolla560.csv
#
# Optional prediction data:
#   toyota_corolla_inventory.csv
#
# The script checks both:
#   data/<filename>
#   <filename> in the repository/project root
#
# Author: Stanley Guinn
# ==============================================================================


# ------------------------------------------------------------------------------
# 1. Package requirements
# ------------------------------------------------------------------------------

required_packages <- c(
  "ggplot2",
  "car",
  "lm.beta"
)

missing_packages <- required_packages[
  !required_packages %in% rownames(installed.packages())
]

if (length(missing_packages) > 0) {
  stop(
    paste(
      "Missing required packages:",
      paste(missing_packages, collapse = ", "),
      "\nInstall them with:",
      paste0(
        "install.packages(c(",
        paste(sprintf('"%s"', missing_packages), collapse = ", "),
        "))"
      )
    )
  )
}
#install packages
install.packages("ggplot2")
install.packages(car)
install.packages(lm.beta)
library(ggplot2)
library(car)
library(lm.beta)

options(scipen = 999)


# ------------------------------------------------------------------------------
# 2. Helper functions
# ------------------------------------------------------------------------------

find_data_file <- function(filename) {
  
  candidate_paths <- c(
    file.path("data", filename),
    filename
  )
  
  existing_paths <- candidate_paths[file.exists(candidate_paths)]
  
  if (length(existing_paths) == 0) {
    stop(
      paste(
        "Data file not found:",
        filename,
        "\nPlace the file in the project root or in a data/ directory."
      )
    )
  }
  
  existing_paths[1]
}


find_optional_data_file <- function(filename) {
  
  candidate_paths <- c(
    file.path("data", filename),
    filename
  )
  
  existing_paths <- candidate_paths[file.exists(candidate_paths)]
  
  if (length(existing_paths) == 0) {
    return(NULL)
  }
  
  existing_paths[1]
}


normalize_fuel_type <- function(x, reference_levels = NULL) {
  
  x <- trimws(as.character(x))
  
  # Support older 0/1 coding used in the original project.
  x[x == "0"] <- "Diesel"
  x[x == "1"] <- "Petrol"
  
  if (is.null(reference_levels)) {
    factor(x)
  } else {
    factor(x, levels = reference_levels)
  }
}


normalize_yes_no <- function(x) {
  
  x <- trimws(as.character(x))
  x_lower <- tolower(x)
  
  x[x_lower %in% c("0", "no", "false")] <- "No"
  x[x_lower %in% c("1", "yes", "true")] <- "Yes"
  
  factor(x, levels = c("No", "Yes"))
}


model_metrics <- function(model, new_data) {
  
  actual <- new_data$Price
  predicted <- predict(model, newdata = new_data)
  
  residual_error <- actual - predicted
  
  rmse <- sqrt(mean(residual_error^2))
  mae <- mean(abs(residual_error))
  
  r_squared <- 1 -
    sum(residual_error^2) /
    sum((actual - mean(actual))^2)
  
  data.frame(
    RMSE = rmse,
    MAE = mae,
    R_Squared = r_squared
  )
}


plot_regression_diagnostics <- function(model, model_name) {
  
  diagnostics <- data.frame(
    Fitted = fitted(model),
    Residual = resid(model),
    Standardized_Residual = rstandard(model)
  )
  
  residual_plot <- ggplot(
    diagnostics,
    aes(x = Fitted, y = Residual)
  ) +
    geom_point(alpha = 0.65) +
    geom_hline(
      yintercept = 0,
      linetype = "dashed"
    ) +
    labs(
      title = paste(model_name, "- Residuals vs. Fitted Values"),
      x = "Fitted Price",
      y = "Residual"
    ) +
    theme_minimal()
  
  print(residual_plot)
  
  qqnorm(
    diagnostics$Standardized_Residual,
    main = paste(model_name, "- Normal Q-Q Plot"),
    xlab = "Theoretical Quantiles",
    ylab = "Standardized Residuals"
  )
  
  qqline(
    diagnostics$Standardized_Residual,
    lty = 2
  )
}


# ------------------------------------------------------------------------------
# 3. Load Toyota Corolla data
# ------------------------------------------------------------------------------

toyota_path <- find_data_file("ToyotaCorolla560.csv")

cardf <- read.csv(
  toyota_path,
  stringsAsFactors = FALSE
)

cat("\nDataset dimensions:\n")
print(dim(cardf))

cat("\nFirst six observations:\n")
print(head(cardf))


# ------------------------------------------------------------------------------
# 4. Validate required columns
# ------------------------------------------------------------------------------

required_columns <- c(
  "Price",
  "Age",
  "KM",
  "Horsepower",
  "FuelType",
  "MetColor",
  "Automatic"
)

missing_columns <- setdiff(
  required_columns,
  names(cardf)
)

if (length(missing_columns) > 0) {
  stop(
    paste(
      "The following required columns are missing:",
      paste(missing_columns, collapse = ", ")
    )
  )
}


# ------------------------------------------------------------------------------
# 5. Prepare variables
# ------------------------------------------------------------------------------

cardf$FuelType <- normalize_fuel_type(
  cardf$FuelType
)

cardf$MetColor <- normalize_yes_no(
  cardf$MetColor
)

cardf$Automatic <- normalize_yes_no(
  cardf$Automatic
)

complete_rows <- complete.cases(
  cardf[required_columns]
)

if (sum(!complete_rows) > 0) {
  
  message(
    sum(!complete_rows),
    " observations removed because of missing required values."
  )
}

analysis_data <- cardf[
  complete_rows,
]


# ------------------------------------------------------------------------------
# 6. Exploratory Data Analysis
# ------------------------------------------------------------------------------

cat("\nSummary statistics:\n")
print(
  summary(
    analysis_data[required_columns]
  )
)

cat("\nCorrelation matrix:\n")

correlation_matrix <- cor(
  analysis_data[
    c(
      "Price",
      "Age",
      "KM",
      "Horsepower"
    )
  ],
  use = "complete.obs"
)

print(
  round(
    correlation_matrix,
    3
  )
)


# ------------------------------------------------------------------------------
# 7. Relationship between vehicle age and price
# ------------------------------------------------------------------------------

age_price_plot <- ggplot(
  analysis_data,
  aes(
    x = Age,
    y = Price
  )
) +
  geom_point(
    alpha = 0.60
  ) +
  geom_smooth(
    method = "lm",
    se = TRUE
  ) +
  labs(
    title = "Toyota Corolla Price vs. Vehicle Age",
    subtitle = "Linear regression relationship",
    x = "Vehicle Age",
    y = "Price"
  ) +
  theme_minimal()

print(age_price_plot)

cat("\nCorrelation between Age and Price:\n")

print(
  cor(
    analysis_data$Age,
    analysis_data$Price,
    use = "complete.obs"
  )
)


# ------------------------------------------------------------------------------
# 8. Simple Linear Regression
# ------------------------------------------------------------------------------

simple_model <- lm(
  Price ~ Age,
  data = analysis_data
)

cat("\nSimple Linear Regression: Price ~ Age\n")

print(
  summary(simple_model)
)


# ------------------------------------------------------------------------------
# 9. Multiple Regression — Numerical Predictors
# ------------------------------------------------------------------------------

numeric_model <- lm(
  Price ~ Age + KM + Horsepower,
  data = analysis_data
)

cat(
  "\nMultiple Regression:",
  "Price ~ Age + KM + Horsepower\n"
)

print(
  summary(numeric_model)
)


# Standardized regression coefficients

cat("\nStandardized regression coefficients:\n")

print(
  lm.beta(
    numeric_model
  )
)


# Multicollinearity assessment

cat("\nVariance Inflation Factors — Numeric Model:\n")

print(
  vif(numeric_model)
)


# Regression diagnostics

plot_regression_diagnostics(
  numeric_model,
  "Numeric Multiple Regression Model"
)


# ------------------------------------------------------------------------------
# 10. Expanded Regression — Categorical Predictors
# ------------------------------------------------------------------------------

full_formula <- Price ~
  Age +
  KM +
  Horsepower +
  FuelType +
  MetColor +
  Automatic

full_model <- lm(
  full_formula,
  data = analysis_data
)

cat("\nExpanded Multiple Regression Model:\n")

print(
  summary(full_model)
)


cat("\nVariance Inflation Factors — Expanded Model:\n")

print(
  vif(full_model)
)


plot_regression_diagnostics(
  full_model,
  "Expanded Multiple Regression Model"
)


# ------------------------------------------------------------------------------
# 11. Training / Validation Split
# ------------------------------------------------------------------------------

set.seed(42)

train_index <- sample(
  seq_len(nrow(analysis_data)),
  size = floor(
    0.70 * nrow(analysis_data)
  ),
  replace = FALSE
)

train_data <- analysis_data[
  train_index,
]

validation_data <- analysis_data[
  -train_index,
]

cat("\nTraining observations:\n")
print(nrow(train_data))

cat("\nValidation observations:\n")
print(nrow(validation_data))


# ------------------------------------------------------------------------------
# 12. Candidate Model Comparison
# ------------------------------------------------------------------------------

# Full candidate model

full_train_model <- lm(
  full_formula,
  data = train_data
)


# Reduced model identified in the original analysis.
#
# Metallic color is removed while Age, KM, Horsepower,
# FuelType, and Automatic are retained.

reduced_formula <- Price ~
  Age +
  KM +
  Horsepower +
  FuelType +
  Automatic

reduced_train_model <- lm(
  reduced_formula,
  data = train_data
)


cat("\nReduced Training Model:\n")

print(
  summary(reduced_train_model)
)


# ------------------------------------------------------------------------------
# 13. Out-of-Sample Validation
# ------------------------------------------------------------------------------

full_performance <- model_metrics(
  full_train_model,
  validation_data
)

reduced_performance <- model_metrics(
  reduced_train_model,
  validation_data
)

validation_results <- rbind(
  data.frame(
    Model = "Full Model",
    full_performance
  ),
  data.frame(
    Model = "Reduced Model",
    reduced_performance
  )
)

cat("\nValidation Performance:\n")

print(
  validation_results,
  row.names = FALSE
)


# Training diagnostics for the reduced model

plot_regression_diagnostics(
  reduced_train_model,
  "Reduced Training Model"
)


# ------------------------------------------------------------------------------
# 14. Final Model
# ------------------------------------------------------------------------------

# After evaluating the model specification using held-out validation data,
# refit the selected model using the complete analysis dataset.
#
# This allows all available observations to contribute to the final
# coefficients used for future predictions.

final_model <- lm(
  reduced_formula,
  data = analysis_data
)

cat("\nFinal Toyota Corolla Price Model:\n")

print(
  summary(final_model)
)


cat("\nFinal Model VIF:\n")

print(
  vif(final_model)
)


# ------------------------------------------------------------------------------
# 15. Inventory Price Predictions
# ------------------------------------------------------------------------------

inventory_path <- find_optional_data_file(
  "toyota_corolla_inventory.csv"
)

if (is.null(inventory_path)) {
  
  message(
    paste(
      "Optional inventory file not found.",
      "Model analysis completed without inventory predictions."
    )
  )
  
} else {
  
  inventorydf <- read.csv(
    inventory_path,
    stringsAsFactors = FALSE
  )
  
  required_inventory_columns <- c(
    "Age",
    "KM",
    "Horsepower",
    "FuelType",
    "Automatic"
  )
  
  missing_inventory_columns <- setdiff(
    required_inventory_columns,
    names(inventorydf)
  )
  
  if (length(missing_inventory_columns) > 0) {
    
    stop(
      paste(
        "Inventory file is missing:",
        paste(
          missing_inventory_columns,
          collapse = ", "
        )
      )
    )
  }
  
  
  # Match categorical coding to the training data.
  
  inventorydf$FuelType <- normalize_fuel_type(
    inventorydf$FuelType,
    reference_levels = levels(
      analysis_data$FuelType
    )
  )
  
  inventorydf$Automatic <- normalize_yes_no(
    inventorydf$Automatic
  )
  
  
  # Produce point estimates and 95% prediction intervals.
  
  price_predictions <- predict(
    final_model,
    newdata = inventorydf,
    interval = "prediction",
    level = 0.95
  )
  
  inventory_predictions <- cbind(
    inventorydf,
    price_predictions
  )
  
  cat("\nInventory Price Predictions:\n")
  
  print(
    inventory_predictions
  )
}


# ------------------------------------------------------------------------------
# End of analysis
# ------------------------------------------------------------------------------




