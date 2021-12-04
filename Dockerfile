#FROM openjdk:11 as builder
#ADD . /src
#WORKDIR /src
#RUN ./mvnw package -DskipTests
#
#FROM alpine:3.15.0 as packager
#RUN apk --no-cache add openjdk11-jdk openjdk11-jmods
#ENV JAVA_MINIMAL="/opt/java-minimal"
#RUN /usr/lib/jvm/java-11-openjdk/bin/jlink \
#    --verbose \
#    --add-modules \
#        java.base,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument \
#    --compress 2 --strip-debug --no-header-files --no-man-pages \
#    --release-info="add:IMPLEMENTOR=radistao:IMPLEMENTOR_VERSION=radistao_JRE" \
#    --output "$JAVA_MINIMAL"
#
#FROM alpine:3.15.0
#
#ENV JAVA_HOME=/opt/java-minimal
#ENV PATH="$PATH:$JAVA_HOME/bin"
#COPY --from=packager "$JAVA_HOME" "$JAVA_HOME"
#COPY --from=builder /src/target/demo-0.0.1-*.jar app.jar
#EXPOSE 80
#ENTRYPOINT ["java","-jar","/app.jar"]
#Команда EXPOSE 8080 сигнализирует докеру, что приложение в контейнере будет использовать его порт 8080
#(это не сделает приложение доступным извне, но позволит обратиться к приложению, например, из другого
#контейнера в той же сети докера).

FROM adoptopenjdk/openjdk11
LABEL maintainer="fedormoore@gmail.com"
ARG ARTIFACT_NAME
ARG IMAGE_VERSION
EXPOSE 80
COPY target/${ARTIFACT_NAME}*.jar ${ARTIFACT_NAME}.jar
#RUN printf "IMAGE_VERSION=${IMAGE_VERSION}" > version.properties
#RUN printf "ARTIFACT_NAME=${ARTIFACT_NAME}" > version.properties
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]