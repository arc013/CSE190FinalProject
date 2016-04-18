# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cse_190_assi_1: 2 messages, 3 services")

set(MSG_I_FLAGS "-Icse_190_assi_1:/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cse_190_assi_1_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv" NAME_WE)
add_custom_target(_cse_190_assi_1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cse_190_assi_1" "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv" ""
)

get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg" NAME_WE)
add_custom_target(_cse_190_assi_1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cse_190_assi_1" "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg" ""
)

get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg" NAME_WE)
add_custom_target(_cse_190_assi_1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cse_190_assi_1" "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg" ""
)

get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv" NAME_WE)
add_custom_target(_cse_190_assi_1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cse_190_assi_1" "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv" ""
)

get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv" NAME_WE)
add_custom_target(_cse_190_assi_1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cse_190_assi_1" "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cse_190_assi_1
)
_generate_msg_cpp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cse_190_assi_1
)

### Generating Services
_generate_srv_cpp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cse_190_assi_1
)
_generate_srv_cpp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cse_190_assi_1
)
_generate_srv_cpp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cse_190_assi_1
)

### Generating Module File
_generate_module_cpp(cse_190_assi_1
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cse_190_assi_1
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cse_190_assi_1_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cse_190_assi_1_generate_messages cse_190_assi_1_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_cpp _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_cpp _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_cpp _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_cpp _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_cpp _cse_190_assi_1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cse_190_assi_1_gencpp)
add_dependencies(cse_190_assi_1_gencpp cse_190_assi_1_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cse_190_assi_1_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cse_190_assi_1
)
_generate_msg_eus(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cse_190_assi_1
)

### Generating Services
_generate_srv_eus(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cse_190_assi_1
)
_generate_srv_eus(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cse_190_assi_1
)
_generate_srv_eus(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cse_190_assi_1
)

### Generating Module File
_generate_module_eus(cse_190_assi_1
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cse_190_assi_1
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(cse_190_assi_1_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(cse_190_assi_1_generate_messages cse_190_assi_1_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_eus _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_eus _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_eus _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_eus _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_eus _cse_190_assi_1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cse_190_assi_1_geneus)
add_dependencies(cse_190_assi_1_geneus cse_190_assi_1_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cse_190_assi_1_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cse_190_assi_1
)
_generate_msg_lisp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cse_190_assi_1
)

### Generating Services
_generate_srv_lisp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cse_190_assi_1
)
_generate_srv_lisp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cse_190_assi_1
)
_generate_srv_lisp(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cse_190_assi_1
)

### Generating Module File
_generate_module_lisp(cse_190_assi_1
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cse_190_assi_1
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cse_190_assi_1_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cse_190_assi_1_generate_messages cse_190_assi_1_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_lisp _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_lisp _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_lisp _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_lisp _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_lisp _cse_190_assi_1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cse_190_assi_1_genlisp)
add_dependencies(cse_190_assi_1_genlisp cse_190_assi_1_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cse_190_assi_1_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cse_190_assi_1
)
_generate_msg_py(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cse_190_assi_1
)

### Generating Services
_generate_srv_py(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cse_190_assi_1
)
_generate_srv_py(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cse_190_assi_1
)
_generate_srv_py(cse_190_assi_1
  "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cse_190_assi_1
)

### Generating Module File
_generate_module_py(cse_190_assi_1
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cse_190_assi_1
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cse_190_assi_1_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cse_190_assi_1_generate_messages cse_190_assi_1_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestMapData.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_py _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/RobotProbabilities.msg" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_py _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/msg/temperatureMessage.msg" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_py _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/requestTexture.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_py _cse_190_assi_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/arnold1992/catkin_ws/src/CSE_190_PA1/srv/moveService.srv" NAME_WE)
add_dependencies(cse_190_assi_1_generate_messages_py _cse_190_assi_1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cse_190_assi_1_genpy)
add_dependencies(cse_190_assi_1_genpy cse_190_assi_1_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cse_190_assi_1_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cse_190_assi_1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cse_190_assi_1
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(cse_190_assi_1_generate_messages_cpp std_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cse_190_assi_1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cse_190_assi_1
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(cse_190_assi_1_generate_messages_eus std_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cse_190_assi_1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cse_190_assi_1
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(cse_190_assi_1_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cse_190_assi_1)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cse_190_assi_1\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cse_190_assi_1
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(cse_190_assi_1_generate_messages_py std_msgs_generate_messages_py)
