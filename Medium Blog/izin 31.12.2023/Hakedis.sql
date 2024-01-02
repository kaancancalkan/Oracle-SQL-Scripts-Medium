/* Formatted on 12/31/2023 6:46:00 PM (QP5 v5.388) */
SELECT TL.NAME       IZIN_PLANI,
       DTL.VALUE     DURATION,
       DTL.PROCD_DATE,
       DTL.TYPE,
       DTL.PERSON_ID,
       DTL.ASSIGMENT_ID
  FROM ANC_PER_ACRL_ENTRY_DTLS  DTL,
       ANC_PER_PLAN_ENROLLMENT  ENR,
       ANC_ABSENCE_PLANS_F_TL   TL
 WHERE     1 = 1
       AND DTL.TYPE = 'FLDR'
       AND DTL.PER_PLAN_ENRT_ID = ENR.PER_PLAN_ENRT_ID
       AND TRUNC (SYSDATE) BETWEEN ENR.ENRT_ST_DT AND ENR.ENRT_END_DT
       AND ENR.STATUS = 'A'
       AND DTL.PL_ID = TL.ABSENCE_PLAN_ID
       AND TL.LANGUAGE = 'TR'
       AND TRUNC (SYSDATE) BETWEEN TL.EFFECTIVE_START_DATE
                               AND TL.EFFECTIVE_END_DATE
       AND DTL.PERSON_ID = 300000436489700
       AND TL.NAME = 'Y�ll�k �zin Plan�'
       AND DTL.VALUE <> 0