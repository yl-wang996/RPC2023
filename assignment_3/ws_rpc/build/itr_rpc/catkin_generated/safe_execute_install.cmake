execute_process(COMMAND "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
