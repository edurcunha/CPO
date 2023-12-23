# CPO
## Corrected Proportion of Occurrences (CPO) between species in a collection of samples

The Corrected Proportion of Occurrences (CPO) is an index designed to calculate the corrected cooccurrence index between pairs of species within a collection of samples (Thomaz and Michelan 2011). This index, denoted as CPO, acknowledges that the frequency of cooccurrence between two species is influenced by the individual occurrence frequency of each species across samples. To provide a more accurate metric for measuring the degree to which two species cooccur, the CPO is introduced. 

The CPO is computed using the following formula:

CPO<sub>ij</sub> = n<sub>ij</sub> / ( n<sub>i</sub> * ( n<sub>j</sub> / N ) )

where:
n<sub>i</sub> is the total number of samples where species i occurred,
n<sub>j</sub> is the total number of samples where species j cooccurred,
n<sub>ij</sub> is the number of samples where species i cooccurred with species j, and
N the total number of samples.

The resulting CPO<sub>it</sub> indicates whether species i and j co-occurred more (CPO<sub>it</sub> = n<sub>it</sub> > 1) or less (CPO<sub>it</sub> = n<sub>it</sub> < 1) than expected by chance (CPO<sub>it</sub> = n<sub>it</sub> = 1).


## Package usage
To utilize this tool, download the necessary files and functions from the repository. Copy all files to your current working directory and execute the code using the 'source()' command.

```{r, echo=FALSE}
source('CPO.R')
```

The input data for this tool should be a collection of samples in the form of a numeric matrix, where samples are represented as rows and species as columns. As an example, a synthetic dataset ('OccurrenceDataset.csv') containing samples of three hypothetical species is provided. Load this dataset using the 'read.csv()' function:

```{r, echo=FALSE}
read.csv('OccurrenceDataset.csv')
```

For a single pair of species, calculate the CPO value using the 'cpo()' function:

```{r, echo=FALSE}
cpoResult <- cpo(m)
cpoResult
```

Optionally, the 'cpo()' function can return a distribution of iteratively randomized occurrences of species among samples. This is useful for obtaining the probability that the observed index differs from random. Set the 'null.model' argument to 'TRUE' and specify the number of randomizations using the 'rand' argument. If 'rand' is not provided, a default of '999' randomizations is used:

```{r, echo=FALSE}
cpoResult <- cpo(m, null.model=TRUE, rand=999)
cpoResult
```
The 'cpoPairWise()' function allows the analysis of multiple species. It calculates the index for each pair of species in the collection of samples:

```{r, echo=FALSE}
cpoResults <- cpoPairWise(m)
cpoResults
```

Similarly, randomizations can be performed by using:

```{r, echo=FALSE}
cpoPairWise(m, null.model=TRUE, rand=999)
cpoResults
```

The CPO package exhibits versatility in handling structured datasets, accommodating species from various groups, samples collected from distinct sites, and data spanning different sampling periods. This flexibility enables users to compare species cooccurrence patterns across diverse categories such as species groups, sampling sites, and temporal intervals.

To leverage this functionality, utilize the 'cpoPairWisePerGroup()' function. The numeric matrix 'm' should represent species presences and absences, while labels for time, sites, and species groups are specified using the parameters 'time,' 'site,' and 'spp.group,' respectively. To exemplify, consider synthetic datasets, including labels for sampling sites and times ('LabsDataset.csv'), as well as a dataset denoting species groups ('SpeciesGroupsDataset.csv'). The example below demonstrates the application of the function:

```{r, echo=FALSE}
occu <- read.csv('OccurrenceDataset.csv')
occu <- as.matrix(occu)

lab <- read.csv('LabsDataset.csv')

spGroups <- read.csv('SpeciesGroupsDataset.csv')


cpoResults <- cpoPairWisePerGroup(m = occu, 
                                time = lab$Time,   
                                site = lab$Sites, 
                                spp.group = spGroups$Group,
                                occurrence.tresh = 0)
```

This function facilitates the comparative analysis of cooccurrence patterns, allowing users to discern potential variations across specified categories, contributing to a more comprehensive understanding of ecological dynamics.

