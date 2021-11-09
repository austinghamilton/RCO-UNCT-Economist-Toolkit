
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////// Quantitative Analysis of Human Rights and Vulnerable Groups for RCO Toolkit - Part 1 ////////////////////////////////////////

///////////////////////////////////////////////https://saudiarabia.un.org/en/127383-rco-unct-economist-toolkit/////////////////////////////////////////////

///////////////////////////////////////////////////// Data Source: https://sdgdata.humanrights.dk/ ////////////////////////////////////////////////////////

////////////////////////////////////////////////////////// Authors: Austin Hamilton, Aljaz Kuncic /////////////////////////////////////////////////////////

//////////////////////////////////////////////////// Email: austin.g.hamilton@gmail.com, kuncic@un.org ////////////////////////////////////////////////////

///////////////////////////////////////////////// Update the operating directory in the CD command on line 36/37 //////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////FIRST STEP///////////////////////////////////////////////////////////////////////
/*
General merge into STATA
*/

set more off
clear all

cd "C:\Users\18285\Desktop\Quant Analysis of HR and Vulnerable 2021" ///////////////////////////////////////// Change if diff computer
// cd "C:\Users\aljaz.kuncic\Desktop\Quant Analysis of HR and Vulnerable 2021" ///////////////////////////////////////// Change the directory

// We firstly save all the available time series data
import delimited "export.csv"

sort state
egen id = group(state)
order state id

// Trimmed for Excel naming issues later
replace state = "Bolivia" if state == "Bolivia (Plurinational State of)"
replace state = "Bosnia & H" if state == "Bosnia and Herzegovina"
replace state = "CAR" if state == "Central African Republic"
replace state = "Cote d'Ivoire" if state == "CÃ´te d'Ivoire"
replace state = "Iran" if state == "Iran (Islamic Republic of)"
replace state = "Lao" if state == "Lao People's Democratic Republic"
replace state = "Micronesia" if state == "Micronesia (Federated States of)"
replace state = "UK" if state == "United Kingdom of Great Britain and Northern Ireland"
replace state = "Venezuela" if state == "Venezuela (Bolivarian Republic of)"
replace state = "D Republic of Korea" if state == "Democratic People's Republic of Korea"
replace state = "D Republic of Congo" if state == "Democratic Republic of the Congo"
replace state = "Palestine" if state == "State of Palestine"
replace state = "Saint Kitts & N" if state == "Saint Kitts and Nevis"
replace state = "Saint Vincent & G" if state == "Saint Vincent and the Grenadines"
replace state = "Syria" if state == "Syrian Arab Republic"
replace state = "Sao Tome & P" if state == "Sao Tome and Principe"
replace state = "UAE" if state == "United Arab Emirates"
replace state = "Tanzania" if state == "United Republic of Tanzania"
replace state = "Trinidad & T" if state == "Trinidad and Tobago"
replace state = "USA" if state == "United States of America"


save "STATA DTA Files\Quant_Analy_HR&Vuln_2021.dta", replace

/*
There are 74 observations not linked to a state

There are 74,558 observations not linked to an SDG Goal

There are 74,558 observations not linked to an SDG Targets

There are 78,169 observations not linked to a group

There are 104,823 observations without a UPR

There are 105,153 observations without a treaty body

There are 175,221 observations without a special procedure
*/

// Clean strings of weird symbolsm charahcter, and sapces

foreach x of varlist state text sdggoals sdgtargets groups mechanism type responseupr recommendingstateupr treatybody specialprocedure documentcode paragraph cycle {
	replace `x' = strtrim(`x')
	replace `x' = ustrtrim(`x')	
}

////////////////////////////////////////////////////////////////////////////STEP TWO////////////////////////////////////////////////////////////////////////
/*
Create dummy variables for SDG Goals & Groups 
*/

// SDG Goals:
gen SDG1 = strpos(sdggoals , "1. No poverty")
label variable SDG1 "Sustainable Development Goal 1: No Poverty"

