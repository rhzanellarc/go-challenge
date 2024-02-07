FROM golang AS builder

WORKDIR /go-challenge

COPY go-challenge/go-challenge.go .

RUN go mod init go-challenge
RUN go build -ldflags "-s"

FROM scratch

WORKDIR /go-challenge

COPY --from=builder /go-challenge/go-challenge .

ENTRYPOINT ["./go-challenge" ]