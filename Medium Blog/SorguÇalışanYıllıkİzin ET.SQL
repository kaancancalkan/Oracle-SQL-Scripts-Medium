SELECT (SELECT PAAM1.ASSIGNMENT_NUMBER
            FROM PER_ALL_ASSIGNMENTS_M PAAM1
           WHERE     PAAM1.ASSIGNMENT_TYPE = 'ET'
                 AND PAAM1.ASSIGNMENT_STATUS_TYPE = 'ACTIVE'
                 AND TRUNC (SYSDATE) BETWEEN paam1.effective_start_date
                                         AND paam1.EFFECTIVE_END_DATE
                 AND PAPF.PERSON_ID = PAAM1.PERSON_ID)    ASG_NUM,
         papf.PERSON_NUMBER,
         TO_CHAR (anc.START_DATE, 'dd.mm.yyyy')           absence_date,
         anc.START_TIME                                   START_TIME,
         hou.name 
                                                 legal_emp,
                                                 
         anc.per_absence_entry_id
    FROM per_all_people_f      papf,
      
         per_all_assignments_m paam,
         HR_ORGANIZATION_UNITS hou,
         ANC_ABSENCE_TYPES_F_TL TL,
         (SELECT *
            FROM PER_PERIODS_OF_SERVICE a
           WHERE     a.primarY_flag = 'Y'
                 AND A.PERIOD_OF_SERVICE_ID =
                     (SELECT MAX (B.PERIOD_OF_SERVICE_ID)
                        FROM PER_PERIODS_OF_SERVICE B
                       WHERE B.primary_flag = 'Y' AND A.PERSON_ID = B.PERSON_ID))
         PPOS,
         ANC_PER_ABS_ENTRIES   anc
   WHERE     papf.person_id = paam.person_id
         AND TRUNC (SYSDATE) BETWEEN papf.effective_start_date
                                 AND PAPF.EFFECTIVE_END_DATE
         AND TRUNC (SYSDATE) BETWEEN paam.effective_start_date
                                 AND paam.EFFECTIVE_END_DATE
         AND PAAM.ASSIGNMENT_TYPE IN ('E', 'C')
         AND PAAM.ASSIGNMENT_STATUS_TYPE = 'ACTIVE'
         AND PAAM.EFFECTIVE_LATEST_CHANGE = 'Y'
         AND PAAM.PRIMARY_FLAG = 'Y'
         AND ppos.period_of_service_id = paam.period_of_service_id
         AND ppos.primary_flag = 'Y'
         AND TO_CHAR (PPOS.DATE_START, 'YYYY') = '2023'
         AND TL.ABSENCE_TYPE_ID = ANC.ABSENCE_TYPE_ID
         AND TL.LANGUAGE = 'US'
         AND TRUNC (SYSDATE) BETWEEN TL.EFFECTIVE_START_DATE
                                 AND TL.EFFECTIVE_END_DATE
         AND TL.NAME LIKE '%Annual%'
         AND anc.person_id = papf.person_id
         AND anc.start_date >= ppos.date_start
         AND ANC.ABSENCE_STATUS_CD = 'SUBMITTED'
         AND ANC.APPROVAL_STATUS_CD = 'APPROVED'
         AND Paam.legal_entity_id = HOU.ORGANIZATION_ID
ORDER BY anc.start_date ASC