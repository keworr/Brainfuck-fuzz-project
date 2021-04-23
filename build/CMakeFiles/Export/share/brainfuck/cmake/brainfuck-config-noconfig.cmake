#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "brainfuck::brainfuck" for configuration ""
set_property(TARGET brainfuck::brainfuck APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(brainfuck::brainfuck PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "C"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libbrainfuck.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS brainfuck::brainfuck )
list(APPEND _IMPORT_CHECK_FILES_FOR_brainfuck::brainfuck "${_IMPORT_PREFIX}/lib/libbrainfuck.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
