package main

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func getTime(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, time.Now())
}

func main() {

	router := gin.Default()
	router.GET("/", getTime)

	router.Run(":8080")
}
