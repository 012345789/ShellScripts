# Scripts to run a GET command via curl
echo "A test search targeting remote server"
curl -i -H "Accept: application/json" GET "http://138.68.7.238:8080/search/pie"

echo "A test search targeting local server"
curl -i -H "Accept: application/json" GET "http://localhost:8080/search/cake"