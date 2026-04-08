# Precomputed annotation indices

This repo wraps a Code Ocean pipeline repo that produces various indices of precomputed annotations, crucially spatial indices to expedite rapid user interface interactions in Neuroglancer.

At the time of this writing, three indices are produced for a given input of annotation data:

1. ID index
2. Relation index
3. Spatial index

The resulting indices are uploaded to a Google bucket with an accompanying ***info*** file with Neuroglancer's expected folder/file structure to facilitate retrieval of the index (or parts thereof on the fly). The bucket will also contain a ***pipeline_config.json*** file that, amongst other data, provides the GCP bucket URI that Neuroglancer requires. Simply copy that URI from the json file and paste it into the Source field of a Neuroglancer annotation layer and the index will immediately be retrieved and displayed.

It is ***STRONGLY RECOMMENDED*** that you first attempt to build a set of annotation indices with a very small dataset first (a few thousand rows perhaps). If that works, you can subsequently attempt with a larger dataset.

Here are the steps to produce a precomputed annotation index from an annotation table:

1. Export the table from the database as a local CSV or Parquet file. Take note of the exact column names and ordering. You will need it.
2. Create a data config json file. The name doesn't matter.
	1. Start from the template provided in this repo and populate all the required fields (indicated in all-caps). This file must end up as legal JSON. Pass it through a JSON validator after you fill it in. Several are readily found online.
	2. Amongst other aspects of the data for this template, you will need:
		1. The size of the CSV file in bytes and rows (i.e., number of annotations).
		2. The spatial point lower and upper bounds. This is easiest — if a bit tedious — by line-scanning the CSV file to find the data bounds. I may attempt to incorporate this calculation into the pipeline at some future time, but without caching the results somehow (and enabling the pipeline to find such a cache), adding this calculation to the pipeline needlessly extends the pipeline running time on repeated attempts despite the fact that these bounds won't change from run to run.
	4. TODO: describe the process of filling in the template in greater detail.
3. Upload the CSV file and the data config json file to Code Ocean as two new Data Assets.
	1. TODO: provide some description of this process within the Code Ocean interface.
4. Open the Code Ocean pipeline: `https://codeocean.allenneuraldynamics.org/capsule/2041409/tree`

	<p align="center">
	<img src="./images/pipeline_template.png">
	</p>

5. Please don't use this pipeline. Instead, immediately duplicate it:
	1. In the upper-left corner, fine the menubar, and the left-most ***Pipeline*** menu. Expand that menu and select ***Duplicate***. Wait for it to process...

		<p align="center">
		<img src="./images/pipeline_template_pipeline_menu.png" width="33%">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="./images/pipeline_template_pipeline_menu_duplicate.png" width="33%" style="margin-left:50px">
		</p>

	2. Please confirm that you are working in a new pipeline. The pipeline's name along the top of the display will show "Copy of" if you were succesful.

		<p align="center">
		<img src="./images/pipeline_copy.png" width="33%">
		</p>

6. In the upper-left corner, along the left edge, vertically, notice ***Files***, ***App Builder***, and ***Tabs***. Select ***Files***. Next to the ***data*** section, notice, ***Manage*** with an associated gear icon. Click the Manage icon, which will open a chooser in the right half of the view.
	1. Find your new data config json asset and add it to the pipeline.
	2. Find your new data asset and add it to the pipeline.

	<p align="center">
	<img src="./images/data_asset_management.png" width="33%">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="./images/data_asset_management_data_config.png" width="33%" style="margin-left:50px">
	</p>

	<p align="center">
	<img src="./images/data_assets_added_to_pipeline.png">
	</p>

7. Drag both the data config asset and the data asset from the data section on the left half of the view to the "canvas". Place them in the upper-left region of the canvas so their connections will be easy to create.

	<p align="center">
	<img src="./images/data_assets_added_to_canvas.png" width="50%">
	</p>
	
