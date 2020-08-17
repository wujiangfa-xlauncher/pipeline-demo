package main

import (
	"github.com/gin-gonic/gin"
)

func main(){
	engine := gin.New()
	engine.GET("/", func(context *gin.Context) {
		context.JSON(200,"This is a demo")
	})
	_ = engine.Run(":80")
}
