# Walmart Sales Performance Analysis (2010-2012)

## Project Overview
This analytical project examines Walmart's sales data from January 2010 to September 2012 to identify revenue patterns, seasonal trends, and key performance drivers. The project combines SQL data processing with Power BI visualization to deliver actionable business insights.

## Project Objectives
- Import and transform Walmart sales data into SQL Server
- Perform comprehensive data quality assessment
- Develop interactive dashboards for:
  - Time series analysis
  - Holiday vs. non-holiday performance comparison
  - Promotional effectiveness (markdowns)
  - Store and department benchmarking
- Generate data-driven business recommendations

## Methodology

### 1. Data Preparation
- **Data Source**: Walmart sales dataset from Kaggle (CSV format)
- **Import Process**: SQL Server Import Wizard
- **Key Data Fields**:
  - Store and department identifiers
  - Date and weekly sales metrics
  - Holiday indicators
  - External variables (temperature, fuel prices, CPI, unemployment)
  - Promotional markdown data (5 variables)

### 2. Data Quality Assurance
Performed in SQL Server Management Studio (SSMS):
- Data type validation
- Null value identification
- Duplicate record detection
- Outlier analysis using Z-score methodology
- Creation of analytical dimensions (year, season) for visualization

### 3. Business Intelligence Development
**Power BI Implementation**:
- Established data model relationships
- Created date dimension table using DAX
- Developed key performance measures:
  - Total sales
  - Year-over-Year (YoY) growth
  - Month-over-Month (MoM) growth
  - Same-period comparisons

**Dashboard Components**:
1. **Executive Summary**
   - Sales KPIs
   - Growth trend visualization
   - Top-performing locations

2. **Temporal Analysis**
   - YoY/MoM growth patterns
   - Seasonal decomposition
   - Holiday impact assessment

3. **Promotional Effectiveness**
   - Markdown ROI analysis
   - Correlation with external factors

4. **Performance Benchmarking**
   - Store ranking matrix
   - Department performance analysis
   - Geographic comparisons

5. **Demand Forecasting**
   - 24-week predictive outlook
   - Confidence interval analysis

## Key Findings

### Growth Trends
- **2011 vs 2010**: +6.96% revenue growth
- **2012 vs 2011 (Jan-Sep)**: +2.78% growth
- **Insight**: Consistent positive growth trajectory despite economic fluctuations

### Seasonal Patterns
- December sales peak (+42% vs average)
- Post-holiday January decline (-43%)
- Summer and spring tend to have higher sales than other seasons, the lowest is winter, possibly due to difficult weather factors, low temperatures hinder customers' purchasing actions.
- **Recommendation**: Optimize inventory planning for Q4 surge and post-holiday adjustments, suggest additional promotions or other forms of purchasing for times of inclement weather.

### Holiday Impact Analysis
| Metric          | Holiday Weeks | Non-Holiday |
|-----------------|---------------|-------------|
| Total Revenue   | $505M         | $6.23B      |
| Weekly Average  | **$51M**    | $46M      |

**Key Insight**: Average weekly revenue during the holiday period is much higher than average weekly revenue on weekdays.

### Promotional Effectiveness
- Markdowns demonstrate clear short-term sales impact
- No significant correlation found with macroeconomic factors
- **Recommendation**: Implement strategic markdown scheduling to maintain profitability

### Performance Benchmarks
**Top Performers**:
- Store #20: $312M annual revenue
- Department #92: $480M annual revenue

**Improvement Opportunities**:
- Bottom-tier stores averaging $30-80M
- Underperforming departments below $100M

## Strategic Recommendations

### 1. Seasonal Management
- Pre-holiday inventory and staffing optimization
- Post-holiday clearance strategy development
- Q1 demand stimulation programs

### 2. Pricing Strategy
- Data-driven markdown optimization
- Promotional calendar planning
- Margin protection mechanisms

### 3. Operational Excellence
- Best practice sharing from top performers
- Underperforming location review process
- Department portfolio optimization

### 4. Forecasting Enhancement
- Rolling 12-week demand prediction
- Macroeconomic factor integration
- Scenario planning development

## Conclusion
This analysis provides Walmart leadership with comprehensive visibility into sales performance drivers across temporal, promotional, and operational dimensions. The integration of SQL data processing with Power BI visualization enables evidence-based decision making for:
- Inventory planning
- Marketing strategy
- Operational improvements
- Growth initiatives

The project demonstrates the value of combining robust data preparation with intuitive visualization to drive retail performance optimization.
