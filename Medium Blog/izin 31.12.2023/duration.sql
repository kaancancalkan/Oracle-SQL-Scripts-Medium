SELECT SUM(DTL.VALUE)
FROM ANC_per_ACRL_ENTRY_DTLS DTL,
     ANC_PER_PLAN_ENROLLMENT ENR,
     ANC_ABSENCE_PLANS_F_TL TL
     WHERE 
     DTL.TYPE = 'ABS'
     AND DTL.PER_PLAN_ENTR_ID = ENR.PER_PLAN_ENTR_ID
     AND TRUNC (SYSDATE) BETWEEN ENR.ENRT_ST_DT AND ENR.ENRT_END_DT
     AND ENR.STATUS = 'A'
     AND DTL.PL_ID = TL.ABSENCE_PLAN_ID
     AND TL.LANGUAGE = 'TR'
     AND TRUNC (SYSDATE) BETWEEN TL.EFFECTIVE_START_DATE AND TL.EFFECTIVE_END_DATE
     AND DTL.PER_ABSENCE_ENTRY_ID = ANC.PER_ABSENCE_ENTRY_ID
     AND TL.NAME = 'Y�ll�k �zin Plan�'
     and dtl.value <> 0