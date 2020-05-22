PATH1=../POF
for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7
do
   for sed in {1..35}   
   do
   tail -100 $PATH1/POF_MOEAD_${instance}_RUN${sed}_seed*_nobj_2* > POF/${instance}_2_${sed}
   done
done
for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10
do
   for sed in {1..35}   
   do
   tail -100 $PATH1/POF_MOEAD_${instance}_RUN${sed}_seed*_nobj_3* > POF/${instance}_3_${sed}
   done
done

#PATH1=../r2-moea-general/
#
#for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7
#do
#   for sed in {1..35}
#   do
#   cat $PATH1/${instance}_2_${sed}_*[!R] | tail -100 > R2-EMOA/${instance}_2_${sed}
#   done
#done
#for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10
#do
#   for sed in {1..35}
#   do
#   cat $PATH1/${instance}_3_${sed}_*[!R] | tail -100 > R2-EMOA/${instance}_3_${sed}
#   done
#done

#PATH1=/home/joel.chacon/tmp/vsd-moea-d-public-scalability/POF
#for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7
#do
#   for sed in {1..35}
#   do
#   tail -100 $PATH1/POF_MOEAD_${instance}_RUN${sed}_seed_*nobj_2* | cut -f1,3 -d' '  > VSD-MOEA-D/${instance}_2_${sed}
#   done
#done
#for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10
#do
#   for sed in {1..35}
#   do
#   tail -100 $PATH1/POF_MOEAD_${instance}_RUN${sed}_seed_*nobj_3* | cut -f1,3,5 -d' '  > VSD-MOEA-D/${instance}_3_${sed}
#   done
#done

#PATH1=../nsgaii-general
#
#   for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 UF1 UF2 UF3 UF4 UF5 UF6 UF7 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
#   do
#      for sed in {1..35}
#      do
#      cat $PATH1/OBJ_NSGAII_SBX_POLYNOMIAL_EVALUATIONS_*_${instance}_SEED_${sed}_2.txt | tail -100 > NSGA-II/${instance}_2_${sed}
#      done
#   done
#   for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 UF8 UF9 UF10 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
#   do
#      for sed in {1..35}
#      do
#      cat $PATH1/OBJ_NSGAII_SBX_POLYNOMIAL_EVALUATIONS_*_${instance}_SEED_${sed}_3.txt | tail -100 > NSGA-II/${instance}_3_${sed}
#      done
#   done
#
#PATH1=../nsgaiii-general
#
#   for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 UF1 UF2 UF3 UF4 UF5 UF6 UF7 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
#   do
#      for sed in {1..35}
#      do
#      cat $PATH1/OBJ_NSGAIII_SBX_*_${instance}_SEED_${sed}_2_vars* | tail -100 > NSGA-III/${instance}_2_${sed}
#      done
#   done
#   for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 UF8 UF9 UF10 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
#   do
#      for sed in {1..35}
#      do
#      cat $PATH1/OBJ_NSGAIII_SBX_*_${instance}_SEED_${sed}_3_vars* | tail -100 > NSGA-III/${instance}_3_${sed}
#      done
#   done

