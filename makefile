cwd=$(shell pwd)

init:
	mkdir -p build && cd build  && cmake .. -DMNN_BUILD_CONVERTER=true && make -j8
	./tools/script/get_model.sh

linux:
	mkdir -p build/linux && cd build/linux && cmake -DMNN_BUILD_CONVERTER=ON ../../ && make -j4


win:
	mkdir -p build/windown && cd build/windown && cmake -DMNN_BUILD_CONVERTER=OFF ../../ && make -j4


armv8:
	mkdir -p build/arm/v8
	cd build/arm/v8  && sh $(cwd)/project/android/build_64_static.sh

