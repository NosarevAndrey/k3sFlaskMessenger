# Flask Messenger App with PostgreSQL Database on k3s

This is a simple messenger app built using Flask for the backend and PostgreSQL for the database. The app is deployed using k3s.

## Running the App

To run the app on a k3s cluster, follow these steps:

1. Make sure you have k3s installed on your server. If not, you can [install k3s](https://k3s.io/) using the provided documentation.

2. Clone [this](https://github.com/NosarevAndrey/k3sFlaskMessenger.git) repository on your server:

3. Navigate to the cloned directory:

4. Run the launch script with the `-r` or `--run` option to deploy the app:
```
./launch.sh -r
```
This script will deploy the app on the k3s cluster.

5. Once the services are deployed, you can access the web app at:
<b>http://\<k3s-provided-host\>:30101/</b>

5. To delete a deployments you can use the same launch.sh script with `-d` or `--delete` option
```
./launch.sh -d
```


