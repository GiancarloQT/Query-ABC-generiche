--ARTICOLO_MARGINE_TEORICO_RAGRUPPATO_PER_CALCOLO_ABC
SELECT        
	COD_ARTI, SUM(margine_teorico) AS MARGINE_TEORICO
FROM            
	ARTICOLI_SCHEDA_ARTICOLI
GROUP BY COD_ARTI