# RtlAmr
Docker Images for collecting AMR data using https://github.com/bemasher/rtlamr-collect


## Example Usage
```shell
docker run -e 'INFLUX_HOST=http://localhost:8086/ INFLUX_USER=rtlamr INFLUX_PASSWORD=rtlamr FILTERID=id1,id2,id3 MSGTYPE=scm,scm+,r900' -it --rm --device=/dev/bus/usb abates314/rtl-amr
```

## Example docker-compose.yml
```Dockerfile
version: '3'
version: "3"
services:
  rtlamr:
    image: abates314/rtl-amr
    environment:
      INFLUX_HOST: http://localhost:8086/
      INFLUX_DB: "rtlamr"
      INFLUX_USER: "rtlamr"
      INFLUX_PASS: "rtlamr"
      FILTERID: "id1,id2,id3"
      MSGTYPE: "scm,scm+,r900"
    devices:
      - "/dev/bus/usb"
```
