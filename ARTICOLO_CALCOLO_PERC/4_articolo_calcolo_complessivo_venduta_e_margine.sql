--articolo_calcolo_complessivo_venduta_e_margine
SELECT        
	COD_ARTI, SUM(VENDITA_MEDIA) AS vendita_totale, SUM([MARGINE MEDIO]) AS margine_totale, SUM([QTA VENDITA]) AS qta_totale
FROM            
	articolo_margine_e_qta_complessivo_per_calcolo_percentuale
GROUP BY COD_ARTI