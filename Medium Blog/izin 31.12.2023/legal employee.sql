/* Formatted on 1/1/2024 6:37:14 PM (QP5 v5.388) */
SELECT org.name legal_employer 
       
from
per_all_assignments_m paam,
 hr_organization_units          org

where 

 org.organization_id = paam.legal_entity_id
       AND TRUNC (SYSDATE) BETWEEN org.date_from AND org.date_to
       AND PAAM.ASSIGNMENT_TYPE IN ('E', 'C')
       AND PAAM.ASSIGNMENT_STATUS_TYPE = 'ACTIVE'
       and paam.primary_flag = 'Y'
       AND org.organization_id = paam.legal_entity_id