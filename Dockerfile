
FROM nginx:alpine AS static-site

COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css

FROM amazoncorretto:11-alpine AS java-app

COPY HelloWorld.java /usr/src/myapp/HelloWorld.java

WORKDIR /usr/src/myapp

RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
