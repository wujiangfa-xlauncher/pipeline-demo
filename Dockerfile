FROM golang:1.13 as build
ADD . /home/
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o /home/pipeline-demo  /home/main.go

FROM registry.cn-hangzhou.aliyuncs.com/launcher/alpine:latest
COPY --from=build /home/pipeline-demo /home/pipeline-demo
RUN chmod +x /home/pipeline-demo
CMD /home/pipeline-demo