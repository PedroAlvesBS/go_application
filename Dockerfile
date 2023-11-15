FROM golang:1.18-alpine AS builder 

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN GOARCH=amd64 GOOS=linux go build -o /get-time

FROM golang:1.18-alpine

COPY --from=builder /app/get-time /get-time

EXPOSE 8080

CMD [ "/get-time" ]