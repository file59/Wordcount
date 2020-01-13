#include <iostream>
#include <memory>
#include <boost/program_options.hpp>
#include <chrono>
#include "parser.hpp"

namespace po = boost::program_options;

template <typename TimePoint>
std::chrono::milliseconds to_ms(TimePoint tp) {
    return std::chrono::duration_cast<std::chrono::milliseconds>(tp);
}

int main(int ac, char* av[]){
    try{
        po::options_description desc("Allowed options");
        desc.add_options()
                ("help,?", "Show help message")
                ("input-file,i",po::value<std::string>(), "Select file to use (mandatory)")
                ("thread,t",po::value<int>()->default_value(1),"Select how many threads to use (1 thread by default)")
                ("count,c","Prints a list of all (unique words) with the number of times they have appeared in the document")
                ("unique,u","Prints the number of unique words found in the document")
                ("total","Prints total number of words found in the document");

        po::variables_map vm;
        po::store(po::parse_command_line(ac, av, desc), vm);
        po::notify(vm);

        if(vm.count("help")){
            std::cout << desc << std::endl;
            return 0;
        }

        if(vm.count("input-file")){
            if(vm.count("count")||vm.count("frequency")||vm.count("unique")||vm.count("total")){ //at least one command must be selected else parsing the text would be useless
                std::unique_ptr<Parser> parser=std::make_unique<Parser>(vm["input-file"].as<std::string>(), vm["thread"].as<int>());

                auto start = std::chrono::high_resolution_clock::now();
                auto map = parser->parse();
                auto end = std::chrono::high_resolution_clock::now();
                std::cout << "Needed " << to_ms(end - start).count() << " ms to finish."<<std::endl;

                if(vm.count("count")){
                    std::string out = "--- Count ---\n";
                    auto it = map.begin();
                    while(it!=map.end()){
                        auto pair = *it;
                        out+=pair.first;
                        out+=": ";
                        out+=std::to_string(pair.second);
                        out+="\n";
                        ++it;
                    }
                    out+="-----------------";
                    std::cout << out << std::endl;
                }
                if(vm.count("unique")){
                    std::cout << "Unique word count: " << map.size() << std::endl;
                }
                if(vm.count("total")){
                    int i=0;
                    auto it = map.begin();
                    while(it!=map.end()){
                        auto pair = *it;
                        i+=pair.second;
                        ++it;
                    }
                    std::cout << "Total word count: " << i << std::endl;
                }
            }
        }else{
            throw std::runtime_error("Input file must be selected");
        }
    }catch(std::exception& e){
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }catch(...){
        std::cerr << "Exception of unknown type!\n";
    }
}