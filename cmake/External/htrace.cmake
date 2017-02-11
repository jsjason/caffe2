set(htrace_PREFIX ${PROJECT_SOURCE_DIR}/third_party/htrace/htrace-c/src)
message(STATUS "HTRACE DIR: ${htrace_PREFIX}")

if (UNIX)
  set(HTRACE_EXTRA_COMPILER_FLAGS "-fPIC")
endif()

set(HTRACE_CXX_FLAGS ${CMAKE_CXX_FLAGS} ${HTRACE_EXTRA_COMPILER_FLAGS})
set(HTRACE_C_FLAGS ${CMAKE_C_FLAGS} ${HTRACE_EXTRA_COMPILER_FLAGS})

ExternalProject_Add(htrace_external
  SOURCE_DIR ${htrace_PREFIX}
  BUILD_IN_SOURCE 1
  #CONFIGURE_COMMAND ""
  INSTALL_COMMAND ""
)

set(HTRACE_FOUND TRUE)
set(HTRACE_INCLUDE_DIRS ${htrace_PREFIX}/core)
set(HTRACE_LIBRARIES ${htrace_PREFIX}/libhtrace.so)
set(HTRACE_LIBRARY_DIRS ${htrace_PREFIX})
set(HTRACE_EXTERNAL TRUE)

list(APPEND external_project_dependencies htrace_external)
