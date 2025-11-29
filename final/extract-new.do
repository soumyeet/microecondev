/*******************************************************************************
* Stata Do-File: Extract Key Variables from Household Data
*
* Purpose: This script loads a large DHS dataset, keeps only a pre-selected
* list of essential variables for analysis, and saves the result
* as a new, smaller file. This avoids complex reshaping.
*
* Instructions:
* 1. Open Stata.
* 2. Set your working directory to the folder containing your dataset.
* Example: cd "C:\Users\Soumya Pandey\Downloads\IAHR7EDT"
* 3. Run this entire do-file.
*******************************************************************************/

clear all
set more off

// PART 1: LOAD DATA
// -----------------------------------------------------------------------------
// Load the full dataset from your specified path.
use "D:\downloads\IAIR74DT\indi 2015.DTA", clear
display "Successfully loaded the full dataset."


// PART 2: DEFINE AND KEEP ESSENTIAL VARIABLES
// -----------------------------------------------------------------------------
/* This `global` macro defines all the variables we want to keep. This list
includes key identifiers, demographic information, socio-economic indicators,
and all variables related to household members and child nutrition needed for
your analysis of domestic violence, nutrition, and decision-making.
*/

# Stata global variable definition for keeping a comprehensive set of variables for analysis.
# This list is organized by the categories discussed previously.

# Stata global variable definition for keeping a comprehensive set of variables for analysis.
# This list is organized by the categories provided by the user.

global vars_to_keep ///
	/*--- Location Identification ---*/ ///
	v001 v002 v021 v024 v025 v101 v102 v139 v140 sdistri ///
	///
	/*--- Woman's Physical State ---*/ ///
	v437 v438 v445 v453 v457 sb13 sb16* sb23* sb27* sb70 ///
	///
	/*--- Digital and Media Awareness ---*/ ///
	v120 v121 v153 v158 v159 s930 s930c ///
	///
	/*--- General Awareness ---*/ ///
	v155 v217 v416 v751 s256 s257* s927 s929 ///
	///
	/*--- Domestic Violence Indicators ---*/ ///
	d101a d101b d103a d103c d105a d105b d105c d105d d105e d105h d105i d101e d129 ///
	///
	/*--- Justification for Violence ---*/ ///
	v744a v744b v744c v744d v744e s936f s936g ///
	///
	/*--- Child Health, Nutrition, and Fertility ---*/ ///
	h2_* h3_* h4_* h5_* h6_* h7_* h8_* h9_* h11_* h22_* ///
	hw2_* hw3_* hw4_* hw5_* hw6_* hw7_* hw8_* hw9_* hw10_* hw11_* hw12_* hw57_* ///
	m4_* m5_* m39a_* h42_* v201 v213 v602 v605 v613 ///
	///
	/*--- Substance Usage (Respondent) ---*/ ///
	v463a v463b v463c v463f s707 s716 s717 s718* ///
	///
	/*--- Male & Partner Identifiers ---*/ ///
	/* Demographics & Work */ ///
	v730 v701 v715 v704 s907 ///
	/* Attitudes and Preferences */ ///
	v621 v743f d121 ///
	/* Substance Use */ ///
	d113 d114 ///
	/* Health and Family Planning */ ///
	s321b



// The 'keep' command will drop all variables NOT in the list above.
keep $vars_to_keep

display "Kept essential variables and dropped all others."


// PART 3: SAVE THE SUBSET DATA
// -----------------------------------------------------------------------------

// Compress the data to save disk space.
compress

// Save the smaller, cleaned dataset with a new name.
save "Subset_Household_Data.dta", replace

display "*****************************************************************"
display "Success! A new file named 'Subset_Household_Data.dta' has been saved."
display "This file contains only the selected variables."
display "*****************************************************************"

