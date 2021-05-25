# QuickStart

To setup a new AKS cluster on Azure, simple execute the launch-pad, it will create a new resources group and a new aks cluster.

```sh
./launch aks
```

To connect to your cluster using `kubectl`, run the following command (replace your-rg and your-aks with your resources group and aks name)

```sh
az aks get-credentials --resource-group <your-rg> --name <your-aks>