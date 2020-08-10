FROM golang:1.13 as build
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o /home/pipeline-demo  pipeline-demo

FROM registry.cn-hangzhou.aliyuncs.com/launcher/alpine:latest
MAINTAINER wujiangfa <1152175313@qq.com>
COPY --from=build /home/pipeline-demo /home/pipeline-demo
RUN chmod +x /home/pipeline-demo
CMD /home/pipeline-demo