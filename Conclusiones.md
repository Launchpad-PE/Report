# Conclusiones

# AV1

El desarrollo de Foundly como plataforma web de colaboración y gestión de proyectos 
permitió al equipo DevWeb contrastar los supuestos iniciales del proceso Lean UX con 
los resultados obtenidos durante las etapas de validación, identificando brechas, 
confirmaciones y oportunidades de mejora que orientan los siguientes pasos del producto.

### En relación a los Problem Statements

1. **Problem Statement 1 — Dificultad para conformar equipos y gestionar proyectos 
de forma transparente** — El equipo planteó que los emprendedores y estudiantes en 
Latinoamérica carecen de plataformas que integren la formación de equipos 
multidisciplinarios con la gestión transparente de proyectos en un solo ecosistema. 
Las entrevistas y validaciones realizadas confirmaron este diagnóstico: los usuarios 
entrevistados reportaron haber recurrido a múltiples herramientas desconectadas — 
grupos de WhatsApp, formularios de Google y hojas de cálculo compartidas — para 
coordinar sus proyectos. Foundly logró integrar estas necesidades en una sola 
plataforma, aunque se identificó que la adopción inicial requiere un esfuerzo 
adicional de onboarding para usuarios sin experiencia previa en herramientas de 
gestión colaborativa.

2. **Problem Statement 2 — Alta tasa de fracaso de startups por falta de cohesión 
en equipos y gestión ineficiente** — Las validaciones confirmaron que el 23% de las 
startups fracasan por problemas en los equipos fundadores, según los datos 
documentados en los antecedentes. El sistema de postulación, gestión de hitos y 
publicación de evidencias implementado en Foundly fue valorado positivamente por los 
usuarios validadores, quienes destacaron la transparencia del seguimiento como el 
elemento que más confianza genera entre los miembros del equipo y los potenciales 
colaboradores.

### En relación a los Assumptions

1. **Assumption sobre el comportamiento del Emprendedor** — Se asumió que los 
emprendedores estarían dispuestos a publicar su proyecto públicamente desde etapas 
tempranas para atraer colaboradores. Las validaciones mostraron que este supuesto 
es parcialmente correcto: los emprendedores con mayor experiencia previa aceptaron 
la exposición pública sin inconvenientes, mientras que los emprendedores más jóvenes 
mostraron resistencia por temor a que su idea fuera replicada. Esto sugiere la 
necesidad de incorporar mecanismos de acceso por invitación o visibilidad controlada 
en versiones futuras del producto.

2. **Assumption sobre el comportamiento del Colaborador** — Se asumió que los 
estudiantes y profesionales jóvenes se postularían a proyectos motivados 
principalmente por la experiencia práctica y la visibilidad en su portafolio. Las 
validaciones confirmaron este supuesto en su totalidad: los colaboradores 
entrevistados priorizaron la calidad del proyecto y la claridad de los roles por 
encima de la compensación económica, lo que valida el modelo de participación con 
sistema de reputación propuesto por Foundly.

3. **Assumption sobre el panel IoT** — Se asumió que mostrar datos de sensores en 
tiempo real dentro de un proyecto aumentaría la confianza de los colaboradores y 
visitantes. Las validaciones confirmaron que el panel IoT fue el elemento que más 
llamó la atención durante las sesiones de demostración. Los usuarios señalaron que 
tendrían mayor disposición a unirse a un proyecto que demuestra que su prototipo 
funciona con datos reales, lo que valida el módulo IoT como diferenciador clave de 
la plataforma.

### En relación a los Hypothesis Statements y criterios de éxito

1. **Hipótesis 1 — Al menos el 50% de los proyectos activos contarán con un equipo 
completo en los primeros 3 meses** — Las validaciones mostraron que la funcionalidad 
de postulación fue la más utilizada durante las pruebas. Los usuarios completaron el 
proceso de solicitud de unión en menos de 3 minutos, lo que indica que el flujo está 
correctamente diseñado. Se estima que el criterio es alcanzable con la implementación 
del motor de recomendaciones propuesto en el roadmap y una base de usuarios activos 
suficiente.

2. **Hipótesis 2 — Al menos el 15% de los usuarios activos adquirirán el plan 
Premium en el primer año** — Durante las validaciones, 4 de cada 5 usuarios 
entrevistados expresaron interés en el plan Premium al conocer que incluye el panel 
IoT y métricas avanzadas. Esto sugiere que el criterio de conversión es realista si 
el lanzamiento va acompañado de un periodo de prueba gratuita del plan Premium.

3. **Hipótesis 3 — Al menos el 70% de los colaboradores activos completarán más de 
un proyecto en los primeros 6 meses** — El sistema de reputación y evidencias fue 
bien recibido por los colaboradores durante las sesiones de validación. Los usuarios 
indicaron que la visibilidad de su historial de participación es un incentivo 
suficiente para mantener su actividad en la plataforma. El criterio es alcanzable 
si se implementa el sistema de notificaciones y recomendaciones de proyectos en el 
sprint siguiente.

