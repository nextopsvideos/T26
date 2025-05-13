FROM custom_ubuntu:22.04
RUN apt update -y
WORKDIR /usr/local/apache2
COPY index.html /usr/local/apache2/index.html
ADD https://url/index.html /usr/local/apache2/index.html
ENV MONGO_INITDB_ROOT_USER=root
EXPOSE 8000
VOLUME /home/charan/data
LABEL app="frontendapp"
CMD [ "ls", "-lta" ] # Can be overridden 