/* t-test for inflation rates from 1947 to 2007 */ 
data pre;  
input metric $ rate @@;  
datalines; 
***************; 
run; 
proc ttest data=pre;  
class metric;  
var rate;  
title 't-test of gdp_def vs cpi from 1947-2007'; 
run; 
 
/* t-test for inflation rates from 2007 to 2017 */ 
data post;  
input metric $ rate @@;  
datalines; 
***************; 
run; proc ttest data=post;  
class metric;  var rate;  
title 't-test of gdp_def vs cpi from 2008-2017'; 
 
/* paired t-test for inflation rates from 1947 to 2007 */ 
data prepair;  
input gdpdef cpi;  
datalines; 
***************; 
run; 
ods graphics on; 
proc ttest; 

/* Correlations among wage growth, inflation, median income, and median */ 
data growthrates;  
input year mhousehold mpersonal mhomesold mrental gdpdef cpi;  
datalines; 
***************; 
run; 
 
proc print data=growthrates;  
title 'All Rates from 1984-2015'; 
run; 
ods graphics on; 

proc corr data=growthrates plots=matrix(histogram);  
title 'Pearson Corr Among Rate Changes'; 
run; 
ods graphics off; 
 
/* Simple Linear Regressions to predict median home price */ 
ods graphics on; 
proc reg;  
model mhomesold = mhousehold;  
title 'mhomesold = mhousehold'; 
run; 

proc reg;  
model mhomesold = mpersonal;  
title 'mhomesold = mpersonal'; 
run; 

proc reg;  
model mhomesold = mrental;  
title 'mhomesold = mrental'; 
run; 

proc reg;  
model mhomesold = cpi;  
title 'mhomesold = cpi'; 
run; 

proc reg;  
model mhomesold = gdpdef;  
title 'mhomesold = gdpdef'; 
run; 
ods graphics off; 
