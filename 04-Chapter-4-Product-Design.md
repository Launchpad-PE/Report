# Capítulo IV: Product Design
## 4.1. Style Guidelines
### 4.1.1. General Style Guidelines
### 4.1.2. Web Style Guidelines
## 4.2. Information Architecture

En Foundly, la arquitectura de la información se orienta a estructurar el contenido de manera clara, coherente y accesible tanto en la landing page como en la aplicación web. Nuestro objetivo es que los emprendedores, colaboradores y usuarios interesados en proyectos sostenibles puedan navegar de forma intuitiva, identificar rápidamente las secciones relevantes y acceder sin esfuerzo a las funcionalidades principales, incluyendo el monitoreo de impacto ambiental mediante IoT.

### 4.2.1. Organization Systems

## Sistemas de Organización de Información

En Foundly, aplicaremos distintos sistemas de organización de información para garantizar que los usuarios encuentren fácilmente lo que necesitan y que la experiencia de navegación sea clara, eficiente y sin confusiones.

---

### Organización Visual del Contenido

**Jerárquica (Visual Hierarchy)**
Se destacará la información más relevante mediante jerarquías visuales que guíen al usuario a través de diferentes niveles de contenido:

- En la página de inicio, la sección de roles permitirá al visitante identificarse como *Emprendedor*, *Colaborador* o *Inversionista*, mostrando en cada tarjeta información diferenciada y priorizada según su perfil.
- En la sección de monitoreo ambiental, se presentarán métricas IoT como calidad del aire, humedad o impacto del proyecto sostenible, destacadas visualmente para facilitar su lectura.

**Secuencial (Step-by-step)**
Se aplicará en procesos clave que requieran guiar al usuario de forma clara y ordenada:

- Registro de usuarios
- Creación de proyectos
- Conformación de equipos
- Creación de campañas de financiamiento
- Configuración del monitoreo IoT

**Matricial (Matrix Organization)**
Se utilizará en la sección de planes de suscripción, presentando la información en formato comparativo para facilitar la toma de decisiones. Los planes **Gratuito** y **Premium** se disponen en columnas paralelas, permitiendo identificar rápidamente diferencias como:

- Acceso a métricas IoT avanzadas
- Mayor visibilidad de proyectos
- Herramientas de análisis

---

### Esquemas de Categorización de Contenido

**Por tópicos**
Los proyectos y recursos disponibles se organizarán en categorías temáticas, permitiendo identificar rápidamente proyectos con monitoreo IoT activo:

- Tecnología
- Salud
- Educación
- Sostenibilidad
- Medio Ambiente

**Cronológico**
Se empleará en la sección de novedades y actualizaciones, ordenando de más reciente a más antiguo los lanzamientos de proyectos, métricas de impacto y avances en tiempo real de campañas activas.

**Según audiencia (Grupos de usuarios)**
El contenido se personalizará según el tipo de usuario, con secciones adaptadas a sus intereses y necesidades:

- **Emprendedores:** herramientas para crear y gestionar proyectos y campañas.
- **Colaboradores:** oportunidades para unirse a equipos y contribuir activamente.
- **Inversionistas:** métricas de rendimiento, impacto y análisis financiero de proyectos.

### 4.2.2. Labeling Systems

En Foundly, el sistema de etiquetado organiza la información de forma clara y comprensible para los usuarios. Cada sección de la landing page y la aplicación está identificada con títulos y etiquetas que permiten entender rápidamente el contenido y las funciones disponibles.

- **Inicio / Home:** Presenta una visión general de Foundly, destacando la conexión entre emprendedores, colaboradores y el monitoreo de impacto ambiental con IoT.
- **Nosotros / About Us:** Describe al equipo detrás de Foundly, su misión, visión y el impacto que busca generar en el ecosistema emprendedor y sostenible.
- **Proyectos / Projects:** Permite explorar proyectos disponibles, incluyendo aquellos con monitoreo ambiental IoT activo.
- **Servicios / Services:** Explica los beneficios de la plataforma, como la formación de equipos, el financiamiento colaborativo, la gestión de proyectos y el monitoreo ambiental.
- **Impacto IoT / IoT Impact:** Muestra métricas ambientales en tiempo real, como calidad del aire, humedad o nivel de participación del proyecto.
- **Planes / Plans:** Presenta los planes gratuito y premium con acceso a métricas avanzadas y funcionalidades adicionales.
- **Empresas / Companies:** Muestra organizaciones interesadas en apoyar proyectos innovadores y sostenibles.
- **Contacto / Contact Us:** Proporciona los medios de comunicación disponibles, como correo electrónico, redes sociales y soporte técnico.
- **Registro / Sign Up:** Permite crear una cuenta seleccionando el rol de emprendedor, colaborador o inversionista.

