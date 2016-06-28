/****** Object:  StoredProcedure [dbo].[articoloCalcoloPercABC]    Script Date: 28/06/2016 10:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[articoloCalcoloPercABC]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if exists (select 1                                     
		   from  sysobjects                                 
		  where  Upper(name) = 'TARTICOLO_CALCOLO_PERC'   
		   and   type = 'U')                              
	DROP TABLE TARTICOLO_CALCOLO_PERC;                                                

	SELECT * INTO TARTICOLO_CALCOLO_PERC FROM ARTICOLO_CALCOLO_PERC;

	WITH ABCArti AS (                                                                
	SELECT     COD_ARTI AS COD, PERC, ROW_NUMBER() OVER (ORDER BY [PERC] DESC) AS [r]
	FROM         TARTICOLO_CALCOLO_PERC)                                             
    SELECT     *,                                                                
                                (SELECT     SUM([PERC])                          
                                  FROM          ABCArti ref                      
                                  WHERE      ref.[r] <= cur.[r]) AS [Progr]      
     FROM         ABCArti cur                                                    
     ORDER BY cur.[r];
                                                      

                       
END
