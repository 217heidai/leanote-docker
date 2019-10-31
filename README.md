# leanote-docker
Leanote docker image. <https://github.com/leanote/leanote>

# How to Setup
## 1. Setup mongodb
```bash
docker container run -d \
	--restart=always \
	--name leanote_mongo \
	-v $HOME/mongodb/db:/data/db \ # mongodb data
	-v $HOME/mongodb/configdb:/data/configdb \ # mongodb config file
	-e TZ=Asia/Shanghai \
	mongo
```

## 2. Setup leanote
```bash
docker container run -d \
    --restart=always \
	--name leanote \
	-p 9000:9000 \
	-v $HOME/leanote:/leanote \ # leanote 
	--link leanote_mongo:db \ # link mongodb
	-e TZ=Asia/Shanghai \
	217heidai/leanote
```

# How to Configure
## 1. initialize mongodb
```bash
tar -zxf leanote-linux-amd64-v2.6.1.bin.tar.gz
docker cp leanote/mongodb_backup/leanote_install_data leanote_mongo:/ # copy 'leanote_install_data' to container
docker exec -it leanote_mongo bash
mongorestore -h localhost -d leanote --drop --dir /leanote_install_data/ # initialize leanote data
rm -rf leanote_install_data
```

## 2. Configure leanote
1. $HOME/leanote/conf/app.conf, configure it.</br>
    Change `db.host` to `db.host=db`.</br>
    Change `app.secret` to whatever you want.
2. Restart your leanote container.
3. <http://127.0.0.1:9000>, login. Default user is `admin`, and pwssword is `abc123`.