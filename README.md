# MARKOV IS COMING

---

## parse\_labyrinth

* citesc dimensiunile matricei salvate in vector si extrag m si n
* dupa citesc elementele matricei Labyrinth

---

## get\_adjacency\_matrix

* definesc starile de win (penultima linie si coloana) si win (ultima linie si coloana)
* verific conexiunile posibile in functie de bitul respectiv si consider si cazurile speciale de la margini

---

## get\_link\_matrix

* verific cate numere sunt diferite de 0
* impart fiecare conexiune la numarul de vecini, ca sa obtin probabilitati egale

---

## get\_Jacobi\_parameters

* ia dimensiunile Link (m x n)
* face G = Link(1\:m-2, 1\:n-2) (exclude WIN si LOSE, care nu participa la iteratii)
* face c = Link(1\:m-2, n-1) (penultima coloana e termenul constant pentru Jacobi)
* returneaza G si c

---

## perform\_iterative

* porneste cu x = x0 si i = 1. Logica: x0 e o estimare initiala
* intr-un ciclu:

  * salveaza x\_prev
  * calculeaza x = G \* x + c
  * daca norm(x - x\_prev) < tol, opreste
  * creste i
* calculeaza eroarea si pasii
* returneaza x, err, steps

---

## heuristic\_greedy

* incepe cu path = start\_position si marcheaza startul ca vizitat
* cat timp path nu e gol:

  * ia ultima pozitie
  * daca e WIN, opreste
  * daca nu sunt vecini, sterge ultima pozitie (backtracking)
  * altfel, alege vecinul cu probabilitatea maxima, marcheaza-l vizitat, adauga-l la path
* returneaza path

---

## decode\_path

* creeaza decoded\_path gol
* pentru fiecare path(i) (pana la penultimul):

  * calculeaza coloana: c = mod(path(i)-1, cols) + 1
  * calculeaza linia: l = floor((path(i)-1)/cols) + 1
  * adauga \[l, c] la decoded\_path
* returneaza decoded\_path

---

# LINEAR REGRESSION

---

## parse\_data\_set\_file

* citesc dimensiunile m (exemple) si n (caracteristici) din prima linie a fisierului text
* initializez Y (vector m x 1) si InitialMatrix (matrice celula m x n)
* sar peste linia goala si citesc fiecare linie, impartind-o in valori. Pentru fiecare linie, extrag Y(i) (prima valoare) si populez InitialMatrix verificand daca valorile sunt numerice sau text

---

## prepare\_for\_regression

* creez FeatureMatrix de dimensiune m x (n+1) din InitialMatrix (m x n)
* pentru fiecare linie i:

  * copiez valorile numerice direct in FeatureMatrix
  * pentru valorile text:
    yes devine 1, no devine 0
    semi-furnished devine \[1, 0], unfurnished devine \[0, 1], furnished devine \[0, 0]
* tin cont de pozitia in FeatureMatrix cu copy\_n

---

## linear\_regression\_cost\_function

* creez FM adaugand o coloana de 1 la FeatureMatrix
* calculez predictiile FM \* Theta, scot diferentele fata de Y, ridic la patrat si fac media: (1/(2\*m)) \* sum(...), urmarind formula descrisa in pdf

---

## parse\_csv\_file

* citesc fisierul CSV si sar peste prima linie (antetul)
* definesc un format pentru citire (%f %f %d %d %d %s %s %s %s %s %d %s %s) si citesc datele cu textscan, folosind virgula ca delimitator

---

## lasso\_regression\_cost\_function

* creez FM cu o coloana de 1
* calculez term1: (1/m) \* sum((FM \* Theta - Y).^2), urmarind formula descrisa in pdf
* adaug term2: lambda \* sum(abs(Theta))
* returnez suma termenilor

---

## normal\_equation

* calculeaza vectorul de greutati Theta folosind metoda gradientului conjugat pentru ecuatia normala, folosind formulele invatate

---

## ridge\_regression\_cost\_function

* creez FM cu o coloana de 1
* calculez termenul1: (1/(2\*m)) \* sum((FM \* Theta - Y).^2), urmarind formula descrisa in pdf
* calculez termenul2: lambda \* sum(Theta(2\:end).^2), urmarind formula descrisa in pdf
* returnez suma celor doi termeni

---

# MINST 101

---

## split\_dataset

* generez o permutare aleatoare a indicilor de la 1 la m cu randperm
* reordonez X si y folosind permutarea
* calculez dimensiunea setului de antrenare cu floor(m \* percent), asigurand ca este un numar intreg
* impart X si y in seturi de antrenare (X\_train, y\_train) si testare (X\_test, y\_test)

---

## load\_dataset

* sar peste primele trei linii cu fgetl
* citesc linia cu numarul de randuri (m) si o convertesc la numar, eliminand prefixul # rows, procedand analog pentru numarul de coloane
* initializez X ca matrice m x n cu zerouri si citesc m linii, fiecare continand n numere, folosind sscanf
* sar peste patru linii
* citesc numarul de randuri pentru y (my) si il convertesc

---
# octave-matlab
