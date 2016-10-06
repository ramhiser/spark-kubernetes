# spark-kubernetes

Deploy Spark on Kubernetes

* Spark 2.0.1
* Hadoop 2.7.3

## Kubernetes

```
kubectl create -f kubernetes/namespace-spark-kubernetes.yaml
kubectl config set-context spark --namespace=spark-cluster --cluster=${CLUSTER_NAME} --user=${USER_NAME}
kubectl config use-context spark
kubectl create -f kubernetes/spark-kubernetes.yaml
```

(Plagiarized again! Fixme) After you know the master is running, you can use the
cluster proxy to connect to the Spark WebUI:

```
kubectl proxy --port=8001
```

At which point the UI will be available at [http://localhost:8001/api/v1/proxy/namespaces/spark-cluster/services/spark-webui/](http://localhost:8001/api/v1/proxy/namespaces/spark-cluster/services/spark-webui/)

### Example

Quick check that things are working with the Hello, World of text: count each word.

```
kubectl exec spark-worker-deployment-772324441-ihfk7 -it pyspark
```

When the PySpark prompt appears, run the following Python code:

```python
import os

spark_home = os.environ.get('SPARK_HOME', None)
text_file = sc.textFile(spark_home + "/README.md")

word_counts = text_file \
    .flatMap(lambda line: line.split()) \
    .map(lambda word: (word, 1)) \
    .reduceByKey(lambda a, b: a + b)
print word_counts.collect()
```



## Docker

The Docker images is available on Docker Hub. To pull the image, run:

```
docker pull ramhiser/spark:2.0.1
```

The image was build with the following:

```
cd docker
docker build -t ramhiser/spark:2.0.1 .
docker push ramhiser/spark:2.0.1
```

Plagiarized from
[k8s images README](https://github.com/kubernetes-incubator/application-images/blob/master/spark/README.md). I'll update soon. Sorry about that.

* `spark-master` - Runs a Spark master in Standalone mode and exposes a port for
Spark and a port for the WebUI.
* `spark-worker` - Runs a Spark worer in Standalone mode and connects to the
  Spark master via DNS name `spark-master`.

## Notes

* Removed the GCS connector from the [Kubernetes base Docker image](https://github.com/kubernetes-incubator/application-images/tree/master/spark)
* Uses Hadoop 2.7.3.

## License

The `spark-kubernetes` project is licensed under the
[MIT License](http://opensource.org/licenses/MIT) and is freely available for
commercial and non-commerical usage. Please consult the licensing terms in the
`LICENSE` file for more details.

**NOTE**: this project is loosely based on the projects below, which are licensed
under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0):

* [Kubernetes Examples](https://github.com/kubernetes/kubernetes/tree/master/examples/spark)
* [Kubernetes Application Images](https://github.com/kubernetes-incubator/application-images/tree/master/spark)

Please consult the licensing terms for more details.
