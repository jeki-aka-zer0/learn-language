FROM golang:1.19-alpine

WORKDIR /app

# prevent the re-installation of vendors at every change in the source code
COPY ./go.mod go.sum ./
RUN go mod download && go mod verify

RUN go install -mod=mod github.com/githubnemo/CompileDaemon

# rebuild application on file change saving
ENTRYPOINT CompileDaemon --build="go build -o main main.go"
