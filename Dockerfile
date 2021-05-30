FROM ubuntu
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update;
RUN apt-get install -y apt-transport-https  
RUN apt-get update  
RUN apt-get install -y dotnet-sdk-3.1
RUN apt-get install -y git-all
RUN apt-get update && apt-get install -y libgdiplus
RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa
#ADD known_hosts /root/.ssh/known_hosts
#ADD id_rsa.pub /root/.ssh/id_rsa.pub
#ADD authorized_keys /root/.ssh/authorized_keys
#RUN chmod 600 /root/.ssh/id_rsa
EXPOSE 3306
RUN git clone git@bitbucket.org:kianoushkarbasi/newki-sql-backup.git
#RUN apt-get install -y apache2
RUN cd /newki-sql-backup/
RUN apt-get update  
RUN apt install -y python3-pip
RUN apt-get update  
RUN pip3 install pdfkit
RUN apt-get update  
RUN apt-get install libaio1 libaio-dev
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install postgresql postgresql-contrib -y
RUN pip3 install boto3
RUN echo "* 1 * * * (cd /newki-sql-backup/ ; sh backup.sh)" | crontab -

