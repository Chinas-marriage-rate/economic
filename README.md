# Credit-Risk-Management - PART 1(A) 
MULTIPLE REGRESSION MODEL FOR PREDICTING GDP USING MACROECONOMIC VARIABLES
# Introduction
This short essay explores how one may predict the Gross Domestic Product (GDP) of a country using a technique known as multiple linear regression. Specifically, we examine whether other macroeconomic variables such as population, interest rates, unemployment rates, amongst others, can be used to predict the GDP of a country. Linear regression is a statistical model for finding the relationship between input variables (also known as Independent/explanatory variables) and output variables (dependent/response variables). Linear regression models are used for predicting continuous variables compared to logistic regression models used for predicting categorical outcomes.

When we have just one input variable, it is a case of a simple linear regression whose equation is of the form;

![image](https://user-images.githubusercontent.com/54149747/127126422-c5b73bb3-9dd7-4e48-a5fc-4934568284ef.png)

Where Y is the output variable, X is the input variable, β_0 is the intercept(i.e., the predicted value of Y when X is zero. β_1 is the slope/regression coefficient(i.e., the rate at which Y is expected to change when X increases/decreases. ε is the error term whose expectation is zero(E(ε)=0(i.e., it is expected that the variation of the regression coefficient should be zero)
For multiple linear regression, which consists of more than one independent variable, the general equation for a set of observations with k linearly independent predictor variables is of the form;

![image](https://user-images.githubusercontent.com/54149747/127185708-f54b9046-197c-4176-8575-0b7ab81c5d1d.png)

It should be noted that for i=1,2,…n the relationship between the dependent variable Y and the k independent variables x_1,x_2,…,x_k are linear in the parameters. The matrix form of the general linear model is written as;  ![image](https://user-images.githubusercontent.com/54149747/127186271-e17c5d1a-6984-4684-a844-71127b7e92ca.png)

# Parameter Estimation

The base model for linear regression is the “Least Square Estimate”. It squares and sums all the vertical deviations from each observation(data points) to the line, and the goal is to minimize the error. The least-square estimation is commonly used in fitting the regression line.

**NORMAL EQUATIONS**

The system of normal equation of the expression; ![image](https://user-images.githubusercontent.com/54149747/127191378-2b26af69-e2a2-4c20-8f70-23bfa1342738.png)

The normal equation is simply expressed in the form; ![image](https://user-images.githubusercontent.com/54149747/127192371-55b0c092-3d9f-4c34-90be-41d6403a1a2a.png)

**Example:** Consider the four pairs of (x,y) data points {(-1,-3),(0,-1),(1,1),(2,1)}
The system of the normal equation to find the best fit linear relationship for this data is of the form,
 b=Ax which can be expressed as;![image](https://user-images.githubusercontent.com/54149747/127194294-4b6734ff-a22c-419b-8b02-e133f6a82afa.png)

![image](https://user-images.githubusercontent.com/54149747/127194609-6cd402af-00dc-47f6-83c7-e7120fdfbd61.png)

**IMPLEMENTATION IN R:**

Having established sufficient theoretical background on linear regression, we now implement the above example in R to explain how the problem could be solved using a statistical programming package. The first approach uses the “lm” function in R, and the alternative method uses the matrix approach, as explained above.

●	Using the “lm” function in R: we could simply create the X and Y vectors (data points) and apply the “lm” function to obtain the same result as the theoretical approach we obtained earlier(as shown below).  
![image](https://user-images.githubusercontent.com/54149747/127195488-3502ab94-c2e3-4288-8b47-94926eac976b.png)

●	Alternatively, we could create a vector matrix by using the “matrix()” function in R, then apply the “lm” function to obtain the same result as shown below.
![image](https://user-images.githubusercontent.com/54149747/127195650-2dfcc6dd-1df2-4d26-b723-044de0e7b020.png)

WORKING WITH MACROECONOMIC VARIABLES USING MULTIPLE LINEAR REGRESSION

**Case Study:**

What is the association between GDP and other macroeconomic variables?

**Data:**

Data: Gross Domestic Product (U.S. Bureau of Economic Analysis)

**Source:** https://fred.stlouisfed.org/series/GDP

**Note:** The data for each macroeconomic variable considered was downloaded and merged into one single excel sheet to form one single table. Additional macroeconomic variables were added using data munging/wrangling techniques to determine how they contribute to our model. 
Period Covered by Data: 04/01/1953 – 01/01/2021

**Data Transformation & Processing:**

Missing values were handled using several methods as documented below;

-	averaging (replacing the missing value(s) with the mean of the non-missing values -if no outlier)
-	replacing the missing value(s) with the median of the non-missing values – if an outlier is present.
-	in R, we can use the “mice package” to handle the missing value. This package is such that it uses some information from the other variables in the dataset to impute the missing data.
In this project, we used the “mice package”. A dataframe is created for the missing values, and then the “mice package” imputed the missing data to ensure there was no longer any missing data(see R-code).

**EXPLORATORY ANALYSIS:** 

The data consists of 272 records and 28 features. We are interested in modeling multiple independent variables to determine the relationships between these variables and the dependent variable (GDP). We also examined colinearity and interactions of the independent variables on our model. To aid in understanding the relationships between the variables we used scatterplots like the one shown below.

![image](https://user-images.githubusercontent.com/54149747/127119704-7b3c2a5b-9677-4a6f-906c-ecb1397c2f17.png)
 
Based on our exploratory analysis and given that we are trying to predict a continuous variable, we concluded that our best choice for this part of the research is a linear regression model.  
Base Model:

We start the regression analysis by initially modeling GDP with the variables listed below. Subsequently, after building the initial model, we added additional macroeconomic variables that could potentially improve the performance of the model.

**Model:** 

**Dependent Variable:** GDP (Annual Percent) – GDP

**Independent Variables:** Population (Annual Percent) – Pop
                                           Interest Rate(Annual Percent)- INTDSRUSM193
                                           10-Year Treasury Constant Maturity Rate – DGS10
                                           Disposable Personal Income(Annual Percent) – DSPI
                                           Unemployment Rate(Annual Percent) – U2RATE
                                           All Transactions House Price Index – USSTHPI

**Model:** ![image](https://user-images.githubusercontent.com/54149747/127196844-a0df8867-e65f-44ea-8c8c-4622e13c0277.png)
Where each variable represents the Annual percent returns and regression coefficients obtained are approximated to three decimal places.

# Result 
![image](https://user-images.githubusercontent.com/54149747/127200765-e9ae56e3-ad04-40ce-8302-701e8153b361.png)

**p-value**: Disposable income, unemployment rate and House Price Index (HPI) are highly significant as shown in Table 1. However, both the population rate and the Maturity rate variable are moderately significant, whereas interest rate appears not to be significant.
**Multicollinearity Check:** We obtained the Variance Inflation Factor (VIF) to check if multicollinearity exists among the independent variables. Research suggested that a VIF=1 implies no multicollinearity, VIF = 1.0 to 5.0 shows moderate collinearity, while VIF >5 implies the independent variables are highly correlated. In this analysis, we set the threshold for VIF to 2. Therefore, we assumed that VIF >2 seems to be indicative of multicollinearity. In Table 1, we concluded that each independent variable is not correlated with the other since each VIF ≤2. Similarly, the VIF barplot below shows that none of the variables breached the threshold line (>2 ). The Adjusted R-square (83.7%) Implies that about 84% of the change in GDP is explained by the changes in the predictor variables. 
![image](https://user-images.githubusercontent.com/54149747/127201078-6c2200e8-71ec-48b1-b3d2-7cbc0044489f.png)
 
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


