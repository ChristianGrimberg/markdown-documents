FROM mcr.microsoft.com/vscode/devcontainers/base:debian

RUN apt-get update \
    && apt-get install -y pandoc texlive-fonts-recommended texlive-latex-recommended

# Clear aptitude files
RUN rm -rf /var/lib/apt/lists/*

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