4. **Hipótesis 4 — Al menos el 40% de los proyectos con enfoque ambiental activarán 
el módulo IoT en los primeros 6 meses** — El panel IoT en modo demo fue valorado 
como el diferenciador más relevante de Foundly frente a plataformas existentes. Los 
usuarios con proyectos de hardware mostraron alta disposición a conectar su 
dispositivo real una vez que comprendieron el proceso de integración vía MQTT. El 
criterio es alcanzable si se simplifica el proceso de activación y se ofrece 
documentación técnica clara.

---

# TB1

Durante el Sprint 2, el equipo implementó la primera versión funcional del Frontend 
Web Application de Foundly, integrada con una Fake API mediante db.json. Este avance 
permitió validar los flujos de navegación y la experiencia de usuario para ambos 
segmentos objetivo antes de la implementación del backend real.

### En relación a los Problem Statements

1. **Problem Statement 1** — La implementación del módulo de creación y publicación 
de proyectos, junto con el motor de búsqueda y filtrado, demostró que es posible 
conectar emprendedores con colaboradores de forma eficiente en una sola plataforma. 
Los flujos de postulación y aceptación funcionaron correctamente durante las pruebas 
internas, validando la arquitectura de la solución.

2. **Problem Statement 2** — La vista de gestión de hitos y el sistema de evidencias 
implementados en el frontend permitieron visualizar cómo el seguimiento transparente 
del proyecto reduce la incertidumbre entre los miembros del equipo. Los flujos 
diseñados mostraron coherencia con las necesidades identificadas en las entrevistas.

### En relación a los Assumptions

1. **Assumption sobre el Emprendedor** — La implementación del flujo de creación de 
proyectos confirmó que el proceso puede completarse en menos de 5 minutos, lo que 
reduce la fricción de adopción para emprendedores nuevos en la plataforma.

2. **Assumption sobre el Colaborador** — La vista de exploración y postulación a 
proyectos fue completada sin errores en las pruebas internas, validando que el flujo 
de búsqueda y filtrado responde correctamente a las necesidades del segmento 
colaborador.

3. **Assumption sobre el panel IoT** — La implementación del panel IoT con datos 
simulados en tiempo real confirmó que la visualización de métricas es técnicamente 
viable y visualmente comprensible para usuarios sin conocimiento técnico previo.

### En relación a los Hypothesis Statements y criterios de éxito

1. **Hipótesis 1** — El flujo de postulación implementado en este sprint confirma 
que la conformación de equipos es funcional y accesible. La siguiente validación 
con usuarios reales determinará si el criterio del 50% es alcanzable en el plazo 
establecido.

2. **Hipótesis 2** — La sección de planes implementada en la landing page y la 
vista de suscripción en la web app muestran claramente los beneficios del plan 
Premium. Se espera que la conversión aumente una vez que el backend esté desplegado 
y los usuarios puedan interactuar con funcionalidades reales.

3. **Hipótesis 3** — El sistema de reputación y la vista de evidencias implementados 
en este sprint sientan las bases para incentivar la participación continua de los 
colaboradores. La métrica de retención será evaluada en las validaciones del Sprint 3.

4. **Hipótesis 4** — El panel IoT implementado con datos simulados fue validado 
internamente. La activación del módulo con proyectos reales será posible una vez 
que el backend con Spring Boot esté desplegado y los endpoints IoT estén disponibles.

---

## Recomendaciones y Roadmap

A partir de los resultados obtenidos, el equipo propone los siguientes pasos para 
el roadmap de los productos digitales que conforman el modelo de negocio de Foundly:

1. **Corto plazo — Lanzamiento piloto (0 a 3 meses)**

   - Publicar el Landing Page y la Web Application en producción con los sprints 
     desarrollados durante el curso.
   - Activar el panel IoT en modo demo para todos los proyectos de la categoría 
     hardware, sin requerir hardware físico.
   - Incorporar un flujo de onboarding guiado para nuevos emprendedores que reduzca 
     la fricción en la creación del primer proyecto.
   - Establecer alianzas con al menos dos incubadoras universitarias para captar los 
     primeros 50 proyectos piloto.

2. **Mediano plazo — Crecimiento (3 a 9 meses)**

   - Implementar el motor de recomendaciones de proyectos basado en el perfil y 
     habilidades del colaborador.
   - Incorporar verificación de identidad mediante correo institucional universitario 
     para aumentar la confianza en la comunidad.
   - Ampliar las categorías de sensores IoT e incorporar soporte para protocolo HTTP 
     polling como alternativa a MQTT.
   - Lanzar campañas de adquisición de usuarios en LinkedIn, Instagram y comunidades 
     de emprendimiento para alcanzar los 2,000 usuarios activos establecidos como meta.

3. **Largo plazo — Escalabilidad (9 a 18 meses)**

   - Desarrollar la aplicación móvil nativa para Android en Kotlin, reutilizando el 
     RESTful API implementado en Spring Boot.
   - Expandir el modelo a otros mercados de Latinoamérica comenzando por Colombia y 
     Chile, adaptando los términos legales y la configuración regional.
   - Evaluar la incorporación de un módulo de mentoría entre emprendedores con 
     proyectos exitosos y nuevos usuarios, fortaleciendo el ecosistema colaborativo 
     de Foundly.
