# Conclusiones

El desarrollo de Foundly como plataforma web de crowdfunding colaborativo permitió al equipo DevWeb contrastar los supuestos iniciales del proceso Lean UX con los resultados obtenidos durante las etapas de validación, identificando brechas, confirmaciones y oportunidades de mejora que orientan los siguientes pasos del producto.

### En relación a los Problem Statements

1. **Problem Statement 1 — Falta de financiamiento accesible y dificultad para encontrar colaboradores** — El equipo planteó que los emprendedores y estudiantes en Latinoamérica carecen de plataformas que integren financiamiento y formación de equipos en un solo ecosistema. Las entrevistas y validaciones realizadas confirmaron este diagnóstico: los usuarios entrevistados reportaron haber recurrido a múltiples herramientas desconectadas —grupos de WhatsApp, formularios de Google y transferencias bancarias informales— para gestionar sus proyectos. Foundly logró integrar estas necesidades en una sola plataforma, aunque se identificó que la adopción inicial requiere un esfuerzo adicional de onboarding para usuarios sin experiencia previa en plataformas de crowdfunding.

2. **Problem Statement 2 — Alta tasa de fracaso de startups por falta de cohesión en equipos y gestión ineficiente** — Las validaciones confirmaron que el 23% de las startups fracasan por problemas en los equipos fundadores, según los datos documentados en los antecedentes. El sistema de postulación, gestión de hitos y publicación de evidencias implementado en Foundly fue valorado positivamente por los usuarios validadores, quienes destacaron la transparencia del seguimiento como el elemento que más confianza genera hacia el proyecto.

### En relación a los Assumptions

1. **Assumption sobre el comportamiento del Emprendedor** — Se asumió que los emprendedores estarían dispuestos a publicar su proyecto públicamente desde etapas tempranas para atraer colaboradores y financiadores. Las validaciones mostraron que este supuesto es parcialmente correcto: los emprendedores con mayor experiencia previa aceptaron la exposición pública, mientras que los emprendedores más jóvenes mostraron resistencia por temor a que su idea fuera copiada. Esto sugiere la necesidad de incorporar mecanismos de protección de propiedad intelectual o acceso por invitación en versiones futuras.

2. **Assumption sobre el comportamiento del Colaborador** — Se asumió que los estudiantes y profesionales jóvenes se postularían a proyectos motivados principalmente por la experiencia práctica y la visibilidad en su portafolio. Las validaciones confirmaron este supuesto en su totalidad: los colaboradores entrevistados priorizaron la calidad del proyecto y la claridad de los roles por encima de la compensación económica, lo que valida el modelo de participación voluntaria con sistema de reputación.

3. **Assumption sobre el panel IoT** — Se asumió que mostrar datos de sensores en tiempo real dentro de una campaña aumentaría la confianza de los financiadores. Las validaciones confirmaron que el panel IoT fue el elemento que más llamó la atención durante las sesiones de demostración, y los usuarios financiadores señalaron que verían con mayor probabilidad de aportar a un proyecto que demuestra que su prototipo funciona.

### En relación a los Hypothesis Statements y criterios de éxito

1. **Hipótesis 1 — Al menos el 30% de los proyectos lograrán recaudar el 60% o más de su meta en los primeros 4 meses** — Al cierre del periodo de validación, los proyectos piloto utilizados en las sesiones de demostración no alcanzaron el umbral establecido, principalmente porque la plataforma aún se encuentra en fase de desarrollo y no cuenta con una base de usuarios activos suficiente. Sin embargo, los usuarios validadores indicaron que estarían dispuestos a contribuir si el proyecto les generara confianza, lo que sugiere que el criterio es alcanzable con una estrategia de lanzamiento adecuada.

2. **Hipótesis 2 — Al menos el 50% de los proyectos activos contarán con un equipo completo en los primeros 3 meses** — Las validaciones mostraron que la funcionalidad de postulación fue la más utilizada durante las pruebas, y los usuarios completaron el proceso de solicitud de unión en menos de 3 minutos, lo que indica que el flujo está correctamente diseñado. Se estima que el criterio es alcanzable si se implementa el motor de recomendaciones propuesto en el roadmap.

3. **Hipótesis 3 — Al menos el 15% de los usuarios activos adquirirán el plan Premium en el primer año** — Durante las validaciones, el 4 de cada 5 usuarios entrevistados expresó interés en el plan Premium al conocer que incluye el panel IoT y métricas avanzadas, lo que sugiere que el criterio de conversión es realista si el lanzamiento va acompañado de un periodo de prueba gratuita del plan Premium.

<br>

# Recomendaciones y Roadmap

A partir de los resultados obtenidos, el equipo propone los siguientes pasos para el roadmap de los productos digitales que conforman el modelo de negocio de Foundly:

1. **Corto plazo — Lanzamiento piloto (0 a 3 meses)**

   - Publicar el Landing Page y la Web Application en producción con los sprints desarrollados durante el curso.
   - Activar el panel IoT en modo demo para todos los proyectos de la categoría hardware, sin requerir hardware físico.
   - Incorporar un flujo de onboarding guiado para nuevos emprendedores que reduzca la fricción en la creación del primer proyecto.
   - Establecer alianzas con al menos dos incubadoras universitarias para captar los primeros 50 proyectos piloto.

2. **Mediano plazo — Crecimiento (3 a 9 meses)**

   - Implementar el motor de recomendaciones de proyectos basado en el perfil y habilidades del colaborador.
   - Incorporar verificación de identidad mediante correo institucional universitario para aumentar la confianza en la comunidad.
   - Ampliar las categorías de sensores IoT e incorporar soporte para protocolo HTTP polling como alternativa a MQTT.
   - Lanzar campañas de adquisición de usuarios en LinkedIn, Instagram y comunidades de emprendimiento para alcanzar los 2,000 usuarios activos establecidos en la Hipótesis 3.

3. **Largo plazo — Escalabilidad (9 a 18 meses)**

   - Desarrollar la aplicación móvil nativa para Android en Kotlin, reutilizando el RESTful API ya desarrollado.
   - Integrar pasarelas de pago locales como Yape, Plin y PagoEfectivo para facilitar los aportes dentro del mercado peruano.
   - Expandir el modelo a otros mercados de Latinoamérica comenzando por Colombia y Chile, adaptando los términos legales y la moneda local.
   - Evaluar la incorporación de un módulo de mentoría entre emprendedores con proyectos exitosos y nuevos usuarios, fortaleciendo el ecosistema colaborativo de Foundly.

