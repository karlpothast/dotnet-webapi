#!/bin/bash 

dotnet clean /home/kp/workspaces/dotnet/dotnet-api-boilerplate/src/Boilerplate.Api/Boilerplate.Api.csproj
dotnet clean /home/kp/workspaces/dotnet/dotnet-api-boilerplate/src/Boilerplate.Application/Boilerplate.Application.csproj 
dotnet clean /home/kp/workspaces/dotnet/dotnet-api-boilerplate/src/Boilerplate.Domain/Boilerplate.Domain.csproj 
dotnet clean /home/kp/workspaces/dotnet/dotnet-api-boilerplate/src/Boilerplate.Infrastructure/Boilerplate.Infrastructure.csproj

dotnet build /home/kp/workspaces/dotnet/dotnet-api-boilerplate/src/Boilerplate.Api/Boilerplate.Api.csproj
dotnet build /home/kp/workspaces/dotnet/dotnet-api-boilerplate/src/Boilerplate.Application/Boilerplate.Application.csproj 
dotnet build /home/kp/workspaces/dotnet/dotnet-api-boilerplate/src/Boilerplate.Domain/Boilerplate.Domain.csproj 
dotnet build /home/kp/workspaces/dotnet/dotnet-api-boilerplate/src/Boilerplate.Infrastructure/Boilerplate.Infrastructure.csproj
