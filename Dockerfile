FROM armswdev/arm-tools:bare-metal-compilers

RUN sudo rm /var/lib/apt/lists/lock && \
sudo apt-get update -y && \
sudo apt-get upgrade -y && \
sudo apt-get -y --no-install-recommends install \
zip \
unzip \
gcc  \ 
python3  \
libpng-dev  \
ruby-full  \
gcovr  \
cmake
 
RUN sudo mkdir -p /src/workspace

VOLUME /src/workspace

# aarch64-none-elf-g++ --version && \

CMD cd /home/ubuntu/AC6/bin && \
ls -R && \
cd /src/workspace && \
armclang --version && \
armclang -mcpu=Cortex-M3 --target=arm-arm-none-eabi -o build\main main.c
cd build && \
zip --symlinks -r armclang-action-v1.0.0.zip . && \
exit
