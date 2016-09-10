# spark-kubernetes

Deploy Spark on Kubernetes

* Spark 2.0.0
* Hadoop 2.7.3

## Kubernetes

```
kubectl create -f spark-kubernetes.yaml
```

## Docker

Plagiarized from
[k8s images README](https://github.com/kubernetes-incubator/application-images/blob/master/spark/README.md). I'll
update soon. Sorry about that.

* `spark-master` - Runs a Spark master in Standalone mode and exposes a port for
Spark and a port for the WebUI.
* `spark-worker` - Runs a Spark worer in Standalone mode and connects to the
  Spark master via DNS name `spark-master`.

## Notes

* Removed the GCS connector from the [Kubernetes base Docker image](https://github.com/kubernetes-incubator/application-images/tree/master/spark)
* Uses Hadoop 2.7.3. Mesos instead?

## License

The `spark-kubernetes` project is licensed under the
[MIT License](http://opensource.org/licenses/MIT) and is freely available for
commercial and non-commerical usage. Please consult the licensing terms in the
`LICENSE` file for more details.

**NOTE**: this project is loosly based on the projects below, which are licensed
under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0):

* [Kubernetes Examples](https://github.com/kubernetes/kubernetes/tree/master/examples/spark)
* [Kubernetes Application Images](https://github.com/kubernetes-incubator/application-images/tree/master/spark)

Please consult the licensing terms for more details.
