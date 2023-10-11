FROM alpine

RUN apk add --no-cache \
        bash           \
        httpie         \
        jq &&          \
        which bash &&  \
        which http &&  \
        which jq

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# copy the sample data into the image so the test, local execution is successful. Copied to the root of the file system; that will be the working directory when the script is run inside the container
COPY sample_push_event.json /sample_push_event.json

ENTRYPOINT ["entrypoint.sh"]
