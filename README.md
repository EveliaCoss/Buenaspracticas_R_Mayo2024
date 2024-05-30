# Buenas practicas en R
Buenas practicas en R y creacion de paquetes en R, minicurso de 1 hora, en el [Hackaton 2024 de R-Ladies Morelia y R-Ladies Queretaro](https://github.com/R-Ladies-Morelia/CursosRladiesMorelia_RladiesQueretaro_2024/tree/main/Hackaton2024)

Fecha: 1 de Junio 2024

## Contenido 📌

- Presentacion

##  Pasos para crear un paquete 

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

Verificar la informacion que teniamos

```
?plot_volcano
```

- **Paso 4.** Vamos a verificar que el paquete se a creado ✏️
  
  - Practica: Descarga la carpeta completa `BestPractices/` para que tengas acceso a los datos que vamos a usar y scripts.
NOTA: Los datos de Expresion diferencial utilizados provienen de [aqui](https://4va.github.io/biodatasci/r-rnaseq-airway.html#deseq2_analysis). El procesamiento que se les dio se encuentra en el script DEG_example.R.  
    - data: Vamos a usar estos datos [DE_Treated_vs_control.csv](https://github.com/EveliaCoss/Buenaspracticas_R_Mayo2024/blob/main/BestPractices/practica/DEG_example/DE_Treated_vs_control.csv) generados a partir del script [DEG_example.R](https://github.com/EveliaCoss/Buenaspracticas_R_Mayo2024/blob/main/BestPractices/practica/DEG_example/DEG_example.R). 
    - Script de la funcion: [plot_volcano.R](https://github.com/EveliaCoss/Buenaspracticas_R_Mayo2024/blob/main/BestPractices/practica/R/plot_volcano.R).
    - Script final: [Empleo_funciones_ejemplo.R](https://github.com/EveliaCoss/Buenaspracticas_R_Mayo2024/blob/main/BestPractices/practica/Empleo_funciones_ejemplo.R).
 
### Referencias

[Curso de Joselyn Cristina Chávez Fuentes](https://comunidadbioinfo.github.io/cdsb2023/creaci%C3%B3n-de-vi%C3%B1etas.html); Me ayudo mucho este [Video](https://www.youtube.com/watch?v=7ZgZ6qUKZvE&ab_channel=DaniMedi)

