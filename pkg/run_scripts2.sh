#!/bin/bash

cd AppliedPredictiveModeling/inst/chapters/

rm -rf .RData 
date "+ %Y-%m-%d %H:%M:%S: starting Tour"
R CMD BATCH  --no-save --no-restore  02_A_Short_Tour.R 
if [ -r Rplots.pdf ]
then
    mv Rplots.pdf 02_A_Short_Tour.pdf
fi

rm -rf .RData 
date "+ %Y-%m-%d %H:%M:%S: starting Pre-Processing"
R CMD BATCH  --no-save --no-restore 03_Data_Pre_Processing.R 
if [ -r Rplots.pdf ]
then
    mv Rplots.pdf 03_Data_Pre_Processing.pdf
fi
 
# rm -rf .RData 
# date "+ %Y-%m-%d %H:%M:%S: starting Over-Fitting"
# R CMD BATCH  --no-save --no-restore 04_Over_Fitting.R 
# if [ -r Rplots.pdf ]
# then
#     mv Rplots.pdf 04_Over_Fitting.pdf
# fi

# rm -rf .RData 
# date "+ %Y-%m-%d %H:%M:%S: starting Class Performance"
# R CMD BATCH  --no-save --no-restore 11_Class_Performance.R 
# if [ -r Rplots.pdf ]
# then
#     mv Rplots.pdf 11_Class_Performance.pdf
# fi

# rm -rf .RData 
# date "+ %Y-%m-%d %H:%M:%S: starting Importance"
# R CMD BATCH  --no-save --no-restore 18_Importance.R 
# if [ -r Rplots.pdf ]
# then
#     mv Rplots.pdf 18_Importance.pdf
# fi

# rm -rf .RData 
# date "+ %Y-%m-%d %H:%M:%S: starting Reg Case Study"
# R CMD BATCH  --no-save --no-restore 10_Case_Study_Concrete.R 
# if [ -r Rplots.pdf ]
# then
#     mv Rplots.pdf 10_Case_Study_Concrete.pdf
# fi

rm -rf .RData 
date "+ %Y-%m-%d %H:%M:%S: starting Class Case Study"
R CMD BATCH  --no-save --no-restore 17_Job_Scheduling.R
if [ -r Rplots.pdf ]
then
    mv Rplots.pdf 17_Job_Scheduling.pdf
fi

rm -rf .RData 
date "+ %Y-%m-%d %H:%M:%S: starting Grants"
R CMD BATCH  --no-save --no-restore CreateGrantData.R 

rm -rf .RData 
date "+ %Y-%m-%d %H:%M:%S: starting Linear Reg"
R CMD BATCH  --no-save --no-restore 06_Linear_Regression.R
if [ -r Rplots.pdf ]
then
    mv Rplots.pdf 06_Linear_Regression.pdf
fi

rm -rf .RData 
date "+ %Y-%m-%d %H:%M:%S: starting Non-Linear Reg"
R CMD BATCH  --no-save --no-restore 07_Non-Linear_Reg.R
if [ -r Rplots.pdf ]
then
    mv Rplots.pdf 07_Non-Linear_Reg.pdf
fi

# rm -rf .RData 
# date "+ %Y-%m-%d %H:%M:%S: starting Trees"
# R CMD BATCH  --no-save --no-restore 08_Regression_Trees.R
# if [ -r Rplots.pdf ]
# then
#     mv Rplots.pdf 08_Regression_Trees.pdf
# fi


# rm -rf .RData 
# date "+ %Y-%m-%d %H:%M:%S: starting Feature selection"
# R CMD BATCH  --no-save --no-restore 19_Feature_Select.R 
# if [ -r Rplots.pdf ]
# then
#     mv Rplots.pdf 19_An_Introduction_to_Feature_Select.pdf
# fi


rm -rf .RData 
date "+ %Y-%m-%d %H:%M:%S: starting Linear Class"
R CMD BATCH  --no-save --no-restore 12_Discriminant_Analysis.R 
if [ -r Rplots.pdf ]
then
    mv  Rplots.pdf 12_Discriminant_Analysis.pdf
fi

# rm -rf .RData 
# date "+ %Y-%m-%d %H:%M:%S: starting Non-linear Class"
# R CMD BATCH  --no-save --no-restore 13_Non-Linear_Class.R 
# if [ -r Rplots.pdf ]
# then
#     mv Rplots.pdf 13_Non-Linear_Class.pdf
# fi

rm -rf .RData 
date "+ %Y-%m-%d %H:%M:%S: starting Class Trees"
R CMD BATCH  --no-save --no-restore 14_Class_Trees.R
if [ -r Rplots.pdf ]
then
    mv Rplots.pdf 14_Class_Trees.pdf
fi

# rm -rf .RData 
# date "+ %Y-%m-%d %H:%M:%S: starting Imbalance"
# R CMD BATCH  --no-save --no-restore 16_Class_Imbalance.R
# if [ -r Rplots.pdf ]
# then
#     mv Rplots.pdf 16_Class_Imbalance.pdf
# fi

date "+ %Y-%m-%d %H:%M:%S: Finished!"




