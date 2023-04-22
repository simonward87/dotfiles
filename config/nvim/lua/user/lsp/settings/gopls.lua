return {
	settings = {
		gopls = {
			env = {
				-- work-around for ls not running when using build tags:
				-- https://github.com/golang/go/issues/29202
				-- more info about GOFLAGS:
				-- https://pkg.go.dev/cmd/go#hdr-Environment_variables
				GOFLAGS = "-tags=inmemory,integration,linux,test,unittest,windows",
			},
		},
	},
}
