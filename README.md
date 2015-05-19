# shinyapp3
ShinyApp for Coursera Project 19th May 2015
Treatment History Explorer Application
Background
The application uses (simulated) data of patient drug treatment histories and provides a number of different types of interactive visualisations from time of diagnosis. The main aim of the analysis is to show how stable treatment pathways are across time. In the case where treatments where not ideal or guidelines are poor we might expect patients to change drugs frequently. In cases where guidelines are good and / or treatments are successful we might expect treatment pathways to remain stable with little change in treatments.
Usage Instructions
One the left hand panel there are a number of controls, which are described below from top to bottom.
Select Sub Sample Size
This slider allow you to select the number of the randomly selected sub sample of patients for sequence sub sample visualisation (see details of visualisations below)
Selection of Age Ranges
This slider allows the user to select the age group to be shown in the visualisations. There are two sliders, one for the minimum age and one for the maximum age in the selected age range.
Gender
These radio buttons allow you to create a sub sample of only males, only females or both.
Severity Group
The condition in question is clinically present with two recognised levels of severity; the radio button allows you select the sub sample of only mild or only severe or both levels of severity
Analysis Type
The drop down box allows the user to select five different types of visualisation which are detailed below.
Sequence Sub Sample 
The sequence sub sample draws a randomly selected number of patient treatment histories (vertical axis) and plot the current treatment at each day since time of diagnosis (horizontal axis). Different drugs are represented with different colours. The size of the sub sample is selected in the select sub sample size slider in the left panel.
Frequency
This visualisation shows the most frequent patterns of treatment for the selected patient group. With percent of all patients on the vertical axis and time since diagnosis on the horizontal axis. Only the most frequent patterns are shown
Entropy
This visualisation plots the entropy of the treatment patterns for the entire selected population, with time since diagnosis on the horizontal axis.
Turbulence
This visualisation plots the Turbulence of the treatment patterns for the entire selected population with time since diagnosis on the horizontal axis.
Cluster 
Uses hierarchical clustering to show the ‘relatedness’ of the treatment histories in the selected patient population

Possible Error Messages
Error: Undefined columns selected.
This will usually occur when the age range, gender, severity selections result in too few or no patient being present in the sub sample. In this case the selections should be adjusted to allow a sufficient sample of patients to visualise.
Error: cannot take a sample larger than the population when 'replace = FALSE'
This error message occurs when the sub sample selected in the ‘Select Sub Sample Size’ slider, is larger than the pool of patient treatment histories from which the sample is to be drawn. For example trying to show a sub sample of 300 patient records when there are only 200 records available.
Note on future development
Eventually slider values will be adjusted to automatically adapt the possible selections so that error messages cannot occur. 
Error messages will be made more users friendly and informative, instructing the user to adjust settings to correct.
A tab with options for basic visualisation of patient demographics of the selected population will be added.
Comparative visualisations between different selected patient groups will be added






