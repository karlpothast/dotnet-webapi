CREATE PROCEDURE [dbo].[getAdjacentCounties]
(@CountyId1 INT, @CountyId2 INT)
AS
BEGIN
SET NOCOUNT ON

DECLARE @adjacentCountyId_FipsIdMatch uniqueidentifier
SET @adjacentCountyId_FipsIdMatch = 
                         (SELECT TOP 1 Id 
                         FROM Counties 
                         WHERE countyFipsId = @countyId2)
                         
                         
DECLARE @adjacentCountyId_MapIdMatch uniqueidentifier
SET @adjacentCountyId_MapIdMatch = 
                         (SELECT TOP 1 Id 
                         FROM Counties 
                         WHERE countyMapId = @countyId2)
              
                         
DECLARE @countiesAreAdjacentByFipsId BIT = 0
DECLARE @countiesAreAdjacentByMapId BIT = 0
DECLARE @returnValue BIT = 0
DECLARE @matchedBy VARCHAR(6) = 'none'

IF EXISTS (
    SELECT c.Id
    FROM counties c, adjacentCounties a 
    WHERE c.Id = a.baseCountyId AND
    c.countyFipsId = @CountyId1 AND
    a.adjacentCountyId = @adjacentCountyId_FipsIdMatch
)
 BEGIN
    SET @countiesAreAdjacentByFipsId = 1
    SET @matchedBy = 'FIPSId'
 END
 
IF EXISTS (
    SELECT c.Id
    FROM counties c, adjacentCounties a 
    WHERE c.Id = a.baseCountyId AND
    c.countyMapId = @CountyId1 AND
    a.adjacentCountyId = @adjacentCountyId_MapIdMatch
)
 BEGIN
    SET @countiesAreAdjacentByMapId = 1
    SET @matchedBy = 'MapId'
 END
 
 DECLARE @booleanString VARCHAR(5) = 'false'
 IF (@countiesAreAdjacentByFipsId = 1 OR 
     @countiesAreAdjacentByMapId = 1)
   BEGIN
     SET @returnValue = 1
     SET @booleanString = 'true'
   END
 ELSE
  BEGIN
     SET @returnValue = 0
   END
   
 print '{"CountiesAreAdjacent":' + @booleanString + '}'

END;

     