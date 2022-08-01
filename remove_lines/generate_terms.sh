#!/bin/sh
#
# remove lines / generate terms script v0.1
# 
# regenerate kw list from pattern files
#
# **NOTE:** every pattern file must end with a blank newline.


cat patterns/locations/*.txt >> stopwords.txt & cat patterns/*.txt >> stopwords.txt