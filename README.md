# Buenas practicas en R
Buenas practicas en R y creacion de paquetes en R, minicurso de 1 hora, en el [Hackaton 2024 de R-Ladies Morelia y R-Ladies Queretaro](https://github.com/R-Ladies-Morelia/CursosRladiesMorelia_RladiesQueretaro_2024/tree/main/Hackaton2024)

Fecha: 1 de Junio 2024

Notas personales recabadas a partir de los tutoriales y ejemplos 😊. Espero que les funcione 💜

## Materiales informativos

- [Curso de Joselyn Cristina Chávez Fuentes](https://comunidadbioinfo.github.io/cdsb2023/creaci%C3%B3n-de-vi%C3%B1etas.html)
- Me ayudo mucho este [Video](https://www.youtube.com/watch?v=7ZgZ6qUKZvE&ab_channel=DaniMedi)
- [Documentación de funciones de Andrés Arredondo Cruz](https://comunidadbioinfo.github.io/cdsb2023/documentaci%C3%B3n-de-funciones.html)

💪 Estuve muy intensa viendo su codigo. Muchas gracias por tenerlos publico.

## Mi presentación 😏

- [Presentacion](https://eveliacoss.github.io/Buenaspracticas_R_Mayo2024/BestPractices/BestPractices_Bioinfo.html)

## Paquetes 📕

- [devtools](https://www.r-project.org/nosvn/pandoc/devtools.html) - Instalacion de paquetes de Github
- [roxygen2](https://github.com/r-lib/roxygen2)
- [docstring](https://cran.r-project.org/web/packages/docstring/vignettes/docstring_intro.html)
- [dplyr](https://dplyr.tidyverse.org/)
- [usethis](https://usethis.r-lib.org/)
- [ggplot2](https://ggplot2.tidyverse.org/)

### Instalación de paquetes

```
install.packages("devtools")
install.packages("roxygen2")
install.packages("docstring")
install.packages("dplyr")
install.packages("usethis")
install.packages("ggplot2")
```

## Pasos para escribir un buen software

1) Análisis del problema / Definir el problema

2) Diseño del algoritmo / Diseño del programa

3) Codificación / Escribir el código

4) Compilación y ejecución del programa

5) Verificación / Realizar pruebas

6) Depuración / Detectar los errores y corregirlos

> Programacion defensiva

7) Documentación

## Puntos claves para buenas practicas en bioinfo ⭐

1) Escriba programas para personas, no para computadoras (Documenta qué hace y por qué). - Se coherente en la nomenclatura, indentación y otros aspectos del estilo.

2) Divide los programas en *funciones cortas de un solo propósito. 💻 📚

3) No repitas tu código. Crea pasos reproducibles o que se repitan por si solas. ➰

4) Planifique los errores (Programacion defensiva) 🚩

5) Optimice el software sólo después de que funcione correctamente. - Si funciona no lo modifiques, simplificalo.

6) Colaborar - Busque siempre bibliotecas de software bien mantenidas que hagan lo que necesita. 👥

##  Pasos para crear un paquete 📌

Muy general, vamos a crear un paquete para nosotros, por lo que, solo funciona en nuestra compu.

- **Paso 1.** Almacenar cada funcion en `.R` y carpeta `R/` 📕 - [plot_volcano.R](https://github.com/EveliaCoss/Buenaspracticas_R_Mayo2024/blob/main/BestPractices/practica/R/plot_volcano.R)
- **Paso 2.** Crear el paquete con `usethis::create_package("directorio completo")` 📁

> Con esto:
> - Generar el directorio vignettes en caso que no exista.
> - Agregar dependencias en el archivo DESCRIPTION (por ejemplo, knitr necesario para construir viñetas dentro del paquete).
> - Abrir un templado en formato .Rmd para comenzar a escribir la viñeta, que se va a guardar en vignettes/mi_vignette.Rmd
> - Se va a crear un Rproject con el nombre de esta carpeta.

```
usethis::create_package("C:/Users/ecoss/OneDrive - CINVESTAV/Documentos/Github_notes/EveCoss_website/BestPractices/practica/")
```

- **Paso 3.** Cargar los vignette empleando `devtools::document()` 📑

Verificar la información que teniamos

```
?plot_volcano
```

- **Paso 4.** Vamos a verificar que el paquete se a creado ✏️
  
  - Practica: Descarga la carpeta completa `BestPractices/` para que tengas acceso a los datos que vamos a usar y scripts.
NOTA: Los datos de Expresion diferencial utilizados provienen de [aqui](https://4va.github.io/biodatasci/r-rnaseq-airway.html#deseq2_analysis). El procesamiento que se les dio se encuentra en el script DEG_example.R.  
    - data: Vamos a usar estos datos [DE_Treated_vs_control.csv](https://github.com/EveliaCoss/Buenaspracticas_R_Mayo2024/blob/main/BestPractices/practica/DEG_example/DE_Treated_vs_control.csv) generados a partir del script [DEG_example.R](https://github.com/EveliaCoss/Buenaspracticas_R_Mayo2024/blob/main/BestPractices/practica/DEG_example/DEG_example.R). 
    - Script de la funcion: [plot_volcano.R](https://github.com/EveliaCoss/Buenaspracticas_R_Mayo2024/blob/main/BestPractices/practica/R/plot_volcano.R).
    - Script final: [Empleo_funciones_ejemplo.R](https://github.com/EveliaCoss/Buenaspracticas_R_Mayo2024/blob/main/BestPractices/practica/Empleo_funciones_ejemplo.R).

