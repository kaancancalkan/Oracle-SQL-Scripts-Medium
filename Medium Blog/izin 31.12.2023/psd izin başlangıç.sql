/* Formatted on 1/1/2024 7:07:12 PM (QP5 v5.388) */
SELECT TO_CHAR (psd.SENIORITY_DATE, 'DD.MM.YYYY') Izýn_Baslangýc_Tarihi
  FROM PER_SENIORITY_DATES_F psd, per_all_people_f papf
 WHERE     TRUNC (SYSDATE) BETWEEN PAPF.EFFECTIVE_START_DATE
                               AND PAPF.EFFECTIVE_END_DATE
       AND psd.SENIORITY_DATE_CODE = 'IZIN_HAK_TAR'
       AND papf.person_id = psd.person_id