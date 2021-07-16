# NuGet restore
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY *.sln .
COPY ContactBook/*.csproj ContactBook/
RUN dotnet restore
COPY . .

# testing
# FROM build AS testing
# WORKDIR /src/Colors.API
# RUN dotnet build
# WORKDIR /src/Colors.UnitTests
# RUN dotnet test

# publish
FROM build AS publish
WORKDIR /src/ContactBook
RUN dotnet publish -c Release -o /src/publish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=publish /src/publish .
# ENTRYPOINT ["dotnet", "ContactBook.dll"]
# heroku uses the following
CMD ASPNETCORE_URLS=http://*:$PORT dotnet ContactBook.dll