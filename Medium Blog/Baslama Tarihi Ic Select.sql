SELECT   TO_CHAR (PPOS.DATE_START, 'dd.mm.yyyy')     AS START_DATE
FROM (SELECT *
            FROM PER_PERIODS_OF_SERVICE a
           WHERE     a.primarY_flag = 'Y'
                 AND A.PERIOD_OF_SERVICE_ID =
                     (SELECT MAX (B.PERIOD_OF_SERVICE_ID)
                       FROM PER_PERIODS_OF_SERVICE B
                      WHERE B.primary_flag = 'Y' AND A.PERSON_ID = B.PERSON_ID))
         PPOS, PER_ALL_ASSIGNMENTS_M PAAM
         WHERE
             TRUNC (SYSDATE) BETWEEN PAAM.EFFECTIVE_START_DATE
                                 AND PAAM.EFFECTIVE_END_DATE
         AND PAAM.PERIOD_OF_SERVICE_ID = PPOS.PERIOD_OF_SERVICE_ID
         AND PPOS.PRIMARY_FLAG = 'Y'