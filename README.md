# Precomputed annotation indices

This repo wraps a Code Ocean pipeline repo that produces various indices of precomputed annotations, crucially spatial indices to expedite rapid user interface interactions in Neuroglancer.

At the time of this writing, three indices are produced for a given input of annotation data:

1. ID index
2. Relation index
3. Spatial index

The resulting indices are uploaded to a Google bucket with an accompanying ***info*** file with Neuroglancer's expected folder an file structure to facilitate retrieval of the index (or parts thereof). The bucket will also contain a ***pipeline_config*** json file that, amongst other data, provides the GCP bucket URI that Neuroglancer requires. Simply copy that URI from the json file and paste it into the Source field of a Neuroglancer annotation layer and the index will immediately be retrieved and displayed.

Here are the steps to produce an annotation index from an annotation table:

1. Export the table from the database as a local CSV or Parquet file.
2. Create a data config json file:
	1. Start from the template provided in this repo and populate the indicated fields.
	2. TODO: describe this process.
3. Upload the file to Code Ocean as a new Data Asset.
	1. TODO: provide some description of this process within the Code Ocean interface.
4. Open the Code Ocean pipeline: `https://codeocean.allenneuraldynamics.org/capsule/9094939/tree`
5. Please don't use this pipeline. Instead, immediately duplicate it:
	1. In the upper-left corner, fine the menubar, and the left-most Pipeline menu. Expand that menu and select Duplicate. Wait for it to process...
	1. Please confirm that you are working in a new pipeline. The name will show "Copy of" if you were succesful.
8. In the upper-left corner, along the left edge, notice Files, App Builder, Tabs. Select Files. Next to the data section, notice, Manage with an associated gear icon. Click it, which will open a chooser on the right half of the view. Find your new data asset and add it to the pipeline.
9. Drag the data asset from the data section on the left half of the view to the "canvas". Place it in the upper-left region of the canvas.