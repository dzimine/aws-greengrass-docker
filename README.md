# Docker for AWS Greengrass

Development, testing, simulations are all good reasons towant to run [AWS Greengrass Core](https://docs.aws.amazon.com/greengrass/latest/developerguide/module2.html) in a docker container. This repo provides a simple Ubuntu-based Greengrass Core Docker image.

The trick to running it in Docker is to use `devicemapper` storage driver instead of default `overlay2` ([thanks AWS support for digging it out](https://forums.aws.amazon.com/message.jspa?messageID=832291)). 

> **CAUTION:** when you change the Docker storage driver, you won't see the images and containers created with the old storage driver, until you change it back. [Details here](https://docs.docker.com/storage/storagedriver/select-storage-driver/#check-your-current-storage-driver)

### Build the AWS Greengras image

```
docker build -t aws-greengrass .
```

### Run the AWS Greengrass container

1. Place your Greengrass Core certificates and keys under `certs/`
2. Adjust `config.json` under `config/` to point to the certificates and emails

   > When you create a [Greengrass Core in AWS console](https://docs.aws.amazon.com/greengrass/latest/developerguide/gg-config.html), and ***Download and store your Core's security resources***, the download contains the certificates and core configuration. Just copy them over here to `certs/` and `config/`. 

3. Run the container:

   ```
   docker run --rm -it \
   -v "$PWD/certs":/greengrass/certs \
   -v $PWD/config:/greengrass/config \
   --privileged \
   aws-greengrass
   ```

   Or use docker-compose:

   ```
   docker-compose up
   ```


#### For MacOS and Windows users
You _can_ build the image on MacOS and Windows, but _can not_ run it. 

The `devicemapper` trick doesn't work for MacOS or Windows, as Docker doesn't support the `devicemapper` storage driver there. 
Instead, use the Vagrant Ubuntu VM: docker is installed and configured to use `devicemapper`. 

Create the VM with `vagrant run`, log inside with `vagrant ssh`,
and proceed with the steps before. Either pull the image from Docker Hub, or just rebuild it inside Vagrant VM.

