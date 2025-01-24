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
      COLLECT_INFLUXDB_HOSTNAME: http://localhost:8086/
      COLLECT_INFLUXDB_BUCKET: "utilities"
      COLLECT_INFLUXDB_TOKEN: "#################################"
      INFLUX_PASS: "rtlamr"
      RTLAMR_FILTERID: "id1,id2,id3"
      RTLAMR_MSGTYPE: "scm,scm+,r900"
    devices:
      - "/dev/bus/usb"
```
