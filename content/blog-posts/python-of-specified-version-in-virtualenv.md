+++
author = ""
date = ""
draft = true
hero = ""
tags = []
title = "Python of specified version in virtualenv"
type = "blog"

+++
We will need 2 tools for making virual env with required python

pyenv - for providing python version

    pyenv install 3.6.15
   
virtualenv - for making virtualenvs

	virtualenv -p=/Users/mac/.pyenv/versions/3.6.15/bin/python venv
   
this will created venv dir with desired python, installed on previous step

	source venv/bin/activate