# syntax=docker/dockerfile:1
FROM docker.io/xanderhendriks/stm32cubeide:latest

# Install gdown and xz-utils for Google Drive download and tar.xz extraction
RUN apt-get update && apt-get install -y python3-pip xz-utils && \
    pip3 install --no-cache-dir gdown && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory for downloads and installations
WORKDIR /opt

# Download the first file from Google Drive (replace file ID as needed)
RUN gdown --id 1nE0xGTReUyXe-7LopIMHy_SjU-chkotO -O file1_downloaded

# Download CoppeliaSim Edu for Ubuntu 24.04 (release v4.10.0 rev0)
RUN gdown --id 1nv03VwMYx-rTL6LsDK_DRu9CoeejBVjM -O CoppeliaSim_Edu_V4_10_0_rev0_Ubuntu24_04.tar.xz && \
    tar -xf CoppeliaSim_Edu_V4_10_0_rev0_Ubuntu24_04.tar.xz && \
    rm CoppeliaSim_Edu_V4_10_0_rev0_Ubuntu24_04.tar.xz

# Create a shortcut script to launch CoppeliaSim quickly without running at build
RUN ln -s /opt/CoppeliaSim_Edu_V4_10_0_rev0_Ubuntu24_04/coppeliaSim.sh /usr/local/bin/coppeliasim
RUN chmod +x /usr/local/bin/coppeliasim

# Set default working directory to home 
WORKDIR /root

# Entrypoint and CMD can remain as in base image or empty to not auto-run anything
ENTRYPOINT []
CMD ["/bin/bash"]
