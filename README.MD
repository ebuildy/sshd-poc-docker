# Test SSHD config

Replace id_rsa.pub with your public SSH key.

```sh
# Build
docker-compose build --build-arg MY_USER=toto

# Run
docker-compose up -d

# Connect
ssh toto@localhost -p 2222
```
