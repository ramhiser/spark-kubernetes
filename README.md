# spark-kubernetes

Deploy Spark on Kubernetes

* Spark 2.0.0
* Hadoop 2.7.3

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
