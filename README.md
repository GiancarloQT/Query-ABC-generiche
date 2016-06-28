Query indagine ABC su articoli / clienti
N.B.:
Esistono per articoli e clienti due stored procedure che restituiscono i risultati in formato ABC.
Per rendere le stored procedure fruibili in fomrato "qry" è necessario utilizzare questo stratagemma:

SELECT *  FROM OPENROWSET('SQLNCLI', 'Server=(local)\SQLEXPRESS;Trusted_Connection=yes;', 'EXEC noe_rp.dbo.articoloCalcoloPercABC')
SELECT *  FROM OPENROWSET('SQLNCLI', 'Server=(local)\SQLEXPRESS;Trusted_Connection=yes;', 'EXEC noe_rp.dbo.clienteCalcoloPercABC')

Portando a vista si possono effettuare le select del caso.