USE [db_a74b52_cementerio]
GO
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'[dbo].[Dashboard_TotalPabellones]') and ObjectProperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[Dashboard_TotalPabellones]
GO

/******************************************************************************
NOMBRE           : Dashboard_TotalPabellones
DESCRIPCI�N      : Permite actualizar un registro en la tabla TA_COLABORADOR
FECHA CREACI�N   : 11/09/2022
CREADOR          : Gustavo Fern�ndez 
SINTAXIS         :  
            Dashboard_TotalPabellones
******************************************************************************/
CREATE PROCEDURE [dbo].[Dashboard_TotalPabellones]
AS
BEGIN
	SELECT 
		PABELLON = P.PABS_NOMBRE,
		NICHOS_LIBRES = SUM(NICB_NUMDIFACTUAL),
		NICHOS_OCUPADOS = SUM(NICB_NUMDIFTOTAL - NICB_NUMDIFACTUAL)
	FROM TA_NICHO N INNER JOIN TA_PABELLON P
	ON N.NICN_IDPABELLON = P.PABN_IDPABELLON
	WHERE N.NICB_ESTADO = 1 AND P.PABB_ESTADO = 1
	GROUP BY P.PABS_NOMBRE
END