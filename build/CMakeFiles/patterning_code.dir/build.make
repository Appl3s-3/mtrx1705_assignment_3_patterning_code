# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/build

# Include any dependencies generated for this target.
include CMakeFiles/patterning_code.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/patterning_code.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/patterning_code.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/patterning_code.dir/flags.make

CMakeFiles/patterning_code.dir/src/main.cpp.o: CMakeFiles/patterning_code.dir/flags.make
CMakeFiles/patterning_code.dir/src/main.cpp.o: /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/src/main.cpp
CMakeFiles/patterning_code.dir/src/main.cpp.o: CMakeFiles/patterning_code.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/patterning_code.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/patterning_code.dir/src/main.cpp.o -MF CMakeFiles/patterning_code.dir/src/main.cpp.o.d -o CMakeFiles/patterning_code.dir/src/main.cpp.o -c /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/src/main.cpp

CMakeFiles/patterning_code.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/patterning_code.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/src/main.cpp > CMakeFiles/patterning_code.dir/src/main.cpp.i

CMakeFiles/patterning_code.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/patterning_code.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/src/main.cpp -o CMakeFiles/patterning_code.dir/src/main.cpp.s

# Object files for target patterning_code
patterning_code_OBJECTS = \
"CMakeFiles/patterning_code.dir/src/main.cpp.o"

# External object files for target patterning_code
patterning_code_EXTERNAL_OBJECTS =

patterning_code: CMakeFiles/patterning_code.dir/src/main.cpp.o
patterning_code: CMakeFiles/patterning_code.dir/build.make
patterning_code: dependencies/lunaR/libluna.a
patterning_code: dependencies/lunaR/dependencies/glfw/src/libglfw3.a
patterning_code: /usr/lib/librt.a
patterning_code: /usr/lib/libm.so
patterning_code: /usr/lib/libGL.so
patterning_code: dependencies/lunaR/libglad.a
patterning_code: CMakeFiles/patterning_code.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable patterning_code"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/patterning_code.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/patterning_code.dir/build: patterning_code
.PHONY : CMakeFiles/patterning_code.dir/build

CMakeFiles/patterning_code.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/patterning_code.dir/cmake_clean.cmake
.PHONY : CMakeFiles/patterning_code.dir/clean

CMakeFiles/patterning_code.dir/depend:
	cd /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/build /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/build /home/appl3s/Documents/mtrx/mtrx1705_assignment_3_patterning_code/build/CMakeFiles/patterning_code.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/patterning_code.dir/depend
