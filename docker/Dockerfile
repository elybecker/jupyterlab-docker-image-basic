# ========== Fetch a Docker image ==========
FROM nvcr.io/nvidia/merlin/merlin-pytorch:22.07

# ========== Fetch Args ==========
ARG USER_ID
ARG USER_NAME

EXPOSE 8888

# ========== Install system dependencies ========== 
RUN apt-get update && apt-get install -y \
	curl tar tmux

# ========== Add user ==========
RUN apt-get -y install sudo
RUN useradd --no-log-init --system --uid ${USER_ID} \
    --create-home --shell /bin/bash ${USER_NAME}

#  Add new user docker to sudo group
RUN adduser ${USER_NAME} sudo
# Ensure sudo group users are not
# asked for a password when using
# sudo command by ammending sudoers file
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers

RUN sudo usermod -a -G dialout $USER_NAME


# install python packages
RUN pip install jupyter

WORKDIR /home/${USER_NAME}/workspace/
USER ${USER_NAME}