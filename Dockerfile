FROM golang:1.13 as build
ENV  GOPROXY=https://goproxy.cn
ENV  GO111MODULE=on
ADD .  /go/src/pipeline-demo
WORKDIR /go/src/pipeline-demo
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o /home/pipeline-demo main.go

FROM registry.cn-hangzhou.aliyuncs.com/launcher/alpine:latest
COPY --from=build /home/pipeline-demo /home/pipeline-demo
RUN chmod +x /home/pipeline-demo
CMD /home/pipeline-demo