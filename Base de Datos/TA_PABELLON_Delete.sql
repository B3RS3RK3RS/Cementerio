USE [BD_CEMENTERIO]
GO
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'[dbo].[TA_PABELLON_Delete]') and ObjectProperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[TA_PABELLON_Delete]
GO

/******************************************************************************
NOMBRE           : TA_PABELLON_Delete
DESCRIPCIÓN      : Permite eliminar de forma permanente un registro en la tabla TA_PABELLON por su primary key
FECHA CREACIÓN   : 10/09/2022
CREADOR          : SourceGenerator 
SINTAXIS         :  
            TA_PABELLON_Delete
******************************************************************************/
CREATE PROCEDURE [dbo].[TA_PABELLON_Delete]
(
    	@PABN_IDPABELLON INT
)

AS
BEGIN

    SET NOCOUNT ON

    UPDATE [TA_PABELLON]
    SET     [PABB_ESTADO] = 0
    WHERE    [PABN_IDPABELLON] = @PABN_IDPABELLON

END

GO