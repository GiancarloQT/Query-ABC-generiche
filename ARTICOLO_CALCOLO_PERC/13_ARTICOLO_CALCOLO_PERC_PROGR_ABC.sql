--ARTICOLO_CALCOLO_PERC_PROGR_ABC
SELECT        
	COD_ARTI, Progr, CASE WHEN (Progr < 80) THEN 'A' WHEN (Progr >= 80 AND Progr < 95) THEN 'B' ELSE 'C' END AS ABC, PERC
FROM            
    v_articoloCalcoloPercABC