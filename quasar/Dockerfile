FROM golang:1.20.3 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main cmd/main.go

FROM scratch
COPY --from=builder /app/main /main
COPY app.env.example /app.env
COPY pkg/users/store/migrations /pkg/users/store/migrations
COPY pkg/feedback/store/migrations /pkg/feedback/store/migrations
CMD [ "/main" ]