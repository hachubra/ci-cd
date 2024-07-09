#jre install

sudo apt-get install default-jre

#jenkins install
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

#go install
wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz

sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
sudo export PATH=$PATH:/usr/local/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
go version
--- 
sudo usermode -aG docker jenkins

docker run -d -p 192.168.123.10:8081:8081 -p 192.168.123.10:8082:8082 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms512m -Xmx512m -XX:MaxDirectMemorySize=273m" sonatype/nexus3

docker exec -t nexus bash -c 'cat /nexus-data/admin.password && echo'

sudo docker stop 27461286fa63

tar -xvf 
