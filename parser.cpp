#include "parser.hpp"
#include <ctpl.hpp>
#include <fstream>
#include <future>
#include <vector>
#include <unordered_map>
#include <boost/algorithm/string.hpp>
#include <boost/algorithm/string_regex.hpp>

/**
 * Parse line
 * @return map of unique words and their count in the line
 */
std::unordered_map<std::string,int> parseLine(int threadId, const std::string& line){
    std::vector<std::string> words;
    boost::split_regex(words,line,boost::regex("[^a-zA-Z0-9]"));

    std::unordered_map<std::string,int> wordMap={};
    for(std::string& word : words){
        word.erase( std::remove_if( word.begin(), word.end(), ::isspace ), word.end() );
        if(!word.empty()) {
            std::transform(word.begin(), word.end(), word.begin(), ::tolower);
            auto it = wordMap.find(word); //check if word is already in map
            wordMap[word] = it != wordMap.end() ? (*it).second + 1 : 1; //if word is in map increment else 1
        }
    }

    return wordMap;
}

/**
 * Merge two maps and save result to the first
 * @param map2
 * @param map1
 */
void mergeMaps(std::unordered_map<std::string,int>& map1, const std::unordered_map<std::string,int>& map2){
    auto it = map2.begin();
    while(it != map2.end()){
        auto pair = (*it);
        auto exists = map1.find(pair.first);
        map1[pair.first] = exists != map1.end() ? pair.second + (*exists).second : pair.second;
        ++it;
    }
}

bool sortByValue(const std::pair<std::string,int> &a, const std::pair<std::string,int> &b){
    return (a.second < b.second);
}

Parser::Parser(std::string filePath, const int &threadCount) : filePath(std::move(filePath)), threadCount(threadCount){};

std::vector<std::pair<std::string, int>> Parser::parse(){
    std::ifstream inputFileStream(filePath);
    ctpl::thread_pool threadPool(threadCount);

    std::vector<std::future<std::unordered_map<std::string,int>>> results={};

    std::string line;
    while(std::getline(inputFileStream, line)){
        if(!line.empty()) {
            results.push_back(threadPool.push(parseLine, line));
        }
    }
    threadPool.stop(true);

    std::unordered_map<std::string,int> out;
    for(auto& result : results){
        mergeMaps(out, result.get());
    }

    std::vector<std::pair<std::string, int>> elems(out.begin(), out.end());
    std::sort(elems.begin(), elems.end(), sortByValue);
    return elems;
}