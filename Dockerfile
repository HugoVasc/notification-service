FROM node:16-alpine3.15

WORKDIR /app

COPY . /app/

# RUN apk update && apk add curl

# RUN curl https://fontes.intranet.bb.com.br/aic/publico/atendimento/-/wikis/uploads/3bce24aa2190d866321819780bc8b53b/bb-bundle.pem -o /bb-certs/bb-bundle.pem && export NODE_EXTRA_CA_CERTS=/bb-certs/bb-bundle.pem

# RUN curl https://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm && yum install oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm && sh -c "echo /usr/lib/oracle/18.3/client64/lib > /etc/ld.so.conf.d/oracle-instantclient.conf" && ldconfig && export PATH=/usr/lib/oracle/19.3/client64/bin:$PATH
# RUN mkdir -p /opt/oracle/instantclient_19_17/ && cd /opt/oracle && curl https://download.oracle.com/otn_software/linux/instantclient/1917000/instantclient-basiclite-linux.x64-19.17.0.0.0dbru.zip && unzip instantclient-basiclite-linux.x64-19.17.0.0.0dbru.zip && cd /opt/oracle/instantclient_19_17 && ln -s libclntsh.so.12.1 libclntsh.so && ln -s libocci.so.12.1 libocci.so && apk add libaio && sh -c "echo /opt/oracle/instantclient_19_3 > /etc/ld.so.conf.d/oracle-instantclient.conf" && ldconfig && export PATH=/opt/oracle/instantclient_19_3:$PATH
# RUN mkdir -p /opt/oracle/instantclient_19_17/ && cd /opt/oracle && curl https://download.oracle.com/otn_software/linux/instantclient/1917000/oracle-instantclient19.17-basiclite-19.17.0.0.0-1.x86_64.rpm && yum install oracle-instantclient19.17-basiclite-19.17.0.0.0-1.x86_64.rpm && sh -c "echo /opt/oracle/instantclient_19_17 > /etc/ld.so.conf.d/oracle-instantclient.conf" && ldconfig && export PATH=/usr/lib/oracle/19.17/client64/bin:$PATH


RUN npm run build

EXPOSE 3000/tcp

CMD ["npm", "run", "start:prod"]

