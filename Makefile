.PHONY: all
all: ./hello
	./$^

./%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^
