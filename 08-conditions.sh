#!bin/bash

# -gt = > , -lt = < , -eq = = , -ge = >= , -le = <=
NUMBER1=$1

if [$NUMBER -gt 100]
  then
    echo "given number is greater than 100"
else
  echo "given number is less than 100"
fi