FROM ubuntu:jammy

WORKDIR /usr/src/PhotogrammetryTasks2026

# install gcc
RUN apt-get update
# RUN apt-get install -y gcc clang clang-tools cmake python3
RUN apt-get install -y gcc-11 clang cmake python3
# RUN apt-get install -y software-properties-common
# RUN apt-get install -y gcc-11

# install some required packages
RUN apt-get install -y wget unzip

# install OpenMP-dev
RUN apt-get install -y libomp-dev

# install Eigen
RUN apt-get install -y libeigen3-dev

# install Ceres
COPY .github/scripts/linux/install_ceres_solver.sh .
RUN chmod +x ./install_ceres_solver.sh
RUN ./install_ceres_solver.sh

# install OpenCV
COPY .github/scripts/linux/install_opencv.sh .
RUN chmod +x ./install_opencv.sh
RUN ./install_opencv.sh


# ENTRYPOINT ["bash -c", "echo Hello; cat"]
ENTRYPOINT ["tail", "-f", "/dev/null"]