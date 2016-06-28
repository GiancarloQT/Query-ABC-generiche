/****** Object:  StoredProcedure [dbo].[clienteCalcoloPercABC]    Script Date: 28/06/2016 10:07:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[clienteCalcoloPercABC]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if exists (select 1                                        
		   from  sysobjects                                    
		  where  Upper(name) = 'TCLIENTE_CALCOLO_PERC'       
		   and   type = 'U')                                 
	DROP TABLE TCLIENTE_CALCOLO_PERC;                           

	SELECT * INTO TCLIENTE_CALCOLO_PERC FROM CLIENTE_CALCOLO_PERC;

	WITH ABCCli AS (                                                                   
	SELECT     COD_CLI AS COD, PERC, ROW_NUMBER() OVER (ORDER BY [PERC] DESC) AS [r]   
	FROM         TCLIENTE_CALCOLO_PERC)                                                
    SELECT     *,                                                                  
                                (SELECT     SUM([PERC])                            
                                  FROM          ABCCli ref                         
                                  WHERE      ref.[r] <= cur.[r]) AS [Progr]        
     FROM         ABCCli cur                                                       
     ORDER BY cur.[r];                                                              
                                                      

                       
END
