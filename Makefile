GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=velux-cli

all: build
build: genclient
	$(GOBUILD) -o $(BINARY_NAME) -v

fmt:
	$(GOCMD) fmt

clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME) client models

deps:
	$(GOGET) github.com/go-swagger/go-swagger/cmd/swagger
	$(GOGET) github.com/go-openapi/errors
	$(GOGET) github.com/go-openapi/runtime
	$(GOGET) github.com/go-openapi/runtime/client
	$(GOGET) github.com/go-openapi/strfmt

genclient: deps
	../../../../bin/swagger generate client -f ./swagger.yaml
