cwd=$(shell pwd)

init:
	mkdir -p build && cd build  && cmake .. -DMNN_BUILD_CONVERTER=true && make -j8
	./tools/script/get_model.sh

linux:
	mkdir -p build/linux && cd build/linux && cmake -DMNN_BUILD_CONVERTER=ON ../../ && make -j4

osx:
	mkdir -p build/osx && cd build/osx && cmake -DMNN_BUILD_CONVERTER=ON ../../ && make -j4

win:
	mkdir -p build/windows && cd build/windows && cmake -DMNN_BUILD_CONVERTER=OFF ../../ && make -j4

armv8:
	mkdir -p build/arm/v8
	cd build/arm/v8  && sh $(cwd)/project/android/build_64_static.sh

ios:
	mkdir -p build/ios && cd build/ios && \
	cmake -DMNN_BUILD_CONVERTER=ON ../../ \
	-DPLATFORM=OS64 \
	-DMNN_METAL=ON \
	-DARCHS="arm64" \
	-DENABLE_BITCODE=0 \
	-DMNN_AAPL_FMWK=1 \
	-DMNN_SEP_BUILD=0 \
	-DMNN_ARM82=true \
	-DCMAKE_TOOLCHAIN_FILE=/opt/ios-cmake/ios.toolchain.cmake && \
	cmake --build . --config Release
