for var in 50 100 250;
#for var in 500 1000;
do
   for Di in 0.4 0.04;
   do
   	echo "wfg"
      for nobj in 2 3;
      do
         for i in {1..9};
         do
           ./distances_wfg \"\"../VSD-MOEA/POS/POS_VSD-MOEA_WFG${i}_RUN_*nvar_${var}_nobj_${nobj}*${Di}*\"\" 11 100 ${var} > dist_wfg${i}_${nobj}_${Di}_${var} &
           ./variance_wfg \"\"../VSD-MOEA/POS/POS_VSD-MOEA_WFG${i}_RUN_*nvar_${var}_nobj_${nobj}*${Di}*\"\" 11 100 ${var} > var_wfg${i}_${nobj}_${Di}_${var}  &
           ./expectation_wfg \"\"../VSD-MOEA/POS/POS_VSD-MOEA_WFG${i}_RUN_*nvar_${var}_nobj_${nobj}*${Di}*\"\" 11 100 ${var} > E_wfg${i}_${nobj}_${Di}_${var}  &
         done
         wait
      done
   	echo "uf"
      for i in {1..7};
      do
        ./distances \"\"../VSD-MOEA/POS/POS_VSD-MOEA_UF${i}_RUN_*nvar_${var}_nobj_2*${Di}*\"\" 11 100 ${var} > dist_uf${i}_2_${Di}_${var} &
        ./variance \"\"../VSD-MOEA/POS/POS_VSD-MOEA_UF${i}_RUN_*nvar_${var}_nobj_2*${Di}*\"\" 11 100 ${var} > var_uf${i}_2_${Di}_${var} &
        ./expectation \"\"../VSD-MOEA/POS/POS_VSD-MOEA_UF${i}_RUN_*nvar_${var}_nobj_2*${Di}*\"\" 11 100 ${var} > E_uf${i}_2_${Di}_${var} &
      done
   
   	echo "uf"
     for i in {8..10};
     do
        ./distances \"\"../VSD-MOEA/POS/POS_VSD-MOEA_UF${i}_RUN_*nvar_${var}_nobj_3*${Di}*\"\" 11 100 ${var} > dist_uf${i}_3_${Di}_${var} &
        ./variance \"\"../VSD-MOEA/POS/POS_VSD-MOEA_UF${i}_RUN_*nvar_${var}_nobj_3*${Di}*\"\" 11 100 ${var} > var_uf${i}_3_${Di}_${var} &
        ./expectation \"\"../VSD-MOEA/POS/POS_VSD-MOEA_UF${i}_RUN_*nvar_${var}_nobj_3*${Di}*\"\" 11 100 ${var} > E_uf${i}_3_${Di}_${var} &
     done
     wait
   
   	echo "dtlz"
     for i in {2..6};
     do
        ./distances \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ${i}_RUN_*nvar_${var}_nobj_2*${Di}*\"\" 11 100 ${var} > dist_dtlz${i}_2_${Di}_${var} &
        ./variance \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ${i}_RUN_*nvar_${var}_nobj_2*${Di}*\"\" 11 100 ${var} > var_dtlz${i}_2_${Di}_${var} &
        ./expectation \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ${i}_RUN_*nvar_${var}_nobj_2*${Di}*\"\" 11 100 ${var} > E_dtlz${i}_2_${Di}_${var} &
     done
     wait
   
   	echo "dtlz"
     for i in {2..6};
     do
        ./distances \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ${i}_RUN_*nobj_3*${Di}*\"\" 11 100 ${var} > dist_dtlz${i}_3_${Di}_${var} &
        ./variance \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ${i}_RUN_*nobj_3*${Di}*\"\" 11 100 ${var} > var_dtlz${i}_3_${Di}_${var} &
        ./expectation \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ${i}_RUN_*nobj_3*${Di}*\"\" 11 100 ${var} > E_dtlz${i}_3_${Di}_${var} &
     done
     wait
   
   	echo "dtlz"
   
     ./distances \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ1_RUN_*nobj_2*${Di}*\"\" 11 100 ${var} > dist_dtlz1_2_${Di}_${var} &
     ./variance \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ1_RUN_*nobj_2*${Di}*\"\" 11 100 ${var} > var_dtlz1_2_${Di}_${var} & 
     ./expectation \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ1_RUN_*nobj_2*${Di}*\"\" 11 100 ${var} > E_dtlz1_2_${Di}_${var} &
   
     ./distances \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ1_RUN_*nobj_3*${Di}*\"\" 11 100 ${var} > dist_dtlz1_3_${Di}_${var} &
     ./variance \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ1_RUN_*nobj_3*${Di}*\"\" 11 100 ${var} > var_dtlz1_3_${Di}_${var} &
     ./expectation \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ1_RUN_*nobj_3*${Di}*\"\" 11 100 ${var} > E_dtlz1_3_${Di}_${var} &
   
     ./distances \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ7_RUN_*nobj_2*${Di}*\"\" 11 100 ${var} > dist_dtlz7_2_${Di}_${var} &
     ./variance \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ7_RUN_*nobj_2*${Di}*\"\" 11 100 ${var} > var_dtlz7_2_${Di}_${var} &
     ./expectation \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ7_RUN_*nobj_2*${Di}*\"\" 11 100 ${var} > E_dtlz7_2_${Di}_${var} & 
   
     ./distances \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ7_RUN_*nobj_3*${Di}*\"\" 11 100 ${var} > dist_dtlz7_3_${Di}_${var} &
     ./variance \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ7_RUN_*nobj_3*${Di}*\"\" 11 100 ${var} > var_dtlz7_3_${Di}_${var} &
     ./expectation \"\"../VSD-MOEA/POS/POS_VSD-MOEA_DTLZ7_RUN_*nobj_3*${Di}*\"\" 11 100 ${var} > E_dtlz7_3_${Di}_${var} &
     wait
   done
done
