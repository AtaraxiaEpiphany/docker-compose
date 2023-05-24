FROM amd64/buildpack-deps:buster-curl as installer

ARG SENTINEL_VERSION=1.8.6

#RUN set -x \
#    && curl -SL --output /home/sentinel-dashboard.jar https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}/sentinel-dashboard-${SENTINEL_VERSION}.jar

#FROM openjdk:8-jre-slim
FROM java:openjdk-8u111-jre-alpine

# copy sentinel jar
#COPY --from=installer ["/home/sentinel-dashboard.jar", "/home/sentinel-dashboard.jar"]
COPY executable/sentinel-dashboard-1.8.6.jar /home/sentinel-dashboard.jar

ENV JAVA_OPTS '-Dserver.port=8080 -Dcsp.sentinel.dashboard.server=localhost:8080'
ENV PORT 8080
ENV SENTINEL_NAME sentinel-dashboard
ENV USERNAME sentinel
ENV PASSWORD sentinel

RUN chmod -R +x /home/sentinel-dashboard.jar

EXPOSE ${PORT}

#CMD java ${JAVA_OPTS} -jar /home/sentinel-dashboard.jar
CMD java  -Dserver.port=${PORT} -Dcsp.sentinel.dashboard.server=localhost:${PORT} -Dproject.name=${SENTINEL_NAME} \
    -Dsentinel.dashboard.auth.username=${USERNAME} -Dsentinel.dashboard.auth.password=${PASSWORD} \
    -jar /home/sentinel-dashboard.jar
