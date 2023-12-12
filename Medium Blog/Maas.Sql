SELECT CS.SALARY_AMOUNT,
         CS.CURRENCY_CODE FROM (SELECT *
            FROM CMP_SALARY a
           WHERE A.SALARY_ID = (SELECT MAX (B.SALARY_ID)
                                  FROM CMP_SALARY B
                                 WHERE A.PERSON_ID = B.PERSON_ID)) CS,
                                 PER_ALL_PEOPLE_F PAPF
                              
                                 WHERE TRUNC (SYSDATE) BETWEEN PAPF.EFFECTIVE_START_DATE
                                 AND PAPF.EFFECTIVE_END_DATE 
                                 
                                 AND PAPF.PERSON_ID = CS.PERSON_ID
                                 