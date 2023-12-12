(SELECT PAPF2.PERSON_NUMBER
          FROM per_assignment_supervisors_f pasf, PER_ALL_PEOPLE_F PAPF2
         WHERE     TRUNC (SYSDATE) BETWEEN pasf.EFFECTiVE_START_DATE
                                       AND pasf.effective_end_date
               AND pasf.assignment_id = paam.assignment_id
               AND TRUNC (SYSDATE) BETWEEN PAPF2.effective_start_date
                                       AND pAPF2.effective_end_date
               AND pasf.manager_id = PAPF2.person_id
               AND pasf.primary_flag = 'Y'
               AND pasf.MANAGER_TYPE = 'LINE_MANAGER')
           LINE_MANAGER_PERSON_ID,