FROM microsoft/dotnet:1.1-sdk-msbuild

COPY ./FakeServer /app

WORKDIR /app

RUN ["dotnet", "restore"]

RUN ["dotnet", "build"]

EXPOSE 57602/tcp

CMD ["dotnet", "run", "--file", "db.json", "--urls", "http://*:57602"]