#---------------------------------
# INITIALISATION DES VARIABLES 
#---------------------------------

# Indiquer le compilateur
CXX= g++

# Les chemins ou se trouvent les fichiers a inclure
INCLUDE= -I/usr/include

# Options de compilation.
CXXFLAGS=  $(INCLUDE) -c -Wno-deprecated

# Les chemins ou se trouvent les librairies
LIBRARY_PATH= -L/usr/lib

# Options pour le linker.
LDFLAGS= $(LIBRARY_PATH) -o

# Les librairies avec lesquelles on va effectuer l'édition de liens
LIBS=  

# Les fichiers sources de l'application
FILES= main.cpp 

#-----------
# LES CIBLES
#-----------
exe :  $(FILES:.cpp=.o)
 	$(CXX) $(LDFLAGS) exe $(FILES:.cpp=.o) $(LIBS)

.PHONY : clean
clean:
	/bin/rm $(FILES:.cpp=.o) exe

#-----------------------------------------------------------------------------
# LES REGLES DE DEPENDANCE. Certaines sont implicites mais je recommande d'en 
# mettre une par fichier source. 
#-----------------------------------------------------------------------------
main.o:main.cpp

#---------------------------------
# REGLES DE COMPILATION IMPLICITES
#---------------------------------
%.o : %.cpp ; $(CXX) $(CXXFLAGS) $*.cpp
