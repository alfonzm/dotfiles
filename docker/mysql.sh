# Run MySQL 5.7 on port 3306
docker run --name mysql5.7 -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:5.7

# Run MySQL 8 on port 3307
docker run --name mysql8 -e MYSQL_ROOT_PASSWORD=root -p 3307:3306 -d mysql:latest