--MARGINE_ARTICOLO
SELECT        
	TOP (100) PERCENT COD_ARTI, MARGINE_TEORICO AS MARGINE_TOT_VENDITE
FROM            
	ARTICOLO_MARGINE_TEORICO_RAGRUPPATO_PER_CALCOLO_ABC
ORDER BY MARGINE_TOT_VENDITE DESC