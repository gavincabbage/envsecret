ARG GO_VERSION=1.12

FROM golang:${GO_VERSION}-alpine

RUN apk update
RUN apk add --no-cache build-base git

WORKDIR /envsecret

COPY go.mod .
COPY go.sum .

RUN go mod download
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint

COPY . .