gen SDG2 = strpos(sdggoals , "2. Zero hunger")
label variable SDG2 "Sustainable Development Goal 2: Zero Hunger"

gen SDG3 = strpos(sdggoals , "3. Good health and well-being")
label variable SDG3 "Sustainable Development Goal 3: Good Health and Well-being"

gen SDG4 = strpos(sdggoals , "4. Quality education") 	
label variable SDG4 "Sustainable Development Goal 4:  Quality Education"

gen SDG5 = strpos(sdggoals , "5. Gender equality") 	
label variable SDG5 "Sustainable Development Goal 5: Gender Equality"

gen SDG6 = strpos(sdggoals , "6. Clean water and sanitation") 	
label variable SDG6 "Sustainable Development Goal 6: Clean Water and Sanitation"

gen SDG7 = strpos(sdggoals , "7. Affordable and clean energy") 	
label variable SDG7 "Sustainable Development Goal 7: Affordable and Clean Energy"

gen SDG8 = strpos(sdggoals , "8. Decent work and economic growth") 	
label variable SDG8 "Sustainable Development Goal 8: Decent Work and Economic Growth"

gen SDG9 = strpos(sdggoals , "9. Industry, innovation and infrastructure")
label variable SDG9 "Sustainable Development Goal 9: Industry, Innovation and Infrastructure"

gen SDG10 = strpos(sdggoals , "10. Reduce inequalities")
label variable SDG10 "Sustainable Development Goal 10: Reducing Inequality"

gen SDG11 = strpos(sdggoals , "11. Sustainable cities and communities")
label variable SDG11 "Sustainable Development Goal 11: Sustainable Cities and Communities"

gen SDG12 = strpos(sdggoals , "12. Responsible consumption and production")
label variable SDG12 "Sustainable Development Goal 12: Responsible Consumption and Production"

gen SDG13 = strpos(sdggoals , "13. Climate action")
label variable SDG13 "Sustainable Development Goal 13: Climate Action"

gen SDG14 = strpos(sdggoals , "14. Life below water")
label variable SDG14 "Sustainable Development Goal 14: Life Below Water"

gen SDG15 = strpos(sdggoals , "15. Life on land")
label variable SDG15 "Sustainable Development Goal 15: Life On Land"

gen SDG16 = strpos(sdggoals , "16. Peace, justice and strong institutions")
label variable SDG16 "Sustainable Development Goal 16: Peace, Justice, and Strong Institutions"

gen SDG17 = strpos(sdggoals , "17. Partnerships for the goals")
label variable SDG17 "Sustainable Development Goal 17: Partnerships for the Goals"

foreach b of numlist 1/17 {
	replace SDG`b' = 1 if SDG`b' > 0
}

// Groups:
gen children = strpos(groups , "Children")

gen human_rights_def = strpos(groups , "Human rights defenders")

gen indigenous = strpos(groups , "Indigenous peoples")

gen internally_displaced = strpos(groups , "Internally displaced persons")

gen lgbti = strpos(groups , "LGBTI")

gen minorities = strpos(groups , "Members of minorities")

gen migrants = strpos(groups , "Migrants")

gen older = strpos(groups , "Older persons")

gen disabilities = strpos(groups , "Persons with disabilities")

gen refugees_asylum = strpos(groups , "Refugees and asylum-seekers")

gen women = strpos(groups , "Women and girls")

gen youth = strpos(groups , "Youth")

foreach c in children human_rights_def indigenous internally_displaced lgbti minorities migrants older disabilities refugees_asylum women youth {
	replace `c' = 1 if `c' > 0
}

// Groups by SDGs:

foreach b of numlist 1/17 {
	foreach c in children human_rights_def indigenous internally_displaced lgbti minorities migrants older disabilities refugees_asylum women youth {
	gen SDG`b'_`c' = .
	replace SDG`b'_`c' = 1 if SDG`b' == 1 & `c' == 1 
	}
}

save "STATA DTA Files\CLEAN_Quant_Analy_HR&Vuln_2021.dta", replace
