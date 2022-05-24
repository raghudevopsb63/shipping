FROM          maven
RUN           useradd -d /home/roboshop roboshop
RUN           chown roboshop:roboshop /home/roboshop -R
USER          roboshop
WORKDIR       /home/roboshop
COPY          pom.xml .
COPY          src/ src/
RUN           ls -ltr
RUN           mvn package
RUN           mv target/shipping-1.0.jar shipping.jar
ENTRYPOINT    ["java", "-jar", "shipping.jar"]
