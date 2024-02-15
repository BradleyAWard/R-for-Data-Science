## 2) Workflow: Basics

We shall set a solid foundation for running R code.

---

### Coding Basics

You can create new objects with the assignment operator <-. This stores a value but not printed. If you want to view the value, type the variable name in the console. You can combine multiple elements into a vector with $\texttt{c()}$. Basic arithmetic on vectors is applied to every element of the vector. You will make lots of assignments, and <- is a pain to type. You can save time with RStudio's keyboard shortcut: Alt -. R will ignore any text after # for that line. This allows you to write *comments*, text that is ignored by R but read by humans. 

```r
# Code 1
# Create a vector of primes
primes <- c(2, 3, 5, 7, 11, 13)

# Multiply by 2
primes * 2

# Subtract 1
primes - 1
```

```output
[1]  4  6 10 14 22 26
[1]  1  2  4  6 10 12
```

Use comments to explain the *why* of your code, not the *how* or the *what*. The *what* and *how* of your code are always possible to figure out, even if it might be tedious. Figuring out *why* something was done is much more difficult. For data analysis code, use comments to explain your overall plan of attack and record important insights as you encounter them. This knowledge cannot be recaptured from the code itself.

Object names must start with a letter and can contain only letters, numbers, _, and .. You want your object names to be descriptive, so you will need to adopt a convention. There are different types of convention including $\texttt{snake\_case\_convention}$, $\texttt{camelCaseConvention}$ and $\texttt{period.convention}$.