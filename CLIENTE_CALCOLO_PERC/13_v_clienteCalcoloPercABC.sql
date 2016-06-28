--v_clienteCalcoloPercABC
SELECT        
	COD, PERC, r, Progr
FROM            
	OPENROWSET('SQLNCLI', 'Server=(local)\SQLEXPRESS;Trusted_Connection=yes;', 'EXEC $SIGLAAZIE$.dbo.clienteCalcoloPercABC') 