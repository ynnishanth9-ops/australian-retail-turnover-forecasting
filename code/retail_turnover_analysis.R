library(readxl)
library(forecast)
library(tseries)

# 1. Import the ABS workbook
retail_raw <- read_excel("/Users/nishanthyn/Desktop/Time_Series/Assignment_3/850101.xlsx", sheet = "Data1", col_names = FALSE)

# 2. Extract date column and Total (Industry), Seasonally Adjusted series
date_index <- retail_raw[-c(1:10), 1][[1]]
turnover <- as.numeric(retail_raw[-c(1:10), 15][[1]])
turnover <- na.omit(turnover)

# 3. Create monthly time series object
retail_ts <- ts(turnover, start = c(1982, 4), frequency = 12)

# ----------------------------
# Figure 1: Descriptive plot
# ----------------------------
plot(retail_ts,
     main = "Australian Monthly Retail Turnover (Seasonally Adjusted)",
     ylab = "Turnover ($ million)",
     xlab = "Year")

# 4. Transformation
log_ts <- log(retail_ts)
diff_log_ts <- diff(log_ts)

# 5. Candidate models
fit_011 <- Arima(log_ts, order = c(0,1,1), include.drift = TRUE)
fit_111 <- Arima(log_ts, order = c(1,1,1), include.drift = TRUE)
fit_s011 <- Arima(log_ts, order = c(0,1,1),
                  seasonal = c(0,1,1), include.drift = TRUE)
fit_s111 <- Arima(log_ts, order = c(1,1,1),
                  seasonal = c(0,1,1), include.drift = TRUE)

# Compare models
AIC(fit_011, fit_111, fit_s011, fit_s111)
BIC(fit_011, fit_111, fit_s011, fit_s111)

# Summary of selected model
summary(fit_011)

# 6. Residual diagnostics
# Residual time plot (optional to include in Section 6)
plot(residuals(fit_011), type = "l",
     main = "Residuals from ARIMA(0,1,1)",
     ylab = "Residual",
     xlab = "Time")
abline(h = 0, col = "red", lty = 2)

# ----------------------------
# Figure 2: Residual ACF with 95% confidence bands
# ----------------------------
Acf(residuals(fit_011),
    main = "Residual ACF of ARIMA(0,1,1) with 95% Confidence Bands")

# Ljung-Box test
Box.test(residuals(fit_011), lag = 12, type = "Ljung-Box")

# 7. Forecasting
fc <- forecast(fit_011, h = 10)

# ----------------------------
# Figure 3: Forecast plot
# ----------------------------
plot(fc,
     main = "10-Month Forecast of Australian Retail Turnover",
     xlab = "Year",
     ylab = "Log turnover")

# Forecast values on original scale
fc_original_million <- exp(fc$mean)
fc_original_bn <- fc_original_million / 1000

print(fc_original_million)
print(fc_original_bn)

# Optional: forecast intervals on original scale
forecast_table <- data.frame(
  Month = time(fc$mean),
  Point_Forecast_Million = as.numeric(exp(fc$mean)),
  Lower_80_Million = as.numeric(exp(fc$lower[,1])),
  Upper_80_Million = as.numeric(exp(fc$upper[,1])),
  Lower_95_Million = as.numeric(exp(fc$lower[,2])),
  Upper_95_Million = as.numeric(exp(fc$upper[,2]))
)

print(forecast_table)