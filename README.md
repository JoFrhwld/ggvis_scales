# I can't get the scales to work


## Basic problem

I want a checkboxGroupInput to select a subset of data, and then plot it on a ggvis plot.
The problem is that if I map features of the data to a property, like fill or shape, the scale re-updates every time a new box is ticked, so that the mappings aren't consistent across different subsets.

## Attempted solution

Hardcode a mapping of data to the range of a scale using reactive elements.

## Continued problem

I keep getting errors, and I don't understand why.

## Branches

- master branch = basic scales
- fixed_scales = one approach, that doesn't work
- fixed_scales2 = another approach, that also doesn't work

I'll update the master branch with a solution if I get one.

