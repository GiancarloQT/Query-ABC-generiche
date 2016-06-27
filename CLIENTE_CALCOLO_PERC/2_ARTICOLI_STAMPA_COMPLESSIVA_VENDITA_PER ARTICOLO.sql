--ARTICOLI_STAMPA_COMPLESSIVA_VENDITA_PER ARTICOLO
SELECT        
	TOP (100) PERCENT CASE VENDITE_MASTER.COD_AGENTE WHEN 'CKYAGE_DIREZIONALE' THEN 'S' ELSE 'N' END AS DISTRIB, COD_ARTI, SUM(VALORE_VENDITA) AS [VALORE VENDITA], SUM(QTA_VENDITA) 
    AS [QTA VENDITA], SUM(MARGINE) AS MARGINE
FROM            
	VENDITE_MASTER
GROUP BY COD_ARTI, CASE VENDITE_MASTER.COD_AGENTE WHEN 'CKYAGE_DIREZIONALE' THEN 'S' ELSE 'N' END
ORDER BY COD_ARTI, DISTRIB