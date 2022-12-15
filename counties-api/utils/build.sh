#!/bin/bash 

dotnet build /home/kp/workspaces/dotnet7/dotnet-webapi/counties-api/src/API/API.csproj
dotnet build /home/kp/workspaces/dotnet7/dotnet-webapi/counties-api/src/Application/Application.csproj
dotnet build /home/kp/workspaces/dotnet7/dotnet-webapi/counties-api/src/Domain/Domain.csproj
dotnet build /home/kp/workspaces/dotnet7/dotnet-webapi/counties-api/src/Infrastructure/Infrastructure.csproj
