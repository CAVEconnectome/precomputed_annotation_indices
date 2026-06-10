#!/usr/bin/env nextflow
// hash:sha256:5814fd5704994ec46699ebdd64fa47fcc2550f75e35299f90fdae23433b7dc1a

// capsule - Build precomputed annotation indices - generate config
process capsule_mapreduce_process_synapses_table_generate_config_28 {
	tag 'capsule-3464340'
	container "$REGISTRY_HOST/capsule/d24e6096-2a82-419b-93ec-3e204f35430d:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	val path22

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5_1
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_input_split_6_3
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_21
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_23
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_id_index_config_31_25
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_relation_index_config_32_26
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33_27
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_28
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_31
	path 'capsule/results/*', emit: to_capsule_build_precomputed_annotation_indices_decompress_input_45_35

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

	ln -s "/tmp/data/synapses_pni_2_v1_filtered_view__v1412__data-config/$path22" "capsule/data/$path22" # id: 7c301f12-d69e-4e51-9b9d-9df03066bc1b

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3464340.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3464340.git" capsule-repo
	fi
	git -C capsule-repo checkout 4159a404a9487ec9210abe707b5c880bbecf1f5a --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mapreduce_process_synapses_table_generate_config_28_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - decompress input
process capsule_build_precomputed_annotation_indices_decompress_input_45 {
	tag 'capsule-9756628'
	container "$REGISTRY_HOST/capsule/7ffd8ca9-9e2a-4b24-9bdf-1135dbbc3089:3be6b563265d6f91797543b1c98ebbe4"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_input_split_6_2

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=7ffd8ca9-9e2a-4b24-9bdf-1135dbbc3089
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/synapses_pni_2_v1_filtered_view__v1412__test1" "capsule/data/synapses_pni_2_v1_filtered_view__v1412__test1" # id: bacb8982-892d-437b-b732-de1257e7a398

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9756628.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9756628.git" capsule-repo
	fi
	git -C capsule-repo checkout 36ab6d3fd02cdd01d89dd7b7f457b9a257d20a7c --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Build precomputed annotation indices - generate id index config
process capsule_mapreduce_process_synapses_table_generate_id_index_config_31 {
	tag 'capsule-1937527'
	container "$REGISTRY_HOST/capsule/5dfa81af-419f-4502-a687-826df62d8a69:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_7
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_19
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_29

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-1937527.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-1937527.git" capsule-repo
	fi
	git -C capsule-repo checkout db3e30c4486c8e08759da3b5000c0415efc756ca --quiet
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
	container "$REGISTRY_HOST/capsule/fd0844b7-ca3c-4624-974a-dcf8bebf26cd:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/input_splits/*', emit: to_capsule_mapreduce_process_synapses_table_generate_input_split_6_4

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5151080.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5151080.git" capsule-repo
	fi
	git -C capsule-repo checkout 449dc32537a6029acb9d7f41c4286b396cc270e6 --quiet
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
	container "$REGISTRY_HOST/capsule/c5c7b777-5cb7-4ff7-861a-1cb256362935:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_14
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_18
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_30

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5327370.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5327370.git" capsule-repo
	fi
	git -C capsule-repo checkout 90c0c7805297633e180976e13e5dd05972f46a16 --quiet
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
	container "$REGISTRY_HOST/capsule/b51c9b9f-fd0d-4615-8117-c1249a622ba7:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_17
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_24
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_33

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8022733.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8022733.git" capsule-repo
	fi
	git -C capsule-repo checkout 869d3df2625d2fa8330c1367d01584890ecabdb3 --quiet
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
	container "$REGISTRY_HOST/capsule/48ba2489-9219-4b75-af28-7457e3234f5e:ed2d89c625ad20a8fbb2cff362ba70f2"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/row_splits.txt'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_9
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_16
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_34

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

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0907746.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0907746.git" capsule-repo
	fi
	git -C capsule-repo checkout a7450fc3f0ca37003deefb6559e43ca6c7ba9c3e --quiet
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
	container "$REGISTRY_HOST/capsule/37c56921-a200-44d6-b575-88cac2ef8513:8cc4f6de2a1a5bd6036d40f08f286cef"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_5
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_32

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8295638.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8295638.git" capsule-repo
	fi
	git -C capsule-repo checkout 2e6a1930bbf0bb041683bfdd5eb056ca811672c2 --quiet
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
	container "$REGISTRY_HOST/capsule/37c56921-a200-44d6-b575-88cac2ef8513:8cc4f6de2a1a5bd6036d40f08f286cef"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_8
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_10

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8295638.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8295638.git" capsule-repo
	fi
	git -C capsule-repo checkout 2e6a1930bbf0bb041683bfdd5eb056ca811672c2 --quiet
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
	container "$REGISTRY_HOST/capsule/37c56921-a200-44d6-b575-88cac2ef8513:8cc4f6de2a1a5bd6036d40f08f286cef"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_12
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_15

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8295638.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8295638.git" capsule-repo
	fi
	git -C capsule-repo checkout 2e6a1930bbf0bb041683bfdd5eb056ca811672c2 --quiet
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
	container "$REGISTRY_HOST/capsule/d43d58b5-0064-4503-be30-04f7e4e4e5a6:3c8896be82cea0b281c8ea4cf85493c5"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_11

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7252776.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7252776.git" capsule-repo
	fi
	git -C capsule-repo checkout d76e7107ae5d3e8e745334baedd1518697d1e75f --quiet
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
	container "$REGISTRY_HOST/capsule/f6fde948-5201-4c3c-87fa-b1e7d5fee472:5ed5f71527f072bc48fe7046ac9057db"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_13

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8542974.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8542974.git" capsule-repo
	fi
	git -C capsule-repo checkout e4263ec20a369e2a840316cc577674d133d885e3 --quiet
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
	container "$REGISTRY_HOST/capsule/e93eaaf7-8292-49a9-b0a6-ed1c5f1d62b5:6c0af263ebf340660dff95c1be5a60bd"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_6

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8927593.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8927593.git" capsule-repo
	fi
	git -C capsule-repo checkout d3a66ba11bc9e5f1be6f232c4f7cdb9f64031ad7 --quiet
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
	container "$REGISTRY_HOST/capsule/b0cc97d8-6408-4e74-b1de-36ff5cec39c4:3c8896be82cea0b281c8ea4cf85493c5"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", mode: 'copy', saveAs: { filename -> new File(filename).getName() }

	input:
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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6379683.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6379683.git" capsule-repo
	fi
	git -C capsule-repo checkout 3949e9b77ad902f8a4d91e6db1a4ddb6acabdcdf --quiet
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
	container "$REGISTRY_HOST/capsule/bf946a18-ea80-4c3c-a881-40745d05e4c5:3c8896be82cea0b281c8ea4cf85493c5"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", mode: 'copy', saveAs: { filename -> new File(filename).getName() }

	input:
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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2661788.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2661788.git" capsule-repo
	fi
	git -C capsule-repo checkout 1f506a15305544a5fa6642375d81cde77d21789c --quiet
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
	container "$REGISTRY_HOST/capsule/932d3df0-8f11-4afb-80df-b85aa9c7cb6a:b660205fb6525172b38010ad14ef239a"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", mode: 'copy', saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*'
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_20

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7023971.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7023971.git" capsule-repo
	fi
	git -C capsule-repo checkout 71b34d71fdd6e0a8ca3b039f6a0e3e98910fc4fc --quiet
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
	container "$REGISTRY_HOST/capsule/d855d6a4-6eb9-47a0-b578-cdc9eab36d29:7c0832bfeac063a79c04cc302357ef1c"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", mode: 'copy', saveAs: { filename -> new File(filename).getName() }

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0430632.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0430632.git" capsule-repo
	fi
	git -C capsule-repo checkout c45985f775f633b92e3d6277cf8c3e7ac56b42f4 --quiet
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
	synapses_pni_2_v1_filtered_view__v1412__data_config_to_build_precomputed_annotation_indices_generate_config_22 = Channel.fromPath("../data/synapses_pni_2_v1_filtered_view__v1412__data-config/*", type: 'any', relative: true)

	// run processes
	capsule_mapreduce_process_synapses_table_generate_config_28(synapses_pni_2_v1_filtered_view__v1412__data_config_to_build_precomputed_annotation_indices_generate_config_22)
	capsule_build_precomputed_annotation_indices_decompress_input_45(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_build_precomputed_annotation_indices_decompress_input_45_35.collect())
	capsule_mapreduce_process_synapses_table_generate_id_index_config_31(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_id_index_config_31_25.collect())
	capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5_1.collect())
	capsule_mapreduce_process_synapses_table_generate_relation_index_config_32(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_relation_index_config_32_26.collect())
	capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33_27.collect())
	capsule_mapreduce_process_synapses_table_generate_input_split_6(capsule_build_precomputed_annotation_indices_decompress_input_45.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_6_2.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_6_3.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_6_4.flatten())
	capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_23.collect(), capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_24.collect())
	capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_28.collect(), capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_29.collect())
	capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43(capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_30.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_31.collect())
	capsule_mapreduce_process_synapses_table_build_id_index_19(capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_7.collect(), capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_8.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_6.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_9)
	capsule_mapreduce_process_synapses_table_build_relation_index_24(capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_14.collect(), capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_15.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_6.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_16)
	capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_32.collect(), capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_33.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_6.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_34)
	capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_10.flatten(), capsule_mapreduce_process_synapses_table_build_id_index_19.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_11.collect())
	capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_12.flatten(), capsule_mapreduce_process_synapses_table_build_relation_index_24.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_13.collect())
	capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_5.flatten(), capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_6.collect())
	capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27(capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_17.collect(), capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_18.collect(), capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_19.collect(), capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_20.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_21)
}
