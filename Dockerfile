FROM openjdk:11.0.16-slim
COPY target/todo-1.0.1.jar todo-1.0.1.jar
RUN mkdir -p /opt/arqui_software/logs
VOLUME /opt/arqui_software/logs
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-jar","/todo-1.0.1.jar"]