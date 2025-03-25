FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install -y openjdk-17-jdk maven

# Copia os arquivos do projeto para o container
COPY . /app
WORKDIR /app

# Compila o projeto usando Maven
RUN mvn clean install

# Usa uma imagem mais leve para rodar a aplicação
FROM openjdk:17-jdk-slim

EXPOSE 8080

# Copia o JAR gerado do estágio de build para o container final
COPY --from=build /app/target/api-0.0.1-SNAPSHOT.jar app.jar

# Comando para executar a aplicação
ENTRYPOINT [ "java", "-jar", "app.jar" ]
