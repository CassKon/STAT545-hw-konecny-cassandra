# Building Shiny apps

This Folder is created for Homework assignment #6 for STAT 545. Within this folder you will find the markdown and Rmarkdown files for the assignment. 

The homework assignment can be found here:

[**Homework 08: Building Shiny apps - Homework**](http://stat545.com/hw08_shiny.html)

My completed assignment can be found here: 

[**Cassandra Konecny hw08**](https://konecny.shinyapps.io/BC_Liq_App/)

Here is the link to my [ui.R](https://github.com/CassKon/STAT545-hw-konecny-cassandra/blob/517e56dde77a49e46685686919408b275beff9e8/hw-8/BC_Liq_App/ui.R) file and my [server.R](https://github.com/CassKon/STAT545-hw-konecny-cassandra/blob/d8d069e5e3fe552a228697214356891485532791/hw-8/BC_Liq_App/server.R) file


# Modifcations made to BC Liquor Store app

* Add an image of the BC Liquor Store to the UI

* The app currently behaves strangely when the user selects filters that return 0 results. For example, try searching for wines from Belgium. There will be an empty plot and empty table generated, and there will be a warning message in the R console. Try to figure out why this warning message is appearing, and how to fix it.

* Allow the user to download the results table as a .csv file.

**References**

* [Web application code](http://stat545.com/shiny01_activity.html#final-shiny-app-code)
* [Data)(https://raw.githubusercontent.com/STAT545-UBC/STAT545-UBC.github.io/master/shiny_supp/2016/bcl-data.csv)
* [Adding Images in title section](https://stackoverflow.com/questions/36182535/how-to-place-an-image-in-an-r-shiny-title)
* [Donloading data](https://shiny.rstudio.com/reference/shiny/0.14/downloadHandler.html)
* [Download button](https://shiny.rstudio.com/reference/shiny/1.0.5/downloadButton.html)


# Report your process

* I decided to modify the existing app instead of creating a new one due to time constraints. I do feel like in reading throught he app and working with it, I understand it better.
* I had trouble finding the right place to add an if statement in order to deal with the empty plot that is returned when 0 results are found. Eventually I got it right though after going through the logic of the code.
* Adding image was pretty straight forward however getting it in the title section while still getting the title and the window title to show up was a little more tricky.
* Adding the download button was pretty straight forward after reading the available Shiny documentation.
* Overall the assignment was usefule and I am excited to experiment with Shiny apps in future projects!
