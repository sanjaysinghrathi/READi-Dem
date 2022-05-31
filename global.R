if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
#BiocManager::install(version = "3.12")

if (!requireNamespace("dplyr", quietly = TRUE)){
  BiocManager::install("dplyr")}
library(dplyr)

if (!requireNamespace("stringr", quietly = TRUE)){
  BiocManager::install("stringr")}
library(stringr)

if (!requireNamespace("ggplot2", quietly = TRUE)){
  BiocManager::install("ggplot2")}
library(ggplot2)

if (!requireNamespace("jsonlite", quietly = TRUE)){
  BiocManager::install("jsonlite")}
library(jsonlite)     # flexible, robust, high performance tools for working with JSON in R

if (!requireNamespace("stringi", quietly = TRUE)){
  BiocManager::install("stringi")}
library(stringi)      # Character String Processing Facilities

if (!requireNamespace("stringr", quietly = TRUE)){
  BiocManager::install("stringr")}
library(stringr)

if (!requireNamespace("readxl", quietly = TRUE)){
  BiocManager::install("readxl")}
library(readxl)

if (!requireNamespace("shinycssloaders", quietly = TRUE)){
  BiocManager::install("shinycssloaders")}
library(shinycssloaders)

if (!requireNamespace("doMC", quietly = TRUE)){
  BiocManager::install("doMC")}
require(doMC)
registerDoMC(cores=64)
detectCores(all.tests = FALSE, logical = TRUE)

if (!requireNamespace("parallel", quietly = TRUE)){
  BiocManager::install("parallel")}
library(parallel)
numCores <- detectCores()
numCores

if (!requireNamespace("doParallel", quietly = TRUE)){
  BiocManager::install("doParallel")}
library(doParallel)

if (!requireNamespace("tidyverse", quietly = TRUE)){
  BiocManager::install("tidyverse")}
library(tidyverse)

if (!requireNamespace("tokenizers", quietly = TRUE)){
  BiocManager::install("tokenizers")}
library(tokenizers)

if (!requireNamespace("udpipe", quietly = TRUE)){
  BiocManager::install("udpipe")}
library(udpipe)

if (!requireNamespace("textrank", quietly = TRUE)){
  BiocManager::install("textrank")}
library(textrank)

load("functions.RData")
load("TrainingModel.RData")


