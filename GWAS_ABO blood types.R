###################################
### GWAS on ABO blood types ###
###
### author: Mengqiao Wang, Ph.D.
### updated: November 6, 2020
###################################

library(nnet)


## binomial models
# ABO blood types are treated as a binary trait respectively: e.g. O vs. non-O (A, B, and AB combined)

# phenotype: "O", "non-O" (2 levels, with non-O set as the reference) 
# . : independent variables, including 1). genotype, 2). covariates (age, sex etc.)* 3). principal components (e.g. PC1 + ... + P10) 
# * : for GWAS on ABO blood types, it is not necessary to adjust for age and sex as the phenotype is indepedent of these factors.

bin_model <- summary(glm(phenotype ~ . , data = dat_gwas, family = "binomial"))

# estimates
bin_model$coefficients["snp", ]



## multinomial models
# ABO blood types are treated as a quartenary trait: O, A, B, and AB

# phenotype: "O", "A", "B", "AB" (4 levels, with O set as the reference) 
# . : independent variables, including 1). genotype, 2). covariates (age, sex etc.)* 3). principal components (e.g. PC1 + ... + P10) 
# * : for GWAS on ABO blood types, it is not necessary to adjust for age and sex as the phenotype is indepedent of these factors.

mul_model <- summary(multinom(phenotype ~ . , data = dat_gwas))

# estimates
mul_model$coefficients[, "snp"]
mul_model$standard.errors[, "snp"]


### END