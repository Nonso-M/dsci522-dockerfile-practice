FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

RUN mamba update --quiet --file /tmp/conda-linux-64.lock
# RUN mamba clean --all -y -f    #This line was still causing an error in Github actions, so I had to keep it cpommented
RUN fix-permissions "${CONDA_DIR}"
RUN fix-permissions "/home/${NB_USER}"
