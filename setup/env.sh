#!/bin/bash

# exit on errors
set -e
start_time=$(date +%s)

# setup the conda env
source $CONDA_ROOT/etc/profile.d/conda.sh
conda create -n mate python=3.11 -y -c anaconda
conda activate mate

# editable install of this repo
uv pip install -e '.[dev]'
pre-commit install

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))
elapsed_minutes=$((elapsed_time / 60))
echo "Created env: 'mate' with all packages in $elapsed_minutes minutes"
