# convert-dinamo-to-meme
Use regular expressions to convert the motifs output by DiNAMO into true MEME motif format!

[DiNAMO](https://github.com/bonsai-team/DiNAMO) is a relatively new and wonderful motif-finding algorithm. It's super easy to use, but outputs its results in a pseudo-MEME motif format that is not compatible with MEME suite tools (the most popular tools for motif analysis). This script uses simple regular expressions to convert the DiNAMO output into a true MEME format that is compatible with MEME v5.1.1 software.

## IMPORTANT NOTE

This script will automatically assign a site count of 1 and an e-value of zero to all DiNAMO motifs in the input file. This isn't a huge deal as long as your MEME tools aren't filtering input motifs by their e-value (most don't) and you have direct control over the pseudocounts applied to the MEME motif matricies, which you can do from the command line version of MEME. In most cases, these placeholder values shouldn't affect your results.

## USAGE

The script has three required arguments -i, -o, and -l. -i will be the name of the file containing DiNAMO-formatted motifs, -o denotes the name you want for the output file containing MEME-motif formats, and -l denotes the length/width of the motifs in the DiNAMO output file. The current version of DiNAMO only outputs motifs of a given length, so this value should be the same for every motif in the file. For example:

`./dinamo_to_meme.bash -i example.dinamo.txt -o example.meme.txt -l 7`

Will convert the example.dinamo file in this repository into MEME motif format and save the results to example.meme. This file can then be directly uploaded to any of the online [MEME suite tools](http://meme-suite.org/index.html) or input into the command line versions of the MEME tools.

The DiNAMO-formatted file can contain an arbitrary number of motifs, even just one!

To execute this script on a batch of dinamo files (file1, file2, ... etc.):

```
for file in file1, file2, file3, ...
  do
    ./dinamo_to_meme.bash -i $file -o "$file.meme" -l <some integer>
  done
```

## DEPENDENCIES

None! As long as your system can use `sed`, this script should work. I tested this script using DiNAMO v1.0 and MEME v5.1.1 on an Ubuntu terminal (linux subsystem of a Windows PC).
