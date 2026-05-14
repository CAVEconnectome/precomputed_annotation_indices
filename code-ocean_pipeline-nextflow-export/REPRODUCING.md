This [Code Ocean](https://codeocean.com) Pipeline will allow you to run and reproduce the results of [Build precomputed annotation indices - TEMPLATE](https://codeocean.allenneuraldynamics.org/capsule/1541857/tree) on your local machine<sup>1</sup>. Follow the instructions below, or consult [our knowledge base](https://docs.codeocean.com/user-guide/compute-capsule-basics/managing-capsules/exporting-capsules-to-your-local-machine) for more information. Don't hesitate to reach out to [Support](mailto:support@codeocean.com) if you have any questions.

<sup>1</sup> You may need access to additional hardware and/or software licenses.

# Prerequisites

- [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html)
- [Docker Community Edition (CE)](https://www.docker.com/community-edition)
- [nvidia-container-runtime](https://docs.docker.com/config/containers/resource_constraints/#gpu) for code that leverages the GPU

# Instructions

## Download attached Data Assets

In order to fetch the Data Asset(s) this Pipeline depends on, download them into the Pipeline's `data` folder:
* [synapses_pni_2_v1_filtered_view__v1412__data-config](https://codeocean.allenneuraldynamics.org/data-assets/7c301f12-d69e-4e51-9b9d-9df03066bc1b) should be downloaded to `data/synapses_pni_2_v1_filtered_view__v1412__data-config`
* [synapses_pni_2_v1_filtered_view__v1412__test1](https://codeocean.allenneuraldynamics.org/data-assets/bacb8982-892d-437b-b732-de1257e7a398) should be downloaded to `data/synapses_pni_2_v1_filtered_view__v1412__test1`

## Log in to the Docker registry

In your terminal, execute the following command, providing your password or API key when prompted for it:
```shell
docker login -u keith.wiley@alleninstitute.org registry.codeocean.allenneuraldynamics.org
```

## Configure your Code Ocean credentials

In your terminal, execute the following commands and enter your password or API key when prompted for it:
```shell
export CO_USERNAME=keith.wiley%40alleninstitute.org
read -s -p "Enter Code Ocean password or API key: " CO_PASSWORD && echo && export CO_PASSWORD
```

## Run the Pipeline to reproduce the results

In your terminal, navigate to the `pipeline` folder within the folder where you've extracted the Pipeline and execute the following command, adjusting parameters as needed:
```shell
NXF_VER=24.10.4 DATA_PATH=$PWD/../data nextflow -c nextflow-codeocean.config -log ../results/nextflow/nextflow.log run main.nf -resume
```

Edit the `nextflow-codeocean.config` file found inside the same folder as needed.

See the `params` section for setting the different capsule parameters (by process name).

See the `containerOptions` parameter in each of the `withName` sections within the `process` section in order to set the corresponding capsules' secrets. Replace the environment variable values with the actual secret values. Alternatively, if you have any of the required environment variables already set in your environment, you can add an [`envWhitelist`](https://www.nextflow.io/docs/edge/config.html#scope-docker) parameter in the `docker` section and specify the relevant environment variable names there, and remove them from the relevant `containerOptions` parameters.

See [Nextflow configuration documentation](https://www.nextflow.io/docs/latest/config.html#configuration-file) for further details.
