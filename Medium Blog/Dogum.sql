/* Formatted on 12/10/2023 2:05:57 AM (QP5 v5.388) */
SELECT TO_CHAR (PP.DATE_OF_BIRTH, 'dd.mm.yyyy')     AS BIRTH_DATE,
       PP.TOWN_OF_BIRTH
  FROM PER_PERSONS PP, per_all_people_f papf
 WHERE     TRUNC (SYSDATE) BETWEEN PAPF.EFFECTIVE_START_DATE
                               AND PAPF.EFFECTIVE_END_DATE
       AND PAPF.PERSON_ID = PP.PERSON_ID