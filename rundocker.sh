sudo docker stop $(sudo docker ps -aq -f name=newki-sql)
sudo docker rm $(sudo docker ps -aq -f name=newki-sql) 
sudo docker build -t newki/newki-sql:1.1  . 
sudo docker run --name newki-sql --network host -i -d newki/newki-sql:1.1 
sudo docker exec -d -w / newki-sql service postgresql start
sudo docker exec -w /newki-sql-backup/ newki-sql git pull
sudo docker exec -w /newki-sql-backup/ newki-sql sh setup.sh

