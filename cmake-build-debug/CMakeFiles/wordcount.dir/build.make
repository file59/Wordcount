# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake-3.16.2-Linux-x86_64/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.16.2-Linux-x86_64/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/d/CPP/wordcount

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/d/CPP/wordcount/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/wordcount.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/wordcount.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/wordcount.dir/flags.make

CMakeFiles/wordcount.dir/main.cpp.o: CMakeFiles/wordcount.dir/flags.make
CMakeFiles/wordcount.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/CPP/wordcount/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/wordcount.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/wordcount.dir/main.cpp.o -c /mnt/d/CPP/wordcount/main.cpp

CMakeFiles/wordcount.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wordcount.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/CPP/wordcount/main.cpp > CMakeFiles/wordcount.dir/main.cpp.i

CMakeFiles/wordcount.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wordcount.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/CPP/wordcount/main.cpp -o CMakeFiles/wordcount.dir/main.cpp.s

CMakeFiles/wordcount.dir/parser.cpp.o: CMakeFiles/wordcount.dir/flags.make
CMakeFiles/wordcount.dir/parser.cpp.o: ../parser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/CPP/wordcount/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/wordcount.dir/parser.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/wordcount.dir/parser.cpp.o -c /mnt/d/CPP/wordcount/parser.cpp

CMakeFiles/wordcount.dir/parser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wordcount.dir/parser.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/CPP/wordcount/parser.cpp > CMakeFiles/wordcount.dir/parser.cpp.i

CMakeFiles/wordcount.dir/parser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wordcount.dir/parser.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/CPP/wordcount/parser.cpp -o CMakeFiles/wordcount.dir/parser.cpp.s

# Object files for target wordcount
wordcount_OBJECTS = \
"CMakeFiles/wordcount.dir/main.cpp.o" \
"CMakeFiles/wordcount.dir/parser.cpp.o"

# External object files for target wordcount
wordcount_EXTERNAL_OBJECTS =

wordcount: CMakeFiles/wordcount.dir/main.cpp.o
wordcount: CMakeFiles/wordcount.dir/parser.cpp.o
wordcount: CMakeFiles/wordcount.dir/build.make
wordcount: /usr/lib/x86_64-linux-gnu/libboost_program_options.a
wordcount: /usr/lib/x86_64-linux-gnu/libboost_regex.a
wordcount: CMakeFiles/wordcount.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/d/CPP/wordcount/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable wordcount"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wordcount.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/wordcount.dir/build: wordcount

.PHONY : CMakeFiles/wordcount.dir/build

CMakeFiles/wordcount.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/wordcount.dir/cmake_clean.cmake
.PHONY : CMakeFiles/wordcount.dir/clean

CMakeFiles/wordcount.dir/depend:
	cd /mnt/d/CPP/wordcount/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/CPP/wordcount /mnt/d/CPP/wordcount /mnt/d/CPP/wordcount/cmake-build-debug /mnt/d/CPP/wordcount/cmake-build-debug /mnt/d/CPP/wordcount/cmake-build-debug/CMakeFiles/wordcount.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/wordcount.dir/depend

