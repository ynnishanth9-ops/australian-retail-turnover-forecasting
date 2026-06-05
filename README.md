# Australian Monthly Retail Turnover Forecasting

## Project Overview

This project analyses Australian monthly retail turnover data using time series forecasting methods. The objective is to identify historical retail sales patterns and build an ARIMA model for short-term forecasting.

The final selected model was ARIMA(0,1,1).

## Dataset

The dataset contains Australian monthly retail turnover data, focusing on seasonally adjusted total retail turnover.

Source: Australian Bureau of Statistics (ABS)

## Objectives

- Analyse monthly Australian retail turnover trends
- Visualise the time series pattern
- Check stationarity
- Apply differencing where required
- Compare ARIMA models using AIC and BIC
- Validate the final model using residual diagnostics
- Generate short-term forecasts

## Methodology

1. Data loading and preparation
2. Time series visualisation
3. Stationarity analysis
4. ARIMA model identification
5. Model comparison using AIC/BIC
6. Residual diagnostics
7. Forecasting

## Final Model

The selected model was:

```text
ARIMA(0,1,1)