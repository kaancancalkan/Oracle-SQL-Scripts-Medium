/* Formatted on 12/10/2023 1:56:40 AM (QP5 v5.388) */
SELECT (SELECT flvg.meaning
         FROM FND_LOOKUP_VALUES FLVG
        WHERE     flvg.lookup_type = 'SEX'
              AND flvg.language = 'TR'
              AND flvg.lookup_code = pplf.sex)    AS GENDER
  FROM PER_PEOPLE_LEGISLATIVE_F PPLF,
       PER_ALL_PEOPLE_F PAPF
 WHERE     TRUNC (SYSDATE) BETWEEN PAPF.EFFECTIVE_START_DATE
                               AND PAPF.EFFECTIVE_END_DATE
       AND TRUNC (SYSDATE) BETWEEN PPLF.EFFECTIVE_START_DATE
                               AND PPLF.EFFECTIVE_END_DATE
       AND PAPF.PERSON_ID = PPLF.PERSON_ID
       AND PPLF.LEGISLATION_CODE = 'TR'