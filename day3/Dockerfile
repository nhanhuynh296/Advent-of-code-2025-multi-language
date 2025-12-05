FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /app
RUN dotnet new console --force
COPY program.cs Program.cs
CMD ["dotnet", "run"]