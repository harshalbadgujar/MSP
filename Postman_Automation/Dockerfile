FROM    node
WORKDIR /App
RUN     npm install -g newman 
RUN     npm install -g newman-reporter-htmlextra
RUN     mkdir newman
COPY    . .
# Execute postman test when run docker run command
CMD     newman run MSP_Validation.postman_collection.json -e MSP.postman_environment.json --reporters 'cli,junit,htmlextra'
