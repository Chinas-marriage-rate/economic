# Credit-Risk-Management - PART 1(A) 
MULTIPLE REGRESSION MODEL FOR PREDICTING GDP USING MACROECONOMIC VARIABLES
# Introduction
This short essay explores how one may predict the Gross Domestic Product (GDP) of a country using a technique known as multiple linear regression. Specifically, we examine whether other macroeconomic variables such as population, interest rates, unemployment rates, amongst others, can be used to predict the GDP of a country. Linear regression is a statistical model for finding the relationship between input variables (also known as Independent/explanatory variables) and output variables (dependent/response variables). Linear regression models are used for predicting continuous variables compared to logistic regression models used for predicting categorical outcomes. 

The data consists of 272 records and 28 features. We are interested in modeling multiple independent variables to determine the relationships between these variables and the dependent variable (GDP). We also examined colinearity and interactions of the independent variables on our model. To aid in understanding the relationships between the variables we used scatterplots like the one shown below.

 
Based on our exploratory analysis and given that we are trying to predict a continuous variable, we concluded that our best choice for this part of the research is a linear regression model.  
# Base Model:
We start the regression analysis by initially modeling GDP with the variables listed below. Subsequently, after building the initial model, we added additional macroeconomic variables that could potentially improve the performance of the model.

Model:  
Dependent Variable: GDP (Annual Percent) – GDP
Independent Variables: Population (Annual Percent) – Pop
                                           Interest Rate(Annual Percent)- INTDSRUSM193
                                           10-Year Treasury Constant Maturity Rate – DGS10
                                           Disposable Personal Income(Annual Percent) – DSPI
                                           Unemployment Rate(Annual Percent) – U2RATE
                                           All Transactions House Price Index – USSTHPI

# p-value: 
Disposable income, unemployment rate and House Price Index (HPI) are highly significant as shown in Table 1. However, both the population rate and the Maturity rate variable are moderately significant, whereas interest rate appears not to be significant.
# Multicollinearity Check:  
We obtained the Variance Inflation Factor (VIF) to check if multicollinearity exists among the independent variables. Research suggested that a VIF=1 implies no multicollinearity, VIF = 1.0 to 5.0 shows moderate collinearity, while VIF >5 implies the independent variables are highly correlated. In this analysis, we set the threshold for VIF to 2. Therefore, we assumed that VIF >2 seems to be indicative of multicollinearity. In Table 1, we concluded that each independent variable is not correlated with the other since each VIF ≤2. Similarly, the VIF barplot below shows that none of the variables breached the threshold line (>2 ). The Adjusted R^2 (83.7%)  Implies that about 84% of the change in GDP is explained by the changes in the predictor variables. 
 
# Improving the Model
In order to determine whether we can improve the performance of our model, we added the following additional variables one at a time to the base model: 
	Corporate Profit(CP): the predictor variable is “Corporate Profit after Tax (without IVA and CCAdj) annual percent” (Corp).
	10-Year Breakeven inflation rate (T10YIE): the predictor variable is “10-Year Breakeven inflation rate annual percent” (T10YIE).
Process Followed to Add New Macroeconomic Variables to the Existing Dataset:
In order to merge the additional variable(s) into the existing data in R,  we performed the following steps:
	Prepared a working data frame to correctly merge the new variable with the existing macroeconomic variables.
	Ensured that the “Date” column is set as the “primary key” so that when importing the new data, the “date” column is in date format rather than a factor format. This step was necessary because not all the variables are available for exactly for the same timeframe. 
	We inspected the new combined data to make sure everything that the data properly aligned. For example, by checking for missing values and filling them using the “mice package” if they exist. 
# p-value: 
Disposable income, unemployment rate, House price index, and corporate profit (newly added) are highly significant as shown in Table 2. However, both the population rate and maturity rate variable are moderately significant, whereas interest rate appears not to be significant. 
# Multicollinearity Check: 

From Table 2, each VIF<2 shows no multicollinearity based on the threshold. Similarly, the VIF barplot in figure 2 shows that none of the variables cut across the threshold line(>2 ). We observed that the R^2 (84.4%) and the adjusted R^2 (83.9%) increases slightly than what we had in Table 1. This shows that the new variable slightly improves the model fit. 


	p-value: We see that the precision of our estimated coefficients reduces. Disposable income, unemployment rate, and House price index remain highly significant, while population rate is moderately significant and interest rate has a low significant level, as shown in Table 3. However, maturity rate, corporate profit, and Inflation rate appear not to be statistically significant. This could be traced to the multicollinearity effect when new variables are added. 
NOTE: Since multicollinearity affects p-values, and regression coefficients, we cannot trust the p-values obtained even though it does not influence our predictions.     
# Multicollinearity Check: 
  From Table 3, based on the VIF threshold that we set for this research, only population, maturity rate, disposable income, and unemployment rate variables have VIF<2 which indicates no multicollinearity. Interest rate and House price index with VIF~≤2 shows very little or no multicollinearity. However, Corporate profit and Inflation rate variables show some level of multicollinearity with VIF>2. Although, research suggested that a VIF≤5 has moderate collinearity for research purposes. We observed that the R^2 (90.5%) and the adjusted R^2 (89.4%) increases compared to what we have in Table 2. This shows that the new variable improves the model fit even though with some level of moderately acceptable multicollinearity.
 
# Conclusion:
In this essay, we examined how GDP could be predicted using other macroeconomic variables. To achieve this objective, we used multiple linear regression analysis.  We first built a based model and then extended the base model to inculcate additional variables to determine whether we could improve the performance of our base model. We also evaluated how each additional variable impacted our regression fit by comparing the VIF’s and the p-values at a 5% significant level. The multiple linear regression model appears to be a suitable model for determining a linear relationship between dependent and independent features.


