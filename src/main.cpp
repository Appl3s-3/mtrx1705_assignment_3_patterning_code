#include <fstream>
#include <string>
#include <sstream>
#include <iostream>
#include <cstdint>

#define GLFW_INCLUDE_NONE
#include "glad/gl.h"
#include "GLFW/glfw3.h"

#include "luna/Mouse.hpp"

struct Pattern {
    std::string pattern = "0";
    double clock_hertz = 0.0;
    bool cycle = false;
    bool valid = false;
};

Pattern pattern_from_file(std::string file_name);

int main(int argc, char** argv) {
    // Check that a pattern file path was given
    if (argc < 2) {
        std::cout << "No pattern file provided." << std::endl;
        return 0;
    }

    Pattern pattern;
    Pattern reload_pattern = pattern_from_file(argv[1]);

    if (reload_pattern.valid == false) {
        return 0;
    }

    pattern = reload_pattern;

    // Window Setup
    glfwInit();

    uint32_t window_width = 1000;
    uint32_t window_height = 700;
    const char* window_name = "Patterning Code";

    std::cout << "Creating window: " << window_name << ", with dimensions: ("
              << window_width << ", " << window_height << ")" << std::endl;
    
    // Version
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    // Remove deprecated functions
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GLFW_TRUE);

    // Enable debug context
    glfwWindowHint(GLFW_OPENGL_DEBUG_CONTEXT, GL_TRUE);

    // TODO: remove
    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

    GLFWwindow* window = glfwCreateWindow(window_width, window_height, window_name, NULL, NULL);
    if (window == NULL) {
        std::cout << "Failed to instantiate GLFW3 window." << std::endl;
    }
    
    glfwMakeContextCurrent(window);

    // Load GLAD2
    const int version = gladLoadGL(glfwGetProcAddress);
    if (version == 0) {
        std::cout << "Failed to find OpenGL context." << std::endl;
    }


    luna::Mouse mouse = luna::Mouse(window);

    glClearColor(0.0, 0.0, 0.0, 1.0);

    double start_time = glfwGetTime();
    double end_time = glfwGetTime();

    double frame_time = 1.0 / pattern.clock_hertz;
    uint32_t pattern_index = 0;
    uint32_t pattern_size = pattern.pattern.length();
    bool running = true;
    double speed = 1.0;

    // Window Loop
    while (glfwWindowShouldClose(window) == false) {
        glfwPollEvents();
        mouse.process();
        start_time = glfwGetTime();

        // Reload pattern
        if (mouse.button_down[1] == true) {
            reload_pattern = pattern_from_file(argv[1]);

            if (reload_pattern.valid == true) {
                pattern = reload_pattern;
                std::cout << "Reloaded Pattern:"
                          << "\nClock Hertz: "   << pattern.clock_hertz
                          << "\nCode: "          << pattern.pattern
                          << "\nCycle: "         << pattern.cycle
                          << std::endl;
                pattern_size = pattern.pattern.length();
                frame_time = 1.0 / pattern.clock_hertz;
                running = false;
                pattern_index = 0;
            }
        }

        // Run pattern
        if (mouse.button_down[0] == true) {
            running = true;
            speed = 1.0;
            std::cout << "Running Pattern at 1x speed." << std::endl;
            pattern_index = 0;
        }

        // Colour Select
        if (running == true) {
            // Don't cycle
            if (pattern.cycle == false) {
                // Stop running if the end of the pattern is reached.
                if (pattern_index >= pattern_size) {
                    glClearColor(0.0, 0.0, 0.0, 1.0);
                    running = false;
                    pattern_index = 0;
                }
            }
            // Cycle
            else {
                pattern_index %= pattern_size;
            }

            // Change the window colour to the one in the pattern
            switch (pattern.pattern[pattern_index]) {
            case '0':
                glClearColor(0.0, 0.0, 0.0, 1.0);
                break;
            case '1':
                glClearColor(1.0, 1.0, 1.0, 1.0);
                break;
            default:
                break;
            }

            ++pattern_index;
        }
        
        end_time = glfwGetTime();
        while ((end_time - start_time) < (frame_time * speed)) {
            end_time = glfwGetTime();
        }

        glClear(GL_COLOR_BUFFER_BIT);
        glfwSwapBuffers(window);
    }

    glfwTerminate();
    return 0;
}

Pattern pattern_from_file(std::string file_name) {
    // Input File Setup
    std::ifstream input_file(file_name);

    // The file failed to open
    if (input_file.is_open() == false) {
        std::cout << "Unable to open file: " << file_name << std::endl;
        return (Pattern){};
    }
    
    std::string line_buffer;
    std::string file_buffer;
    std::size_t line_count = 0;

    while (std::getline(input_file, line_buffer)) {
        file_buffer += line_buffer + "\n";
        ++line_count;
    }

    input_file.close();

    if (line_count < 3) {
        std::cout << "Expected at least two lines in the file." << std::endl;
        return (Pattern){};
    }

    std::stringstream file_buffer_stream(file_buffer);
    
    // Read the pattern from the file buffer
    Pattern pattern;
    std::getline(file_buffer_stream, line_buffer);
    pattern.clock_hertz = stod(line_buffer);
    std::getline(file_buffer_stream, line_buffer);
    pattern.pattern = line_buffer;
    std::getline(file_buffer_stream, line_buffer);
    pattern.cycle = stoi(line_buffer);
    pattern.valid = true;

    return pattern;
}
