FROM mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim


WORKDIR /
COPY / /

# WORKDIR 'DotnetTemplate.Web'
RUN dotnet build

RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get install -y nodejs
RUN apt-get install -y npm

WORKDIR /DotnetTemplate.Web
RUN npm install
RUN npm run build

ENTRYPOINT dotnet run

