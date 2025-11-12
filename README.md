# Einars GTS handler
## Introduction
This R package simplfies downloading and loading GridTimeSeries from Norges vassdrags- og energidirektorat (NVE GTS) JSON data to a directory using R. It uses modern features such as httr2 and purrr to improve on the speed of handling such large datasets. 

To make sure that the datasets don't eat up all the RAM on the users computer the process is batched and each batch is saved as a RDS file before the next one is loaded. 

The package tries to follow Tidyverse and R-GIS standards.

## Why
NVEs GTS is pretty frequently used in Norway for historical and present gridded environmental data. I've personally used it in reporting and for research on a couple of occasions. My original implementation (in 2022) left a lot to be desired, it was very slow, and had a tendency to crash deleting all unsaved data. It was based on the examples made for Metrologisk Institutts REST API "Frost" (https://frost.met.no/r_example.html). After working a lot with R for a few years I was once again tasked with fetching GTS data, which I used as an opportunity to start a new project from scratch for downloading this kind of data. This implementation uses paralell processing and a modern packages for handeling the requests and is much faster, safer, and easier to use.

## Using the package. 

Making a simple request requires 3 things: coordinates, a date range, and what layer you want.

For our use case this is further made into 
- A coordinate list
- The first date in your date range
- The last date in your date range
- The two letter shorthand for your layer (rr, tm)
- And a name

