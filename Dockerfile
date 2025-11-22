# 1. Uzimamo baznu sliku koja već ima Jupyter
FROM jupyter/base-notebook:latest

# 2. Prelazimo na 'root' korisnika da možemo instalirati programe
USER root

# 3. Instaliramo alate potrebne za skidanje Dena (curl i unzip)
RUN apt-get update && apt-get install -y curl unzip

# 4. Instaliramo Deno u mapu dostupnu svima
ENV DENO_INSTALL=/usr/local
RUN curl -fsSL https://deno.land/install.sh | sh

# 5. Vraćamo se na običnog korisnika (Jupyter pravila)
USER ${NB_UID}

# 6. Instaliramo Deno kernel da ga Jupyter vidi
RUN deno jupyter --unstable --install
