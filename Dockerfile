FROM golang

COPY hello.go hello.go

RUN go build hello.go

CMD ["./hello"]
