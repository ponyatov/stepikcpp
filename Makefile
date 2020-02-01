CWD    = $(CURDIR)
MODULE = $(notdir $(CWD))

NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)

.PHONY: all
all: ./ab
	./$^

./%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^
./%: %.cc
	$(CXX) $(CXXFLAGS) -o $@ $^


.PHONY: clean
clean:
	rm -f hello inc1 quad


.PHONY: merge release zip

MERGE  = Makefile README.md *.cc .gitignore .vscode

merge:
	git checkout master
	git checkout shadow -- $(MERGE)

release:
	git tag $(NOW)-$(REL)
	git push -v && git push -v --tags
	git checkout shadow

zip:
	git archive --format zip --output $(MODULE)_src_$(NOW)_$(REL).zip HEAD
