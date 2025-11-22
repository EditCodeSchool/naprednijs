# 1. Uzimamo baznu sliku
FROM jupyter/base-notebook:latest

# 2. Prelazimo na 'root' korisnika
USER root

# 3. Instaliramo alate
RUN apt-get update && apt-get install -y curl unzip

# 4. Instaliramo Deno
ENV DENO_INSTALL=/usr/local
RUN curl -fsSL https://deno.land/install.sh | sh

# --- NOVI KLJUČNI DIO ---
# 5. Ručno kopiramo sve vaše datoteke u Binder
COPY . /home/jovyan
# 6. Popravljamo dozvole da ih Binder može čitati
RUN chown -R 1000:100 /home/jovyan
# ------------------------

# 7. Vraćamo se na običnog korisnika
USER ${NB_UID}

# 8. Instaliramo kernel
RUN deno jupyter --unstable --install
