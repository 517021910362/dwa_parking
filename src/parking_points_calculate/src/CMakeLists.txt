cmake_minimum_required(VERSION 2.8.3)
project(parking_points)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O3 -g ")

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  sensor_msgs
  parking_lot_msgs
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS
  roscpp
  std_msgs
  sensor_msgs
  parking_lot_msgs
)

include_directories(
	include
	${catkin_INCLUDE_DIRS}
)


add_executable(calculator
    src/main.cpp
    src/pointsCalculator.cpp)

target_link_libraries(calculator
  ${catkin_LIBRARIES}
)

add_dependencies(calculator ${catkin_EXPORTED_TARGETS})

