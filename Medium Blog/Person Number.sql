SELECT  PAPF.PERSON_NUMBER FROM PER_ALL_PEOPLE_F  PAPF
WHERE  TRUNC (SYSDATE) BETWEEN PAPF.EFFECTIVE_START_DATE
                                 AND PAPF.EFFECTIVE_END_DATE