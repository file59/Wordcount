#ifndef WORDCOUNT_CONTROLLER_H
#define WORDCOUNT_CONTROLLER_H

#include <string>
#include <vector>

class Parser{
private:
    std::string filePath;
    int threadCount;

public:
    Parser(std::string filePath, const int& threadCount);

    /**
     * Parse requested file
     * @return map of all (unique) words and their count
     */
    std::vector<std::pair<std::string, int>> parse();
};

#endif //WORDCOUNT_CONTROLLER_H