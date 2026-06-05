**📊 Australian Monthly Retail Turnover Forecasting**

A time series forecasting project that analyses Australian monthly retail turnover trends and builds an ARIMA model to generate short-term forecasts.

🧾 Project Overview
Retail turnover data reflects the health of consumer spending across Australia. This project uses historical monthly data from the Australian Bureau of Statistics (ABS) to:

Uncover underlying trends and seasonal patterns
Test for stationarity and apply appropriate transformations
Build and validate an ARIMA forecasting model
Generate short-term retail turnover forecasts

Final Model: ARIMA(0,1,1)

📁 Repository Structure
australian-retail-turnover-forecasting/
│
├── code/                  # R scripts for analysis and modelling
├── data/                  # Raw and processed datasets (ABS source)
├── presentation/          # Project presentation slides
├── report/                # Full written report with findings
├── .gitignore
└── README.md

🔬 Methodology
StepDescription1. Data LoadingImport ABS monthly retail turnover dataset2. VisualisationPlot the time series to identify trends and patterns3. Stationarity CheckApply ADF test to assess stationarity4. DifferencingApply first-order differencing to achieve stationarity5. Model IdentificationExamine ACF/PACF plots to identify candidate ARIMA orders6. Model ComparisonCompare candidate models using AIC and BIC criteria7. Residual DiagnosticsValidate model assumptions via residual analysis8. ForecastingGenerate short-term retail turnover forecasts

📈 Key Results

Selected Model: ARIMA(0,1,1) — chosen based on lowest AIC/BIC among candidates
Stationarity: Achieved after first-order differencing
Residual Diagnostics: Residuals confirmed to be white noise (no autocorrelation)
Forecasting: Short-term forecasts generated with confidence intervals


📌 Refer to the report/ folder for detailed model outputs, diagnostic plots, and forecast charts.


🛠️ Tech Stack
ToolPurposeRPrimary language for statistical analysisforecast packageARIMA modelling and forecastingtseries packageStationarity testing (ADF test)ggplot2Data visualisation

📦 Dataset

Source: Australian Bureau of Statistics (ABS)
Series: Seasonally adjusted total monthly retail turnover
Frequency: Monthly


🚀 How to Run

Clone the repository:

bash   git clone https://github.com/ynnishanth9-ops/australian-retail-turnover-forecasting.git

Open RStudio and set the working directory to the project root.
Install required packages:

r   install.packages(c("forecast", "tseries", "ggplot2"))

Run the main analysis script from the code/ folder.


📄 Report & Presentation

📝 Full written report available in the report/ folder
📊 Presentation slides available in the presentation/ folder


👤 Author
Nishanth Reddy

GitHub: @ynnishanth9-ops
LinkedIn: Connect with me


📜 License
This project is open source and available under the MIT License.
