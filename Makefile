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


cmake:
	cd adcirc/work ;\
	cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=gcc -DCMAKE_Fortran_COMPILER=gfortran -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_LIBADCIRC_SHARED=ON -DBUILD_LIBADCIRC_SHARED=ON -DBUILD_SWAN=OFF -DBUILD_UTILITIES=OFF -DBUILD_ADCSWAN=OFF -DBUILD_PADCSWAN=OFF  -DBUILD_PUNSWAN=OFF -DADDITIONAL_FLAGS_SWAN="-ffixed-line-length-132 -ffree-line-length-132" -DENABLE_OUTPUT_NETCDF=ON -DNETCDF_LIBRARIES="/opt/homebrew/Cellar/netcdf/4.8.1_3/bin" -DFortran_LINELENGTH_FLAG="-ffixed-line-length-132 -ffree-line-length-132" -DCMAKE_Fortran_FLAGS="-ffree-line-length-132  -ffixed-line-length-132 -w -fallow-argument-mismatch -O2" ;\
	make ;\
	cd ../.. ;


make:
	cd adcirc/work ;\
	make ;\
	cd ../..
