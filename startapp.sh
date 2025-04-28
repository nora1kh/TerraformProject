#!/bin/bash
 sudo systemctl list-units --type=service | grep chromadb
sudo systemctl list-units --type=service | grep backend
sudo systemctl list-units --type=service | grep frontend
# # Start ChromaDB Service
 echo "Starting ChromaDB..."
 sudo systemctl start chromadb.service
 #Start Backend Service (e.g., your Flask/Django app)
echo "Starting Backend..."
sudo systemctl start backend.service
# Start Frontend Service (Streamlit)
echo "Starting Frontend..."
sudo systemctl start frontend.service
sleep 5
# Optionally, monitor the services
echo "Monitoring Services..."
 sudo journalctl -u chromadb.service -f &
sudo journalctl -u backend.service -f &
sudo journalctl -u frontend.service -f &
# Wait to keep the script running
wait
