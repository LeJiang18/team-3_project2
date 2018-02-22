*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding graduation numbers and rates for various California High
Schools
Dataset Name: Graduates_analytic_file created in external file
STAT6250-01_w18-team-3_project2_data_preparation.sas, which is assumed to be
in the same directory as this file
See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic dataset cde_2014_analytic_file;
%include '.\STAT6250-01_w18-team-3_project2_data_preparation.sas'


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What is the number of white students graduating in Alameda in each year?'
;

title2
'Rationale: This help identifies the progress of students in terms of education on a yearly basis.'
;



*
Methodology: When combining the files Grads1314 and Grads1415 in data,
select the sum of white students graduated each year and group by Alameda
county and year.
Limitations: We don't really know if schools kept the same amount of students 
per year. It's possible that a school could have increased the number of
students it instructs which could increase the amount of graduates even if
it's at a lower rate.
Followup Steps: Possibly check if the total number of students increased for
the county in terms of total students enrolled.
;

proc print 
        data=Graduates_analytic_file_Total
    ;
    id 
        CDS_CODE
    ;
    var 
        SCHOOL COUNTY GRADRATE TOTAL
    ;
run; 

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What is the number of hispanic students graduated in 2 years county wise?'
;

title2
'Rationale: This would generate a population estimate of graduating hispanic students depending on each county.'
;

*
Methodology: Use PROC SQL to find the sum of hispanic students of both years
using the combined dataset and then group by counties to get an estimate of
student distribution over different county.
Limitations: We can't find out percentage of hispanic students graduating 
with top scores.We can only assume they graduate without knowing their
scores.
Followup Steps: Check the counties with the highest number of student
graduation rates and check to see if they graduate with high percentage
or just graduate.
;

proc print 
        data=Graduates_analytic_file_GradRate(obs=20)
    ;
    id 
        CDS_CODE
    ;
    var 
        SCHOOL GRADRATE
    ;
run;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What is the number of schools in each county? ?'
;

title2
'Rationale: Rationale: Get a population estimate of graduating students in each county so as to acquire related resources.'
;

*
Methodology: Use PROC PRINT to print out the sum of the number of schools
per county in the Graduates_analytic_file file created in data.
Limitations: None
Followup Steps: See which county has highest number of schools and focus
resources on the ones which have lowest number of schools to increase
numbers of schools and eventually students.
;

proc means 
        data=Graduates_analytic_file_high
        sum
    ;
    id
        CDS_CODE
    ;
    var
        COUNTY
    ;
run;
;
