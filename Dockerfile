# 1. Run By ASP.NET Core Runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80

# 2. .NET SDK For Build Project
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["Dockerized-DotNetAPI-CICD.csproj", "./"]
RUN dotnet restore "./Dockerized-DotNetAPI-CICD.csproj"
COPY . .
RUN dotnet publish "./Dockerized-DotNetAPI-CICD.csproj" -c Release -o /app/publish

# 3. Run Project
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENV ASPNETCORE_ENVIRONMENT=Production
ENTRYPOINT ["dotnet", "Dockerized-DotNetAPI-CICD.dll"]
