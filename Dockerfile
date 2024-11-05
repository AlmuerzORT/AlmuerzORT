FROM mcr.microsoft.com/dotnet/runtime:8.0-nanoserver-1809 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:8.0-nanoserver-1809 AS build
ARG configuration=Release
WORKDIR /src
COPY ["AlmuerzORT/AlmuerzORT.csproj", "AlmuerzORT/"]
RUN dotnet restore "AlmuerzORT\AlmuerzORT.csproj"
COPY . .
WORKDIR "/src/AlmuerzORT"
RUN dotnet build "AlmuerzORT.csproj" -c $configuration -o /app/build

FROM build AS publish
ARG configuration=Release
RUN dotnet publish "AlmuerzORT.csproj" -c $configuration -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AlmuerzORT.dll"]
