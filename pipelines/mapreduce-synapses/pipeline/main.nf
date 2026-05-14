#!/usr/bin/env nextflow
// hash:sha256:0f49fb63888094a1fc8afc7f7bfe0449a93ff64507a99e118069dda7ea63b277

// capsule - Build precomputed annotation indices - generate config
process capsule_mapreduce_process_synapses_table_generate_config_28 {
	tag 'capsule-3464340'
	container "registry.codeocean.allenneuraldynamics.org/capsule/d24e6096-2a82-419b-93ec-3e204f35430d:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	val path29

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5_1
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_input_split_6_2
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_5
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_9
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_14
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_18
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_21
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_28
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_30
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_id_index_config_31_32
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_relation_index_config_32_33
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33_34
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_35
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_38
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_41

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=d24e6096-2a82-419b-93ec-3e204f35430d
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/synapses_pni_2_v1_filtered_view__v1412__data-config/$path29" "capsule/data/$path29" # id: 7c301f12-d69e-4e51-9b9d-9df03066bc1b

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-3464340.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-3464340.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mapreduce_process_synapses_table_generate_config_28_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate id index config
process capsule_mapreduce_process_synapses_table_generate_id_index_config_31 {
	tag 'capsule-1937527'
	container "registry.codeocean.allenneuraldynamics.org/capsule/5dfa81af-419f-4502-a687-826df62d8a69:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_8
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_13
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_26
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_36

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=5dfa81af-419f-4502-a687-826df62d8a69
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-1937527.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-1937527.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate input split ranges
process capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5 {
	tag 'capsule-5151080'
	container "registry.codeocean.allenneuraldynamics.org/capsule/fd0844b7-ca3c-4624-974a-dcf8bebf26cd:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/input_splits/*', emit: to_capsule_mapreduce_process_synapses_table_generate_input_split_6_3

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=fd0844b7-ca3c-4624-974a-dcf8bebf26cd
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-5151080.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-5151080.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate relation index config
process capsule_mapreduce_process_synapses_table_generate_relation_index_config_32 {
	tag 'capsule-5327370'
	container "registry.codeocean.allenneuraldynamics.org/capsule/c5c7b777-5cb7-4ff7-861a-1cb256362935:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_17
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_20
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_25
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_37

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=c5c7b777-5cb7-4ff7-861a-1cb256362935
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-5327370.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-5327370.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate spatial index config
process capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33 {
	tag 'capsule-8022733'
	container "registry.codeocean.allenneuraldynamics.org/capsule/b51c9b9f-fd0d-4615-8117-c1249a622ba7:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_6
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_24
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_31
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_40

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=b51c9b9f-fd0d-4615-8117-c1249a622ba7
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8022733.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8022733.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate input split
process capsule_mapreduce_process_synapses_table_generate_input_split_6 {
	tag 'capsule-0907746'
	container "registry.codeocean.allenneuraldynamics.org/capsule/48ba2489-9219-4b75-af28-7457e3234f5e:ed2d89c625ad20a8fbb2cff362ba70f2"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/row_splits.txt'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_11
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_23
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_42

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=48ba2489-9219-4b75-af28-7457e3234f5e
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/synapses_pni_2_v1_filtered_view__v1412__test1" "capsule/data/synapses_pni_2_v1_filtered_view__v1412__test1" # id: 74d431ed-d27e-4ad2-833c-dbcbfc03f634

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-0907746.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-0907746.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate shard worker ids
process capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30 {
	tag 'capsule-8295638'
	container "registry.codeocean.allenneuraldynamics.org/capsule/37c56921-a200-44d6-b575-88cac2ef8513:8cc4f6de2a1a5bd6036d40f08f286cef"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_4
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_39

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=37c56921-a200-44d6-b575-88cac2ef8513
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8295638.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8295638.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate shard worker ids
process capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42 {
	tag 'capsule-8295638'
	container "registry.codeocean.allenneuraldynamics.org/capsule/37c56921-a200-44d6-b575-88cac2ef8513:8cc4f6de2a1a5bd6036d40f08f286cef"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_10
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_12

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=37c56921-a200-44d6-b575-88cac2ef8513
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8295638.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8295638.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate shard worker ids
process capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43 {
	tag 'capsule-8295638'
	container "registry.codeocean.allenneuraldynamics.org/capsule/37c56921-a200-44d6-b575-88cac2ef8513:8cc4f6de2a1a5bd6036d40f08f286cef"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_16
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_22

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=37c56921-a200-44d6-b575-88cac2ef8513
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8295638.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8295638.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - build id index
process capsule_mapreduce_process_synapses_table_build_id_index_19 {
	tag 'capsule-7252776'
	container "registry.codeocean.allenneuraldynamics.org/capsule/d43d58b5-0064-4503-be30-04f7e4e4e5a6:3c8896be82cea0b281c8ea4cf85493c5"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_15

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=d43d58b5-0064-4503-be30-04f7e4e4e5a6
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-7252776.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-7252776.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - build relation index
process capsule_mapreduce_process_synapses_table_build_relation_index_24 {
	tag 'capsule-8542974'
	container "registry.codeocean.allenneuraldynamics.org/capsule/f6fde948-5201-4c3c-87fa-b1e7d5fee472:b95704bbb1f77364ce44212d08f85201"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_19

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=f6fde948-5201-4c3c-87fa-b1e7d5fee472
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8542974.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8542974.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - build spatial index oct tree
process capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44 {
	tag 'capsule-8927593'
	container "registry.codeocean.allenneuraldynamics.org/capsule/e93eaaf7-8292-49a9-b0a6-ed1c5f1d62b5:6c0af263ebf340660dff95c1be5a60bd"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_7

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=e93eaaf7-8292-49a9-b0a6-ed1c5f1d62b5
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8927593.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-8927593.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate id index shards
process capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22 {
	tag 'capsule-6379683'
	container "registry.codeocean.allenneuraldynamics.org/capsule/b0cc97d8-6408-4e74-b1de-36ff5cec39c4:3c8896be82cea0b281c8ea4cf85493c5"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=b0cc97d8-6408-4e74-b1de-36ff5cec39c4
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-6379683.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-6379683.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate relation index shards
process capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23 {
	tag 'capsule-2661788'
	container "registry.codeocean.allenneuraldynamics.org/capsule/bf946a18-ea80-4c3c-a881-40745d05e4c5:3c8896be82cea0b281c8ea4cf85493c5"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=bf946a18-ea80-4c3c-a881-40745d05e4c5
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-2661788.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-2661788.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - regroup spatial index oct tree splits
process capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18 {
	tag 'capsule-7023971'
	container "registry.codeocean.allenneuraldynamics.org/capsule/932d3df0-8f11-4afb-80df-b85aa9c7cb6a:b660205fb6525172b38010ad14ef239a"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_27

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=932d3df0-8f11-4afb-80df-b85aa9c7cb6a
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-7023971.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-7023971.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - reorganize directory structure
process capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27 {
	tag 'capsule-0430632'
	container "registry.codeocean.allenneuraldynamics.org/capsule/d855d6a4-6eb9-47a0-b578-cdc9eab36d29:7c0832bfeac063a79c04cc302357ef1c"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=d855d6a4-6eb9-47a0-b578-cdc9eab36d29
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-0430632.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@codeocean.allenneuraldynamics.org/capsule-0430632.git" capsule-repo
	fi
	git -C capsule-repo checkout HEAD --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

workflow {
	// input data
	synapses_pni_2_v1_filtered_view__v1412__data_config_to_build_precomputed_annotation_indices_generate_config_29 = Channel.fromPath("../data/synapses_pni_2_v1_filtered_view__v1412__data-config/*", type: 'any', relative: true)

	// run processes
	capsule_mapreduce_process_synapses_table_generate_config_28(synapses_pni_2_v1_filtered_view__v1412__data_config_to_build_precomputed_annotation_indices_generate_config_29)
	capsule_mapreduce_process_synapses_table_generate_id_index_config_31(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_id_index_config_31_32.collect())
	capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5_1.collect())
	capsule_mapreduce_process_synapses_table_generate_relation_index_config_32(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_relation_index_config_32_33.collect())
	capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33_34.collect())
	capsule_mapreduce_process_synapses_table_generate_input_split_6(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_6_2.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_6_3.flatten())
	capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_30.collect(), capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_31.collect())
	capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_35.collect(), capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_36.collect())
	capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43(capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_37.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_38.collect())
	capsule_mapreduce_process_synapses_table_build_id_index_19(capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_8.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_9.collect(), capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_10.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_6.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_11)
	capsule_mapreduce_process_synapses_table_build_relation_index_24(capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_20.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_21.collect(), capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_22.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_6.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_23)
	capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_39.collect(), capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_40.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_41.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_6.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_42)
	capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_12.flatten(), capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_13.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_14.collect(), capsule_mapreduce_process_synapses_table_build_id_index_19.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_15.collect())
	capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_16.flatten(), capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_17.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_18.collect(), capsule_mapreduce_process_synapses_table_build_relation_index_24.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_19.collect())
	capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_4.flatten(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_5.collect(), capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_6.collect(), capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_7.collect())
	capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27(capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_24.collect(), capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_25.collect(), capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_26.collect(), capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_27.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_28)
}
