FROM gcc:5.5
COPY ./ /client-server-src/
WORKDIR /client-server-src/
RUN cd /client-server-src/example-client/ && make
RUN cd /client-server-src/example-server/ && make

