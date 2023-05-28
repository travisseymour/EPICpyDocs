# EPICpy Statistics Facility

Python has a rich set of modules and packages for statistical analysis and graphing. Because EPICpy includes the [Pingouin Statistical Package](https://pingouin-stats.org/), device programmers have access to the following facilities (see Pingouin docs for other imported packages):

* [pingouin](https://pingouin-stats.org/)
* [statsmodels](https://www.statsmodels.org/)
* [pandas](https://pandas.pydata.org/)
* [pandas-flavor](https://github.com/Zsailer/pandas_flavor)
* [numpy](https://numpy.org/)
* [scipy](https://www.scipy.org/)
* [matplotlib](https://matplotlib.org/)
* [seaborn](https://seaborn.pydata.org/)

Access to these packages in device code is enabled through standard Python import statements. Display of statistical analyses and graphs is enabled by using the `stats_write()` method which can accept text, pandas dataframes and other objects, as well as figures and other matplotlib-based objects.

Although we don't recommend programming full data analyses at the end of each simulation run, this statistical facility will allow most conceivable post-run analyses a modeler might need.