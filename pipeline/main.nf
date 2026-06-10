#!/usr/bin/env nextflow
// hash:sha256:73b2532f6810bde944bc015ae8109fc1b71d3fc46e906bce42c641bf90d25c5c

// capsule - Build precomputed annotation indices - all capsules via git
process capsule_build_precomputed_annotation_indices_all_capsules_via_git_2 {
	tag 'capsule-8624197'
	container "$REGISTRY_HOST/capsule/0c8a3417-e218-421f-b4ef-9c58e41fe4fd:30606f34b4f7c569dab64f37065df9d5"

	cpus 1
	memory '7.5 GB'

	input:
	val path1

	output:
	path 'capsule/results/*', emit: to_capsule_build_precomputed_annotation_indices_all_capsules_via_git_3_2

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=0c8a3417-e218-421f-b4ef-9c58e41fe4fd
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/synapses_pni_2_v1_filtered_view__v1412__data-config/$path1" "capsule/data/$path1" # id: 7c301f12-d69e-4e51-9b9d-9df03066bc1b

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8624197.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8624197.git" capsule-repo
	fi
	git -C capsule-repo checkout f483a3fcc14eceb149d7084b3865cf77e161e6bd --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_build_precomputed_annotation_indices_all_capsules_via_git_2_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - all capsules via git
process capsule_build_precomputed_annotation_indices_all_capsules_via_git_3 {
	tag 'capsule-8624197'
	container "$REGISTRY_HOST/capsule/0c8a3417-e218-421f-b4ef-9c58e41fe4fd:30606f34b4f7c569dab64f37065df9d5"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", mode: 'copy', saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=0c8a3417-e218-421f-b4ef-9c58e41fe4fd
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8624197.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8624197.git" capsule-repo
	fi
	git -C capsule-repo checkout f483a3fcc14eceb149d7084b3865cf77e161e6bd --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_build_precomputed_annotation_indices_all_capsules_via_git_3_args}

	echo "[${task.tag}] completed!"
	"""
}

workflow {
	// input data
	synapses_pni_2_v1_filtered_view__v1412__data_config_to_build_precomputed_annotation_indices_all_capsules_via_git_1 = Channel.fromPath("../data/synapses_pni_2_v1_filtered_view__v1412__data-config/*", type: 'any', relative: true)

	// run processes
	capsule_build_precomputed_annotation_indices_all_capsules_via_git_2(synapses_pni_2_v1_filtered_view__v1412__data_config_to_build_precomputed_annotation_indices_all_capsules_via_git_1)
	capsule_build_precomputed_annotation_indices_all_capsules_via_git_3(capsule_build_precomputed_annotation_indices_all_capsules_via_git_2.out.to_capsule_build_precomputed_annotation_indices_all_capsules_via_git_3_2)
}
