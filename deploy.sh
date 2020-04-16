

docker build -t alxga/multi-client:latest -t alxga/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t alxga/multi-server:latest -t alxga/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t alxga/multi-worker:latest -t alxga/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push alxga/multi-client:latest
docker push alxga/multi-server:latest
docker push alxga/multi-worker:latest
docker push alxga/multi-client:$SHA
docker push alxga/multi-server:$SHA
docker push alxga/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=alxga/multi-client:$SHA
kubectl set image deployments/server-deployment server=alxga/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=alxga/multi-worker:$SHA
