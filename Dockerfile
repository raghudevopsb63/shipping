FROM          maven
RUN           useradd roboshop
USER          roboshop
WORKDIR       /home/roboshop
RUN           chown roboshop:roboshop /home/roboshop -R
COPY          pom.xml .
COPY          src/ src/
RUN           ls -ltr
RUN           mvn package
RUN           mv target/shipping-1.0.jar shipping.jar
ENTRYPOINT    ["java", "-jar", "shipping.jar"]
