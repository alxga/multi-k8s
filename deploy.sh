docker build -t alxga/multi-client -f ./client/Dockerfile ./client
docker build -t alxga/multi-server -f ./server/Dockerfile ./server
docker build -t alxga/multi-worker -f ./worker/Dockerfile ./worker

docker push alxga/multi-client
docker push alxga/multi-server
docker push alxga/multi-worker

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=alxga/multi-server
