# CPO
## Corrected Proportion of Occurrences (CPO) between species in a collection of samples

This tool calculates the corrected cooccurrence index (CPO) between pairs of species. CPO considers that the number of cooccurrence between two species is affected by how commmon a species is (how many times they appear among samples), and propose an ajusted metric for measuring the degree wich two species occur with each other. The CPO is calculated as:

CPO<sub>it</sub> = n<sub>it</sub> / ( n<sub>i</sub> * ( n<sub>t</sub> / N ) )

where ni is the total number of samples where species i occurred, and nj is the total number of samples where species j cooccurred; nij is the number of samples where species i cooccurred together with species j, and N is the total number of samples. The CPO<sub>it</sub> = n<sub>it</sub> indicates whether species i and j co-occurred more (CPO<sub>it</sub> = n<sub>it</sub> > 1) or less (CPO<sub>it</sub> = n<sub>it</sub> < 1) than expected by chance (CPO<sub>it</sub> = n<sub>it</sub> = 1).


## Package usage
The files and functions required for this example are available for download from the repository. Ensure all files are copied to your current working directory and proceed to compile the code using the 'source()' command.

```{r, echo=FALSE}
source('CPO.R')
```

Data entry is a collection of samples (numeric matrix), with samples a rows and species as columns. To illustrate, I constructed a synthetic dataset ('OccurrenceDataset.csv') containing a series of samples registering the occurrence of 3 hypothetical species. This dataset, saved as a .csv file, can be loaded using the 'read.csv()' function.

```{r, echo=FALSE}
read.csv('OccurrenceDataset.csv')
```

For a single pair of species, the tool calculates the CPO value with the function 'cpo()'.

```{r, echo=FALSE}
cpoResult <- cpo(m)
cpoResult
```

Optionally, the function also returns a distribution of iteratively randomized occurrences of species among samples (generally used to obtain the probability which the observed index differ from random) if the argument 'null.model' is set to 'TRUE' and the number of randomizations is provided using the argument 'rand'. If 'null.model' is 'TRUE' and 'rand' is not provided, a total of '999' randomizations is set by default.    

```{r, echo=FALSE}
cpoResult <- cpo(m, null.model=TRUE, rand=999)
cpoResult
```

Multiple species are also allowed as entry data and can be handled by the function 'cpoPairWise()'. In this case, the tool calculates the index for each pair of species in the collection of samples.

```{r, echo=FALSE}
cpoResults <- cpoPairWise(m)
cpoResults
```

Randomizations are dandled similarly

```{r, echo=FALSE}
cpoPairWise(m, null.model=TRUE, rand=999)
cpoResults
```

