# Spatial Kriging

## Introduction
Spatial kriging is a geostatistical method used to estimate values at unobserved locations based on a set of observed values at nearby locations.

This technique is often used in spatial analysis, environmental monitoring, and geology, among other fields. 

In this example, we demonstrate how to implement spatial kriging in R and apply it to a dataset from the Alaska Department of Fish and Game shrimp surveys in the vicinity of Kodiak Island, Alaska.

## Dataset
The dataset that can be used in this example is the Alaska Department of Fish and Game shrimp surveys in the vicinity of Kodiak Island, Alaska. The dataset contains information on shrimp abundance, size distribution, and other biological and environmental factors. We will use this dataset to estimate shrimp abundance at unobserved locations using spatial kriging.

## Formulas

Spatial kriging involves computing a set of weights that describe the spatial correlation between observed values and unobserved values. The weights are typically computed using a covariance function, which describes how the correlation between two points decreases as the distance between them increases. The most commonly used covariance function in spatial kriging is the exponential covariance function, which is defined as:

```shell
C(h) = exp(-(h / a)^2)
```
where ```C(h)``` is the covariance between two points separated by a distance ```h```, and a is a parameter that controls the rate at which the covariance decreases with distance.

Once the weights have been computed, they are used to interpolate the values at unobserved locations. The estimated value at a point s is given by:

```shell
Z(s) = sum(w(i) * Z(i))
```

where ```w(i)``` is the weight assigned to the observed value at point ```i```, and ```Z(i)``` is the observed value at point ```i```.

## Code
The R code provided demonstrates how to implement spatial kriging using a simulated dataset. 
The code first defines a matrix ```G``` and finds its inverse using the solve() function.

It then defines a vector ```h``` and computes
```G^-1 * h```. Next, it defines two vectors ```y``` and ```a```, and computes 
```shell
a[1:2] %*% y
```

The code then simulates a spatial log Gaussian process using the 
```rmvnorm()``` function and plots the resulting contour map using the ```contour()``` function. Finally, it generates many realizations of the process and plots them using the same ```contour()``` function.

***To apply spatial kriging to the Alaska Department of Fish and Game shrimp surveys dataset, the code would need to be modified to read in the dataset and compute the weights and estimated values at unobserved locations. This would involve computing the covariance function using the observed values and distances between them, and then solving a system of equations to compute the weights. The estimated values at unobserved locations could then be computed using the weights and observed values.***

## Results

### Single Realization

![Spatial Realization Single](https://github.com/Diem0n/Sampling-With-R/blob/main/Spatial_Sampling/results/SpatialLogSingleRealization.png?raw=true)


### Multiple Realization

![Spatial Realization Mutltiple](https://github.com/Diem0n/Sampling-With-R/blob/main/Spatial_Sampling/results/SpatialLogMultipleRealization.png?raw=true)



