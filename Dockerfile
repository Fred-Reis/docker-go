FROM golang:1.15-alpine AS builder

WORKDIR /app
COPY . .

RUN go build -o /app/hello -ldflags='-s -w' .


FROM scratch

WORKDIR /app
COPY --from=builder /app/hello ./hello

ENTRYPOINT [ "./hello" ]