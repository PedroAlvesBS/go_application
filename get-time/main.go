package main

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func getTime(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, time.Now())
}

func main() {

	router := gin.Default()
	router.GET("/", getTime)

	router.GET("/metrics", gin.WrapH(promhttp.Handler()))

	router.Run(":8080")
}
