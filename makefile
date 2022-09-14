cwd=$(shell pwd)

init:
	mkdir -p build && cd build  && cmake .. -DMNN_BUILD_CONVERTER=true && make -j8
	./tools/script/get_model.sh

build:
	mkdir build/linux && cd build/linux && cmake ../../ && make -j4

armv8:
	mkdir -p build/arm/v8
	cd build/arm/v8  && sh $(cwd)/project/android/build_64.sh

