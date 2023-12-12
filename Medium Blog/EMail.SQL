(SELECT PEA.EMAIL_ADDRESS
            FROM PER_EMAIL_ADDRESSES PEA
           WHERE     PEA.DATE_FROM <= SYSDATE
                 AND NVL (PEA.DATE_TO, SYSDATE + 1) > SYSDATE
                 AND PEA.PERSON_ID = papf.PERSON_ID
                 AND PEA.EMAIL_TYPE IN ('W1', 'H1')
                 AND PEA.EMAIL_ADDRESS_ID =
                     (SELECT MAX (PEA2.EMAIL_ADDRESS_ID)
                        FROM PER_EMAIL_ADDRESSES PEA2
                       WHERE     PEA2.DATE_FROM <= SYSDATE
                             AND NVL (PEA2.DATE_TO, SYSDATE + 1) > SYSDATE
                             AND PEA2.EMAIL_TYPE IN ('W1', 'H1')
                             AND PEA2.PERSON_ID = PEA.PERSON_ID) )
           