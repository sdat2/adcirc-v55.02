PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME = seager19
PYTHON_INTERPRETER = python3
PYTHON_ENV_VERSION = 3.8
ifeq (,$(shell which conda))
HAS_CONDA=False
else
HAS_CONDA=True
endif


repo:
	git clone https://github.com/sdat2/adcircpy.git
	cd adcircpy
	git checkout sdat2
	cd ..
	git clone https://github.com/sdat2/adcirc-testsuite.git
	cd adcirc-testsuite
	git checkout sdat2
	cd ..

branch:
	cd adcircpy
	git checkout sdat2
	cd ..
	cd adcirc-testsuite
	git checkout sdat2
	cd ..


env:
ifeq (True,$(HAS_CONDA))
	@echo ">>> Detected conda, creating conda environment."
	
	# Create the conda environment
	conda env create --prefix=./env -f requirements/environment.yml

	@echo ">>> New conda env created. Activate from project directory with:\nconda activate ./env"
else
	@echo ">>> No conda detected. Falling back to virtualenv instead. The python verison will be that of your python3 interpreter."
	$(PYTHON_INTERPRETER) -m pip install -q virtualenv virtualenvwrapper
	@echo ">>> Installing virtualenvwrapper if not already installed.\nMake sure the following lines are in shell startup file\n\
	export WORKON_HOME=$$HOME/.virtualenvs\nexport PROJECT_HOME=$$HOME/Devel\nsource /usr/local/bin/virtualenvwrapper.sh\n"
	@bash -c "source `which virtualenvwrapper.sh`;mkvirtualenv $(PROJECT_NAME) --python=$(PYTHON_INTERPRETER)"
	@echo ">>> New virtualenv created. Activate with:\nworkon $(PROJECT_NAME)"
endif