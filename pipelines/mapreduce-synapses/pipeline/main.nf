#!/usr/bin/env nextflow
// hash:sha256:b9f4ee71eff9c6250d0f74d86f5cb0329583543eaa28504024980d84b145ed86

// capsule - MapReduce process synapses table - generate config
process capsule_mapreduce_process_synapses_table_generate_config_28 {
	tag 'capsule-3464340'
	container "$REGISTRY_HOST/capsule/d24e6096-2a82-419b-93ec-3e204f35430d:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	val path35

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5_1
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_input_split_6_2
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_combine_spatial_index_trees_13_5
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_by_shard_17_7
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_10
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_15
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_20
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_23
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_27
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_34
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_36
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_id_index_config_31_38
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_relation_index_config_32_39
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33_40
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_41
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_44
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_47

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

	ln -s "/tmp/data/spine_info_sample_bigger_clean__data-config/$path35" "capsule/data/data_config.json" # id: 8c48f26a-cf4e-4131-8751-2bc935427483

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3464340.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3464340.git" capsule-repo
	fi
	git -C capsule-repo checkout 92e6ad8264697967d32c9b357edb6406028e4d82 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mapreduce_process_synapses_table_generate_config_28_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate id index config
process capsule_mapreduce_process_synapses_table_generate_id_index_config_31 {
	tag 'capsule-1937527'
	container "$REGISTRY_HOST/capsule/5dfa81af-419f-4502-a687-826df62d8a69:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_14
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_19
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_32
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_42

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
	git -C capsule-repo checkout 376c223de8f2c38cef3afcb495da607058ef3220 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate input split ranges
process capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5 {
	tag 'capsule-5151080'
	container "$REGISTRY_HOST/capsule/fd0844b7-ca3c-4624-974a-dcf8bebf26cd:d432f008aaeb0d2a25c1c1fc28f26310"

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5151080.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5151080.git" capsule-repo
	fi
	git -C capsule-repo checkout 90cd9c132f7e08fa83a108c3a32ad62ee24a5b72 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate relation index config
process capsule_mapreduce_process_synapses_table_generate_relation_index_config_32 {
	tag 'capsule-5327370'
	container "$REGISTRY_HOST/capsule/c5c7b777-5cb7-4ff7-861a-1cb256362935:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_22
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_26
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_31
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_43

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
	git -C capsule-repo checkout c841af0151c843d66021fd9d024fadb75224aa8e --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate spatial index config
process capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33 {
	tag 'capsule-8022733'
	container "$REGISTRY_HOST/capsule/b51c9b9f-fd0d-4615-8117-c1249a622ba7:d432f008aaeb0d2a25c1c1fc28f26310"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_combine_spatial_index_trees_13_4
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_by_shard_17_8
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_11
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_30
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_37
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_46

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
	git -C capsule-repo checkout 7f94f05badc25928b127391a20d5fc7e123f3dbf --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate input split
process capsule_mapreduce_process_synapses_table_generate_input_split_6 {
	tag 'capsule-0907746'
	container "$REGISTRY_HOST/capsule/48ba2489-9219-4b75-af28-7457e3234f5e:ed2d89c625ad20a8fbb2cff362ba70f2"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/row_splits.txt'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_17
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_29
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_48

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

	ln -s "/tmp/data/spine_info_sample_bigger_1499995-rows" "capsule/data/spine_info_sample_bigger_1499995-rows" # id: bf353bad-a347-4e48-b390-e231f715e7d3

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0907746.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0907746.git" capsule-repo
	fi
	git -C capsule-repo checkout 9b380df69bb5906c895de8b8b0910b069d72c20a --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate shard worker ids
process capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30 {
	tag 'capsule-8295638'
	container "$REGISTRY_HOST/capsule/37c56921-a200-44d6-b575-88cac2ef8513:8cc4f6de2a1a5bd6036d40f08f286cef"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_12
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_45

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
	git -C capsule-repo checkout 6b879077582f5ccbd8ad73c02cf0d108b93a2e30 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate shard worker ids
process capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42 {
	tag 'capsule-8295638'
	container "$REGISTRY_HOST/capsule/37c56921-a200-44d6-b575-88cac2ef8513:8cc4f6de2a1a5bd6036d40f08f286cef"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_id_index_19_16
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_18

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
	git -C capsule-repo checkout 6b879077582f5ccbd8ad73c02cf0d108b93a2e30 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate shard worker ids
process capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43 {
	tag 'capsule-8295638'
	container "$REGISTRY_HOST/capsule/37c56921-a200-44d6-b575-88cac2ef8513:8cc4f6de2a1a5bd6036d40f08f286cef"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_24
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_build_relation_index_24_28

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
	git -C capsule-repo checkout 6b879077582f5ccbd8ad73c02cf0d108b93a2e30 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - build id index
process capsule_mapreduce_process_synapses_table_build_id_index_19 {
	tag 'capsule-7252776'
	container "$REGISTRY_HOST/capsule/d43d58b5-0064-4503-be30-04f7e4e4e5a6:d9dbe0c3248025dbb21d3edc94b3af70"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_21

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
	git -C capsule-repo checkout d34299b91b17d66b3da5d69571197c981cd9f5ee --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - build relation index
process capsule_mapreduce_process_synapses_table_build_relation_index_24 {
	tag 'capsule-8542974'
	container "$REGISTRY_HOST/capsule/f6fde948-5201-4c3c-87fa-b1e7d5fee472:b4568c5b17ded6490e68ad0415e0028c"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_25

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
	git -C capsule-repo checkout fbb16bc53ef1768a85038f8ad91a6e7c4affc5c6 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - build spatial index oct tree
process capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44 {
	tag 'capsule-8927593'
	container "$REGISTRY_HOST/capsule/e93eaaf7-8292-49a9-b0a6-ed1c5f1d62b5:6c0af263ebf340660dff95c1be5a60bd"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_13

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
	git -C capsule-repo checkout 70c24777ba0186eaf14702784bfb98df1604d60a --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate id index shards
process capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22 {
	tag 'capsule-6379683'
	container "$REGISTRY_HOST/capsule/b0cc97d8-6408-4e74-b1de-36ff5cec39c4:d9dbe0c3248025dbb21d3edc94b3af70"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/shard_worker_desc.txt'
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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6379683.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6379683.git" capsule-repo
	fi
	git -C capsule-repo checkout 752e6a99a198959621101e0f34398b43eeb219fb --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - generate relation index shards
process capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23 {
	tag 'capsule-2661788'
	container "$REGISTRY_HOST/capsule/bf946a18-ea80-4c3c-a881-40745d05e4c5:d9dbe0c3248025dbb21d3edc94b3af70"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/shard_worker_desc.txt'
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
	git -C capsule-repo checkout f1af24551f597f8f0eaf29e4453733bfd84f2d7a --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - regroup spatial index oct tree splits
process capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18 {
	tag 'capsule-7023971'
	container "$REGISTRY_HOST/capsule/932d3df0-8f11-4afb-80df-b85aa9c7cb6a:903d91296247507feded9235524757ec"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/shard_worker_desc.txt'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_combine_spatial_index_trees_13_6
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_33

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
	git -C capsule-repo checkout d2c408c81cbed81bcf27807eeddd8772b35899d5 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - combine spatial index oct tree splits
process capsule_mapreduce_process_synapses_table_combine_spatial_index_trees_13 {
	tag 'capsule-8662509'
	container "$REGISTRY_HOST/capsule/a1f95b5e-2dd2-49a8-a715-d595377c916b:77b90b4732cf98bcab486e64edeb2032"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mapreduce_process_synapses_table_conglomerate_by_shard_17_9

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=a1f95b5e-2dd2-49a8-a715-d595377c916b
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8662509.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8662509.git" capsule-repo
	fi
	git -C capsule-repo checkout 816dd67640856e9c9be639a0f9034842d5a6fcb6 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - reorganize directory structure
process capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27 {
	tag 'capsule-0430632'
	container "$REGISTRY_HOST/capsule/d855d6a4-6eb9-47a0-b578-cdc9eab36d29:7c0832bfeac063a79c04cc302357ef1c"

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
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0430632.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0430632.git" capsule-repo
	fi
	git -C capsule-repo checkout dd2ebbfac54b2520452bd227f6e170b964fdde3d --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MapReduce process synapses table - conglomerate spatial index by shard
process capsule_mapreduce_process_synapses_table_conglomerate_by_shard_17 {
	tag 'capsule-3039122'
	container "$REGISTRY_HOST/capsule/dfaef576-4534-4a1d-9265-a89cdedaedb1:7c0832bfeac063a79c04cc302357ef1c"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'
	path 'capsule/data/'
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=dfaef576-4534-4a1d-9265-a89cdedaedb1
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3039122.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3039122.git" capsule-repo
	fi
	git -C capsule-repo checkout c06d05fe6d8f2d6fee76fe5cb075d2db6b42b280 --quiet
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
	spine_info_sample_bigger_clean__data_config_to_mapreduce_process_synapses_table_generate_config_35 = Channel.fromPath("../data/spine_info_sample_bigger_clean__data-config/*", type: 'any', relative: true)

	// run processes
	capsule_mapreduce_process_synapses_table_generate_config_28(spine_info_sample_bigger_clean__data_config_to_mapreduce_process_synapses_table_generate_config_35)
	capsule_mapreduce_process_synapses_table_generate_id_index_config_31(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_id_index_config_31_38.collect())
	capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5_1.collect())
	capsule_mapreduce_process_synapses_table_generate_relation_index_config_32(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_relation_index_config_32_39.collect())
	capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33_40.collect())
	capsule_mapreduce_process_synapses_table_generate_input_split_6(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_6_2.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_ranges_and_worker_ids_5.out.to_capsule_mapreduce_process_synapses_table_generate_input_split_6_3.flatten())
	capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_36.collect(), capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30_37.collect())
	capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_41.collect(), capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42_42.collect())
	capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43(capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_43.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43_44.collect())
	capsule_mapreduce_process_synapses_table_build_id_index_19(capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_14.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_15.collect(), capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_16.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_6.out.to_capsule_mapreduce_process_synapses_table_build_id_index_19_17)
	capsule_mapreduce_process_synapses_table_build_relation_index_24(capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_26.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_27.collect(), capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_28.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_6.out.to_capsule_mapreduce_process_synapses_table_build_relation_index_24_29)
	capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_45.collect(), capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_46.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_47.collect(), capsule_mapreduce_process_synapses_table_generate_input_split_6.out.to_capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44_48)
	capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22(capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_42.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_18.flatten(), capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_19.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_20.collect(), capsule_mapreduce_process_synapses_table_build_id_index_19.out.to_capsule_mapreduce_process_synapses_table_conglomerate_id_index_by_shard_22_21.collect())
	capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23(capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_22.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_23.collect(), capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_43.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_24.flatten(), capsule_mapreduce_process_synapses_table_build_relation_index_24.out.to_capsule_mapreduce_process_synapses_table_conglomerate_relation_index_by_shard_23_25.collect())
	capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_10.collect(), capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_11.collect(), capsule_mapreduce_process_synapses_table_generate_shard_worker_ids_30.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_12.flatten(), capsule_mapreduce_process_synapses_table_build_spatial_index_oct_tree_44.out.to_capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18_13.collect())
	capsule_mapreduce_process_synapses_table_combine_spatial_index_trees_13(capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_combine_spatial_index_trees_13_4.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_combine_spatial_index_trees_13_5.collect(), capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18.out.to_capsule_mapreduce_process_synapses_table_combine_spatial_index_trees_13_6)
	capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27(capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_30.collect(), capsule_mapreduce_process_synapses_table_generate_relation_index_config_32.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_31.collect(), capsule_mapreduce_process_synapses_table_generate_id_index_config_31.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_32.collect(), capsule_mapreduce_process_synapses_table_regroup_worker_outputs_18.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_33.collect(), capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_reorganize_directory_structure_27_34)
	capsule_mapreduce_process_synapses_table_conglomerate_by_shard_17(capsule_mapreduce_process_synapses_table_generate_config_28.out.to_capsule_mapreduce_process_synapses_table_conglomerate_by_shard_17_7.collect(), capsule_mapreduce_process_synapses_table_generate_spatial_index_config_33.out.to_capsule_mapreduce_process_synapses_table_conglomerate_by_shard_17_8.collect(), capsule_mapreduce_process_synapses_table_combine_spatial_index_trees_13.out.to_capsule_mapreduce_process_synapses_table_conglomerate_by_shard_17_9)
}
