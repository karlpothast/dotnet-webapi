  use counties;
  CREATE TABLE [counties](
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [countyName] [varchar](50) NOT NULL,
    [countyFipsId] [char](3) NOT NULL,
    [countyMapId] [int] NOT NULL
  ) ON [PRIMARY]

  CREATE TABLE [adjacentCounties](
    [baseCountyId] UNIQUEIDENTIFIER NOT NULL,
    [adjacentCountyId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT PK_adjacentCounties PRIMARY KEY (baseCountyId, adjacentCountyId),
  ) ON [PRIMARY]

  --temp table to fill adjacentCounty
  CREATE TABLE [adjacentCountiesLoad](
    [baseCountyFipsId] char(3) NOT NULL,
    [adjacentCountyFipsId] char(3) NOT NULL,
    CONSTRAINT PK_adjacentCountiesLoad PRIMARY KEY (baseCountyFipsId, adjacentCountyFipsId),
  ) ON [PRIMARY]


  