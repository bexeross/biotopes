# biotopes
Developing a script to classify biotopes from the whole MAREANO dataset using TWINSPAN in R. May try another method in due course but need to test if the current method is adequately scalable when done in R.

Current workflow 08.11.21 (still in flux):

1. run config to set up saving spaces and functions
2. run data prep: clean names and ensure have the right dataset pooled
3. format data and run twinspan: filter out stations that have too few observations for their length, samples that are too short or too poor vis {other filters?} and get data into the right format to then run twinspan
4. explore results: make shapefile with all cutlevels for spatial exploration, output heatmap/dendro pairing to identify first guess at appropriate groupings == provisional biotopes/pBiotopes(look for clumps in heatmap that relate to sample groupings)
5. make data summaries for: first pBiotopes, a few levels below to check if need splitting (you can also use the "select" version of these scripts to only look at one pBiotope n in more detail if you are likely to have too much data to look at with multiple).

To come:
- data summaries could include list of most abundant species (>1 pseudospp on average), list of unique species (not in another pBiotope)
- turnover measures - need to know how many species are shared in common between pBiotopes
- av/min/max environmental characters per pBiotope (done for KR but not for mega analysis)
