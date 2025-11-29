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
use "D:\downloads\IAHR74DT\IAHR74FL.DTA", clear
display "Successfully loaded the full dataset."


// PART 2: DEFINE AND KEEP ESSENTIAL VARIABLES
// -----------------------------------------------------------------------------
/* This `global` macro defines all the variables we want to keep. This list
includes key identifiers, demographic information, socio-economic indicators,
and all variables related to household members and child nutrition needed for
your analysis of domestic violence, nutrition, and decision-making.
*/

global vars_to_keep hhid hv001 hv002 hv024 hv025 hv219 hv220 hv270 hv271 sh37n hv044 ///
	hv244 hv247 sh46 sh47 sh49 ///
	hc57_* ha2_* ha3_* ha40_* ha57_* hb2_* hb3_* hb40_* hb57_* hv106_* hv108_* ha66_* hb66_* ///
	hc1_* hc2_* hc3_* hc27_* hc31_* hc32_* hc64_* hc70_* hc71_* hc72_*

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

