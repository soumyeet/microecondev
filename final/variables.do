// Safely closes the handle if it's already open, preventing an error
capture file close myhandle

// Opens the new text file for writing, replacing it if it exists
file open myhandle using "variable_list.txt", write replace

// Writes the header row to your text file
file write myhandle "VariableName" _tab "VariableLabel" _n

// Creates a local macro `allvars` containing all variable names
unab allvars: _all

// Loops through each variable in the dataset
foreach var of local allvars {
    // Gets the variable's label and stores it in the `label` macro
    local label : var label `var'
    // Writes the variable name and its label to the file, separated by a tab
    file write myhandle "`var'" _tab `"`label'"' _n
}

// Closes the file handle to save the file
file close myhandle

// Displays a confirmation message and the path to the file
di as text "Success! The file 'variable_list.txt' has been created in your current working directory:"
pwd