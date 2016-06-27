--ARTICOLI_SCHEDA_ARTICOLI
SELECT        
	TOP (100) PERCENT ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.DISTRIB, ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.COD_ARTI, 
    ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.VENDITA_MEDIA, ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.[MARGINE MEDIO], 
    articolo_calcolo_complessivo_venduta_e_margine.vendita_totale, 
    ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.VENDITA_MEDIA / articolo_calcolo_complessivo_venduta_e_margine.vendita_totale AS perc_vendita, 
    ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.[MARGINE MEDIO] / ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.VENDITA_MEDIA AS margine_perc_ok, 
    ULTIMI_TRE_MESI.ULTIMI_TRE_MESI, ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.[MARGINE MEDIO] * ((ULTIMI_TRE_MESI.ULTIMI_TRE_MESI * 12) 
    * (1 - ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.[QTA VENDITA] / articolo_calcolo_complessivo_venduta_e_margine.qta_totale)) AS margine_teorico, 
    ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.[QTA VENDITA] / articolo_calcolo_complessivo_venduta_e_margine.qta_totale AS perc_qta
FROM            
	ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI INNER JOIN
    articolo_calcolo_complessivo_venduta_e_margine ON 
    ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.COD_ARTI = articolo_calcolo_complessivo_venduta_e_margine.COD_ARTI LEFT OUTER JOIN
    ULTIMI_TRE_MESI ON ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.COD_ARTI = ULTIMI_TRE_MESI.CKY_ART
WHERE        
	(articolo_calcolo_complessivo_venduta_e_margine.vendita_totale <> 0) AND (articolo_calcolo_complessivo_venduta_e_margine.qta_totale <> 0) AND 
    (articolo_calcolo_complessivo_venduta_e_margine.margine_totale <> 0) AND (ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.VENDITA_MEDIA <> 0)
ORDER BY ARTICOLI_STAMPA_COMPLESSIVA_MARGINI_MEDI.COD_ARTI