8. Connect the data config asset to the ***generate config*** capsule by click-dragging from the asset's ***PLUS*** icon to the capsule icon. Connect the data asset (via its ***PLUS*** icon) to the ***generate input split*** capsule.

	<p align="center">
	<img src="./images/data_config_connected.png" width="33%">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="./images/data_connected.png" width="33%" style="margin-left:50px">
	</p>

	1. Click the config connection's gear icon to edit the connection:
		1. Under ***Destination***, add "data\_config.json" so it says "capsule/data/data\_config.json".
		2. Click Confirm.
	2. Edit the data connection:
		1. Change the ***Connection Type*** from Default to Collect.
		2. Click Confirm.

	<p align="center">
	<img src="./images/edit_config_connection.png" width="33%">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="./images/edit_data_connection.png" width="33%" style="margin-left:50px">
	</p>

10. In the upper-left corner, select ***App Builder***.

	<p align="center">
	<img src="./images/app_builder.png" width="50%">
	</p>
	
11. Set ***data\_config\_filename*** parameter to "data_config.json".
12. Set ***data\_source\_name*** parameter to the data size label indicated in your data config json file (in the json's "data_sizes" section). Here's a helpful way to find this string without going back to the json file on your local computer:
	1. Switch from the App Builder view to the Files view.
	2. Click the data config asset under the data folder. This will expand its drop-down view to reveal its contents, namely your json file.
	3. Click the json file. This will open the file in a new tab in the main display shared by the canvas.
	4. Find the "data_sizes" section. Then find the label you assigned, and copy it. You can then go back to the App Builder and paste it into the data\_source parameter.

	<p align="center">
	<img src="./images/app_builder_populated.png" width="50%">
	</p>
	
13. In the upper-right corner, notice the ***Run with parameters*** button. If you don't see it, toggle the ***Reproducibility*** option in the upper-right corner to reveal the button. Note that there is also a ***Run*** button in the App Builder you just updated; I think both buttons do the same thing. Click one of these buttons to run the pipeline.

	<p align="center">
	<img src="./images/reproducility_section_and_run_button.png" width="33%">
	</p>
	
14. You can observe the pipeline running on the canvas. Capsules in-process will be animated slightly, and connections actively passing data between assets or capsules will also be animated.

	<p align="center">
	<img src="./images/pipeline_running_1.png">
	</p>

	<p align="center">
	<img src="./images/pipeline_running_2.png">
	</p>
	
	It can take upwards of an hour for the pipeline to run on larger datasets. Take note of any failures and notify Keith. If all capsules end up with green success indictors, and there are no other indications of failure, then the pipeline has completed successfully.
		
	<p align="center">
	<img src="./images/pipeline_run_successfully_completed.png">
	</p>
	
15. Completed runs appear along the right side of the display (toggle ***Reproducibility*** in the upper-right to see this, as needed). Familiarize yourself with the file/folder structure of the results. They closely mirror the structure that is uploaded to the Google bucket. Click the ***pipeline\_config.json*** file to see it displayed. Some parts of this file will be similar to your input config file from above, but other parts will be new.

	<p align="center">
	<img src="./images/results.png" width="33%">
	</p>
	
	16. In the file find the ***NEUROGLANCER\_URI*** entry. It will have the form of `gs://keith-dev/ng_precomputed_annotations_unreleased/<SOME_TIMESTAMP>/`. Copy this value.

	<p align="center">
	<img src="./images/results_neuroglancer_uri.png">
	</p>
	
	17. In a Neuroglancer view, add a new layer. In the upper-right corner, select ***Source***, and paste the URI you just copied. Neuroglancer will immediately begin using the new three-part index.

	<p align="center">
	<img src="./images/neuroglancer.png">
	</p>
	
	18. The admin (Keith) has the option to move unreleased indices to a more public-facing URI (one that doesn't have "unreleased" in it). Ask Keith for help with this as needed.
18. Congratulations on what I'm confident was a flawless and satisfying experience.

