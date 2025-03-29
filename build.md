## Docker

Build image locally

```
./build.local.sh
```

Push to DockerHub

``` 
docker tag vsc-soroban-quest-b12b92e7a3b8a364f92f6a2c005830943284b8d291c58ca2737d032cd38007b7:latest chrisstellar/vsc-soroban-quest-b12b9-prebuild:latest
docker push chrisstellar/vsc-soroban-quest-b12b9-prebuild:latest
```