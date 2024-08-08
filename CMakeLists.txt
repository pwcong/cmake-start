# 设置 CMake 最低要求版本
cmake_minimum_required(VERSION 3.14)

# 设置项目名称
project(cmakestart)

# 设置项目要使用的 C++ 标准版本
set(CMAKE_CXX_STANDARD 17)
# 设置项目 C++ 标准版本的要求是严格的
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# 设置了构建类型为 Debug 模式
set(CMAKE_BUILD_TYPE Debug)

# 设置变量存储目录路径
set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

# 设置变量存储文件列表
file(GLOB_RECURSE SRC_FILES ${SRC_DIR}/*)

# 设置变量存储目录路径
set(LIB_COMMON_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs/common)

# 关联头文件
include_directories(${LIB_COMMON_DIR}/include)
# 关联库文件
link_directories(${LIB_COMMON_DIR}/build)

# 指定文件列表构建为可执行文件
add_executable(${CMAKE_PROJECT_NAME} ${SRC_FILES})
# 指定可执行文件链接动态库
target_link_libraries(${CMAKE_PROJECT_NAME} common)