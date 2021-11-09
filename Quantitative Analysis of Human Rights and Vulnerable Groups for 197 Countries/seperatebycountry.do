
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////// Quantitative Analysis of Human Rights and Vulnerable Groups for RCO Toolkit - Part 2 ////////////////////////////////////////

///////////////////////////////////////////////https://saudiarabia.un.org/en/127383-rco-unct-economist-toolkit/////////////////////////////////////////////

///////////////////////////////////////////////////// Data Source: https://sdgdata.humanrights.dk/ ////////////////////////////////////////////////////////

////////////////////////////////////////////////////////// Authors: Austin Hamilton, Aljaz Kuncic /////////////////////////////////////////////////////////

//////////////////////////////////////////////////// Email: austin.g.hamilton@gmail.com, kuncic@un.org ////////////////////////////////////////////////////

///////////////////////////////////////////////// Update the operating directory in the CD command on line 36/37 //////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////FIRST STEP///////////////////////////////////////////////////////////////////////
/*
Generate output by country
*/

foreach z of numlist 1/197 {
	
	set more off
	clear all

	cd "C:\Users\18285\Desktop\Quant Analysis of HR and Vulnerable 2021" ///////////////////////////////////////// Change if diff computer
	// cd "C:\Users\aljaz.kuncic\Desktop\Quant Analysis of HR and Vulnerable 2021" ///////////////////////////////////////// Change the directory

	// Open cleaned dataset
	use "STATA DTA Files\CLEAN_Quant_Analy_HR&Vuln_2021.dta", clear

	cd "C:\Users\18285\Desktop\Quant Analysis of HR and Vulnerable 2021\Excel Files" ///////////////////////////////////////// Change if diff computer
	// cd "C:\Users\aljaz.kuncic\Desktop\Quant Analysis of HR and Vulnerable 2021\Excel Files" ///////////////////////////////////////// Change the directory

	//////////////////////////////////////////////////////// Keeping only the country of interest ////////////////////////////////////////////////////////// 

	drop if id != `z'
	local p = state[1]  
	local w = 2021 // Lastest year of data

	///////////////////////////////////////////////////////////////////////// Export /////////////////////////////////////////////////////////////////////
	
	// Export all data for country z:
	export excel state id text sdggoals sdgtargets groups mechanism type responseupr recommendingstateupr treatybody specialprocedure documentcode paragraph year cycle session SDG1 SDG2 SDG3 SDG4 SDG5 SDG6 SDG7 SDG8 SDG9 SDG10 SDG11 SDG12 SDG13 SDG14 SDG15 SDG16 SDG17 children human_rights_def indigenous internally_displaced lgbti minorities migrants older disabilities refugees_asylum women youth SDG1_children SDG1_human_rights_def SDG1_indigenous SDG1_internally_displaced SDG1_lgbti SDG1_minorities SDG1_migrants SDG1_older SDG1_disabilities SDG1_refugees_asylum SDG1_women SDG1_youth SDG2_children SDG2_human_rights_def SDG2_indigenous SDG2_internally_displaced SDG2_lgbti SDG2_minorities SDG2_migrants SDG2_older SDG2_disabilities SDG2_refugees_asylum SDG2_women SDG2_youth SDG3_children SDG3_human_rights_def SDG3_indigenous SDG3_internally_displaced SDG3_lgbti SDG3_minorities SDG3_migrants SDG3_older SDG3_disabilities SDG3_refugees_asylum SDG3_women SDG3_youth SDG4_children SDG4_human_rights_def SDG4_indigenous SDG4_internally_displaced SDG4_lgbti SDG4_minorities SDG4_migrants SDG4_older SDG4_disabilities SDG4_refugees_asylum SDG4_women SDG4_youth SDG5_children SDG5_human_rights_def SDG5_indigenous SDG5_internally_displaced SDG5_lgbti SDG5_minorities SDG5_migrants SDG5_older SDG5_disabilities SDG5_refugees_asylum SDG5_women SDG5_youth SDG6_children SDG6_human_rights_def SDG6_indigenous SDG6_internally_displaced SDG6_lgbti SDG6_minorities SDG6_migrants SDG6_older SDG6_disabilities SDG6_refugees_asylum SDG6_women SDG6_youth SDG7_children SDG7_human_rights_def SDG7_indigenous SDG7_internally_displaced SDG7_lgbti SDG7_minorities SDG7_migrants SDG7_older SDG7_disabilities SDG7_refugees_asylum SDG7_women SDG7_youth SDG8_children SDG8_human_rights_def SDG8_indigenous SDG8_internally_displaced SDG8_lgbti SDG8_minorities SDG8_migrants SDG8_older SDG8_disabilities SDG8_refugees_asylum SDG8_women SDG8_youth SDG9_children SDG9_human_rights_def SDG9_indigenous SDG9_internally_displaced SDG9_lgbti SDG9_minorities SDG9_migrants SDG9_older SDG9_disabilities SDG9_refugees_asylum SDG9_women SDG9_youth SDG10_children SDG10_human_rights_def SDG10_indigenous SDG10_internally_displaced SDG10_lgbti SDG10_minorities SDG10_migrants SDG10_older SDG10_disabilities SDG10_refugees_asylum SDG10_women SDG10_youth SDG11_children SDG11_human_rights_def SDG11_indigenous SDG11_internally_displaced SDG11_lgbti SDG11_minorities SDG11_migrants SDG11_older SDG11_disabilities SDG11_refugees_asylum SDG11_women SDG11_youth SDG12_children SDG12_human_rights_def SDG12_indigenous SDG12_internally_displaced SDG12_lgbti SDG12_minorities SDG12_migrants SDG12_older SDG12_disabilities SDG12_refugees_asylum SDG12_women SDG12_youth SDG13_children SDG13_human_rights_def SDG13_indigenous SDG13_internally_displaced SDG13_lgbti SDG13_minorities SDG13_migrants SDG13_older SDG13_disabilities SDG13_refugees_asylum SDG13_women SDG13_youth SDG14_children SDG14_human_rights_def SDG14_indigenous SDG14_internally_displaced SDG14_lgbti SDG14_minorities SDG14_migrants SDG14_older SDG14_disabilities SDG14_refugees_asylum SDG14_women SDG14_youth SDG15_children SDG15_human_rights_def SDG15_indigenous SDG15_internally_displaced SDG15_lgbti SDG15_minorities SDG15_migrants SDG15_older SDG15_disabilities SDG15_refugees_asylum SDG15_women SDG15_youth SDG16_children SDG16_human_rights_def SDG16_indigenous SDG16_internally_displaced SDG16_lgbti SDG16_minorities SDG16_migrants SDG16_older SDG16_disabilities SDG16_refugees_asylum SDG16_women SDG16_youth SDG17_children SDG17_human_rights_def SDG17_indigenous SDG17_internally_displaced SDG17_lgbti SDG17_minorities SDG17_migrants SDG17_older SDG17_disabilities SDG17_refugees_asylum SDG17_women SDG17_youth using "HR_Vuln`w'_`p'.xls", sheet("All data -- `p'") sheetmodify firstrow(variables)
}

