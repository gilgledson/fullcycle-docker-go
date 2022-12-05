FROM golang:latest AS go-builder

WORKDIR /app

COPY ./main.go .

RUN apt-get update && \
    apt install golang-go -y

RUN go build main.go 

FROM scratch

WORKDIR /app

COPY --from=go-builder /app/main .

ENTRYPOINT [ "/app/main" ]
