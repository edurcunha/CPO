# CPO
## Corrected Proportion of Occurrences (CPO) between species

This tool calculates the corrected cooccurrence index (CPO) between pairs of species. CPO considers that the number of cooccurrence between two species is affected by how commmon a species is (how many times they appear among samples), and propose an ajusted metric for measuring the degree wich two species occur with each other. The CPO index is obtained from a collection of ecological samples and is calculated as:

CPO<sub>it</sub> = n<sub>it</sub> / ( n<sub>i</sub> * ( n<sub>t</sub> / N ) )

where ni is the total number of samples where species i occurred, and nj is the total number of samples where species j cooccurred; nij is the number of samples where species i cooccurred together with species j, and N is the total number of samples. The CPO<sub>it</sub> = n<sub>it</sub> indicates whether species i co-occurred more (CPO<sub>it</sub> = n<sub>it</sub> > 1) or less (CPO<sub>it</sub> = n<sub>it</sub> < 1) than expected by chance (CPO<sub>it</sub> = n<sub>it</sub> = 1) with species j.


Data entry is collection of samples (numeric matrix), with samples a rows and species as columns. For a single pair of species, the tool calculates the CPO value and, optionally, returns a distribution of iteratively randomized occurrences of species among samples (generally used to obtain the probability which the observed index differ from random). Multiple species are also allowed as entry data, and, in this case, the tool calculates the index for each pair of species