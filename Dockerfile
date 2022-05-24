FROM          maven
RUN           useradd roboshop
USER          roboshop
WORKDIR       /home/roboshop
COPY          pom.xml .
COPY          src .
RUN           mvn package
RUN           mv target/shipping-1.0.jar shipping.jar
ENTRYPOINT    ["java", "-jar", "shipping.jar"]
