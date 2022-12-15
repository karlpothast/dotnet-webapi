FROM dndnetsql:v1.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
COPY src/API/.ashrc /root/.ashrc
COPY src/API/runsqlcmd.sh runsqlcmd.sh 
COPY src/API/init.sh /root/init.sh
COPY src/API/setup.sh /root/setup.sh
RUN apk add --no-cache icu-libs  
ENV ENV=/root/.ashrc
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

FROM dndnetsql:v1.1 AS build
WORKDIR /src
COPY ["src/API/API.csproj", "src/API/"]
COPY ["src/Application/Application.csproj", "src/Application/"]
COPY ["src/Domain/Domain.csproj", "src/Domain/"]
COPY ["src/Infrastructure/Infrastructure.csproj", "src/Infrastructure/"]
COPY . .
WORKDIR /src/src/API

FROM build AS publish
RUN dotnet publish "API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
