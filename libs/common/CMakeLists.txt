# 设置 CMake 最低要求版本
cmake_minimum_required(VERSION 3.14)

# 设置项目名称
project(common)

# 设置项目要使用的 C++ 标准版本
set(CMAKE_CXX_STANDARD 17)
# 设置项目 C++ 标准版本的要求是严格的
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# 设置了构建类型为 Release 模式
set(CMAKE_BUILD_TYPE Release)
# 添加全局编译选项的指令
add_compile_options(
   # 启用第二级别的优化
   -O2
   # 禁用断言
   -DNDEBUG
)

# 设置变量存储目录路径
set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
# 设置变量存储目录路径
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
# 设置变量存储目录路径
set(TESTS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/tests)

# 设置变量存储文件列表
file(GLOB_RECURSE SRC_FILES ${SRC_DIR}/*)
# 设置变量存储文件列表
file(GLOB_RECURSE TESTS_SRC_FILES ${TESTS_DIR}/*)

# 关联头文件
include_directories(${INCLUDE_DIR})

# 指定文件列表构建为动态库
add_library(${CMAKE_PROJECT_NAME} SHARED ${SRC_FILES})

# 下载 googletest 框架并构建测试用例可执行产物
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
  DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)
enable_testing()
add_executable(tests ${TESTS_SRC_FILES} ${SRC_FILES})
target_link_libraries(tests GTest::gtest_main)
include(GoogleTest)
gtest_discover_tests(tests)