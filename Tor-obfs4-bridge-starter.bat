docker pull alessandrofiori/tor-obfs4-bridge
docker create alessandrofiori/tor-obfs4-bridge:latest
docker run -p 9003:9003 -p 9004:9004 alessandrofiori/tor-obfs4-bridge:latest