### 4.2.3. SEO Tags and Meta Tags

Para mejorar la visibilidad de Foundly y destacar el enfoque IoT y sostenible, implementaremos las siguientes etiquetas:

### Landing Page SEO Tags and Meta Tags
```html
<head>
    <meta charset="UTF-8" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <title>Foundly - Crowdfunding colaborativo con monitoreo IoT</title> 
    <meta name="description" content="Foundly conecta emprendedores y colaboradores para impulsar proyectos innovadores con financiamiento colaborativo y monitoreo ambiental mediante IoT." /> 
    <meta name="keywords" content="crowdfunding, emprendimiento, IoT, monitoreo ambiental, startups, colaboración, proyectos sostenibles" /> 
    <meta name="author" content="Foundly Startup Team" /> 
    <meta name="copyright" content="© Foundly, 2026" /> </head>

```
#### Web Application SEO Tags and Meta Tags
```html
<head> 
    <meta charset="UTF-8" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <title>Foundly - Plataforma colaborativa con monitoreo IoT</title> 
    <meta name="description" content="Crea proyectos, forma equipos y monitorea el impacto ambiental mediante IoT con Foundly." /> 
    <meta name="keywords" content="crowdfunding colaborativo, IoT, impacto ambiental, proyectos sostenibles, startups" /> 
    <meta name="author" content="Foundly Startup Team" /> </head>
```

### 4.2.4. Searching Systems

El sistema de búsqueda de Foundly está diseñado para facilitar que los usuarios encuentren proyectos, colaboradores o métricas IoT de forma rápida y precisa.

- **Búsqueda básica:** Campo de búsqueda ubicado en la parte superior de la plataforma, que permite localizar proyectos, emprendedores o métricas de impacto mediante palabras clave.

- **Filtros avanzados:** El usuario puede refinar los resultados aplicando uno o más de los siguientes filtros:
  - Categoría del proyecto
  - Tipo de colaboración
  - Estado de financiamiento
  - Proyectos con monitoreo IoT
  - Nivel de impacto ambiental

- **Ordenación de resultados:** Los resultados pueden ordenarse según distintos criterios:
  - Relevancia
  - Más recientes
  - Mayor financiamiento
  - Mayor impacto ambiental
  - Más colaboradores

- **Vista de resultados:** Cada resultado mostrará de forma estructurada la imagen del proyecto, título, breve descripción, nombre del creador, estado del financiamiento, métricas IoT disponibles y botones de acción.

- **Sugerencias en tiempo real:** A medida que el usuario escribe, la plataforma ofrecerá sugerencias automáticas de proyectos o perfiles relevantes para agilizar la búsqueda.

### 4.2.5. Navigation Systems

Foundly ofrece una navegación clara e intuitiva para guiar al usuario en cada etapa de su experiencia dentro de la plataforma.

- **Menú principal:** Incluye accesos directos a las secciones de Inicio, Proyectos, Impacto IoT, Servicios, Nosotros y Contacto, junto con accesos rápidos a Login y Registro.

- **Barra de búsqueda destacada:** Ubicada en la parte superior de la landing page y de la aplicación, permite buscar proyectos, colaboradores o métricas IoT desde cualquier punto de la plataforma.

- **Botones de llamada a la acción (CTA):** Se presentan de forma prominente para facilitar las acciones principales:
  - Crear Proyecto
  - Unirse a Proyecto
  - Ver Impacto IoT
  - Financiar Proyecto

- **Navegación consistente:** Se mantiene una estructura uniforme en todas las páginas, con el menú fijo y accesos rápidos siempre visibles para garantizar una experiencia predecible y fluida.

- **Soporte responsivo:** La navegación se adapta correctamente a dispositivos móviles y tablets, asegurando una experiencia de uso óptima en cualquier pantalla.
  
### 
## 4.3. Landing Page UI Design
### 4.3.1. Landing Page Wireframe
### 4.3.2. Landing Page Mock-up
## 4.4. Web Applications UX/UI Design
### 4.4.1. Web Applications Wireframes
### 4.4.2. Web Applications Wireflow Diagrams
### 4.4.3. Web Applications Mock-ups
### 4.4.4. Web Applications User Flow Diagrams
## 4.5. Web Applications Prototyping
## 4.6. Domain-Driven Software Architecture
### 4.6.1. Design-Level Event Storming
### 4.6.2. Software Architecture Context Diagram
### 4.6.3. Software Architecture Container Diagrams
### 4.6.4. Software Architecture Components Diagrams
## 4.7. Software Object-Oriented Design
### 4.7.1. Class Diagrams
## 4.8. Database Design
### 4.8.1. Database Diagram
