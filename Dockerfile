FROM golang:1.18-alpine AS builder 

WORKDIR /app

COPY go.mod ./

RUN go mod tidy

RUN go get github.com/gin-gonic/gin

RUN go get github.com/prometheus/client_golang/prometheus/promhttp

COPY *.go ./

RUN GOARCH=amd64 GOOS=linux go build -o get-time

FROM golang:1.18-alpine

WORKDIR /app

COPY --from=builder /app/get-time /get-time

EXPOSE 8080

CMD [ "/get-time" ]