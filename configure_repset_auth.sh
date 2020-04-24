#!/bin/bash
#Author : Hardeep.Singh

# Initiate replica set configuration
echo "Configuring the mongoB Replica Set"
kubectl -n realplay exec mongo-0 -- mongo --eval 'rs.initiate({ _id : "rs0", members: [ { _id : 0, host : "mongo-0.mongo:27017" }, { _id : 1, host : "mongo-1.mongo:27017" }, { _id : 2, host : "mongo-2.mongo:27017" }]});'

# Wait a bit until the replica set should have a primary ready
echo "Waiting for the Replica Set to initialise..."
sleep 30
kubectl -n realplay exec mongo-0 -- mongo --eval 'rs.status();'

# Create the admin user (this will automatically disable the localhost exception)
echo "Creating user: 'admin'"
kubectl -n realplay exec mongo-0 -- mongo --eval 'db.getSiblingDB("admin").createUser({user:"admin",pwd:"schdsvsbvj",roles:[{role:"root",db:"admin"}]});'
echo

#rs.initiate({ _id : "rs0", members: [ { _id : 0, host : "mongo-0.mongo:27017" }, { _id : 1, host : "mongo-1.mongo:27017" }, { _id : 2, host : "mongo-2.mongo:27017" }]});
