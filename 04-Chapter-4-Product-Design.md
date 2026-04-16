# Capítulo IV: Product Design
## 4.1. Style Guidelines
### 4.1.1. General Style Guidelines
### 4.1.2. Web Style Guidelines
## 4.2. Information Architecture
### 4.2.1. Organization Systems
### 4.2.2. Labeling Systems
### 4.2.3. SEO Tags and Meta Tags
### 4.2.4. Searching Systems
### 4.2.5. Navigation Systems
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

La arquitectura de software de Foundly se construye a partir de los resultados obtenidos en el Big Picture Event Storming, que permitió comprender en profundidad los flujos clave del dominio de atención residencial y las interacciones entre colaboradores y emprededores. A partir de este análisis inicial, se desarrolló una visión más estructurada del dominio utilizando los principios de Domain-Driven Design (DDD).

En las siguientes secciones se presenta cada nivel del modelo, explicando la estructura, responsabilidades y comunicación entre los elementos que conforman la arquitectura de Foundly.

### 4.6.1. Design-Level Event Storming

Para identificar los eventos de dominio, se realizó una sesión de Event Storming, técnica que permite visualizar y comprender el flujo de eventos dentro del dominio, facilitando la identificación de los Bounded Contexts.

El desarrollo del proceso se llevó a cabo en la aplicación Miro: [Ver tablero en Miro](https://miro.com/welcomeonboard/cHVMcFFueFZFQjcyVWkrMUNzNWVjSGZYSDhFaEpXSUlRV0FZYnF3QTAzczloRXhSTFlFbkVIcThvM040OWZBWjYxNTlQSFRFbk1TbzRUSkpJNG9YOFBmdzQ3QVkzWmFoalVhN1FnMGw5YWlnYVpwYUllM1N0TTdtanFXTytoaE5zVXVvMm53MW9OWFg1bkJoVXZxdFhRPT0hdjE=?share_link_id=425540868454)

---

### Bounded Contexts

**IAM (Identity and Access Management)**

Responsable de la gestión de la identidad de los usuarios dentro de la plataforma, asegurando procesos seguros de autenticación y acceso al sistema. Administra funcionalidades como el registro de nuevos usuarios, inicio y cierre de sesión, gestión de credenciales, recuperación de contraseñas y actualización de datos personales. Su propósito principal es garantizar un acceso confiable, seguro y controlado, asegurando que únicamente usuarios autorizados puedan interactuar con los recursos de Foundly.

<img src="resources/Images/Chapter-4/bounded-context/IAM.png" alt="IAM">

---

**Profile Management**

Encargado de la gestión de la información personal y configuración de los usuarios, permitiendo construir y mantener su identidad digital dentro de la plataforma. Administra la creación del perfil, el registro y actualización de datos personales, la carga de imagen de perfil y la gestión de preferencias. Su propósito es proporcionar un perfil completo, actualizado y configurable que represente al usuario dentro del ecosistema de Foundly.

<img src="resources/Images/Chapter-4/bounded-context/Profile-management.png" alt="Profile Management">

---

**Project Management**

Gestiona el ciclo de vida completo de los proyectos dentro de la plataforma, desde su creación hasta su finalización. Permite a los emprendedores crear proyectos, definir objetivos y publicarlos, así como administrar postulaciones de colaboradores, incluyendo el envío, evaluación y decisión de aceptación o rechazo. También gestiona el estado del proyecto (creado, publicado, en progreso o completado) y habilita el monitoreo de su evolución. Su propósito es facilitar la interacción estructurada entre emprendedores y colaboradores a lo largo de todo el proceso colaborativo.

<img src="resources/Images/Chapter-4/bounded-context/Project-management.png" alt="Project Management">

---

**Subscription Management**

Encargado de la gestión de los planes de suscripción, permitiendo a los usuarios acceder a funcionalidades adicionales mediante un modelo de pago recurrente. Administra la selección de planes, el registro y validación de datos de pago, y la ejecución de transacciones mediante servicios externos como Stripe. Asimismo, gestiona el ciclo de vida de la suscripción, incluyendo su activación, renovación automática, expiración y cancelación.

<img src="resources/Images/Chapter-4/bounded-context/Subscription-managment.png" alt="Subscription Management">

---

**Notification Management**

Responsable de la generación y envío de notificaciones hacia los usuarios sobre eventos relevantes de la plataforma. Crea notificaciones a partir de eventos como nuevas postulaciones, aceptación o rechazo de solicitudes, asignación y finalización de tareas, y progreso de hitos. Garantiza que cada usuario reciba información oportuna para facilitar la coordinación, el seguimiento de actividades y la toma de decisiones.

<img src="resources/Images/Chapter-4/bounded-context/Notification-management.png" alt="Notification Management">

---

**Milestone Management**

Gestiona los hitos dentro de los proyectos, permitiendo organizar el trabajo grupal y controlar el cumplimiento de objetivos intermedios. Permite crear hitos, definir tareas asociadas y asignarlas a colaboradores, además de gestionar su ciclo de vida completo: creación, asignación, envío, revisión y aprobación o rechazo. También contempla la carga de evidencias por parte de los colaboradores, la extensión de fechas límite y la visualización del estado de avance.

<img src="resources/Images/Chapter-4/bounded-context/milestone.png" alt="Milestone Management">

---

**Task Management**

Encargado de la gestión de tareas individuales dentro de los proyectos, permitiendo organizar, asignar y dar seguimiento al trabajo de cada colaborador. Los emprendedores pueden crear tareas, asignarlas a miembros del equipo y definir fechas de entrega, mientras que los colaboradores pueden subir evidencias del trabajo realizado. El sistema gestiona el ciclo de vida de cada tarea, incluyendo su creación, envío, revisión, aprobación o rechazo, y extensión de plazos.

<img src="resources/Images/Chapter-4/bounded-context/task.png" alt="Task Management">

---

**Contribution Management**

Gestiona las contribuciones realizadas por los usuarios para apoyar el desarrollo de los proyectos. Permite a los emprendedores definir objetivos de financiamiento y establecer beneficios asociados, mientras que los usuarios pueden realizar aportes registrados y confirmados por el sistema. Controla el progreso hacia la meta de financiamiento y notifica cuando el objetivo ha sido alcanzado, promoviendo la transparencia y la participación activa de la comunidad.

<img src="resources/Images/Chapter-4/bounded-context/contribution.png" alt="Contribution Management">

---

**IoT (Environmental Monitoring)**

Encargado de la integración y gestión de dispositivos IoT dentro de la plataforma, permitiendo el monitoreo de datos del entorno físico asociados a los proyectos. Gestiona la activación del monitoreo IoT, la conexión de dispositivos y el registro de métricas ambientales capturadas, procesando y almacenando indicadores relevantes que permiten evaluar el impacto del proyecto.

<img src="resources/Images/Chapter-4/bounded-context/Iot.png" alt="IoT">

---

**Analytics**

Responsable del procesamiento y análisis de los datos generados en la plataforma, transformando información en indicadores útiles para la toma de decisiones. Resume métricas, detecta información significativa y genera reportes reflejados en dashboards actualizados. Su propósito es proporcionar una visión clara y basada en datos del comportamiento del sistema, permitiendo evaluar el progreso de los proyectos y evidenciar resultados de manera efectiva.

<img src="resources/Images/Chapter-4/bounded-context/Analaytics.png" alt="Analytics">

### 4.6.2. Software Architecture Context Diagram

En este nivel se presenta una vista de alto nivel de la arquitectura del sistema, donde el foco está en **Foundly** como una “caja negra” y en las interacciones que mantiene con sus usuarios y sistemas externos.

El *context diagram* muestra a **Foundly Software System** como el núcleo de la solución, rodeado por los principales actores y servicios externos con los que se comunica:

- **Emprendedor (Entrepreneur):** usuario que crea, publica y gestiona proyectos dentro de la plataforma. Utiliza Foundly para definir objetivos, formar equipos de trabajo y activar mecanismos de financiamiento.

- **Colaborador (Collaborator):** usuario que participa en proyectos aportando habilidades y tiempo. Interactúa con Foundly para postular, ejecutar tareas y contribuir al progreso del proyecto.

- **Payment System (Stripe):** sistema externo encargado de procesar pagos relacionados con contribuciones y suscripciones, garantizando transacciones seguras dentro de la plataforma.

- **Cloud Storage Service (Cloudinary):** servicio externo utilizado para almacenar y gestionar archivos multimedia, como imágenes de perfil, evidencias de tareas y recursos asociados a proyectos.

- **Authentication Service (Auth0):** servicio externo responsable de la autenticación de usuarios, gestionando el registro, inicio de sesión y seguridad mediante mecanismos como tokens.

- **IoT Devices:** dispositivos físicos externos que envían métricas en tiempo real (temperatura, humedad, calidad del aire, entre otros) hacia la plataforma, permitiendo monitorear el impacto de los proyectos.

En el diagrama se representan las relaciones entre estos elementos, destacando que tanto los emprendedores como los colaboradores interactúan directamente con Foundly, mientras que el sistema se encarga de orquestar la comunicación con servicios externos como pagos, almacenamiento, autenticación e IoT.

Esta vista permite comprender el alcance del sistema, sus límites de responsabilidad y el ecosistema tecnológico en el que se integra Foundly, antes de profundizar en niveles más detallados de la arquitectura.

<img src="resources/Images/Chapter-4/C4 MODEL/structurizr-109610-SystemContext-001.svg" alt="Contexto">

### 4.6.3. Software Architecture Container Diagrams

En el nivel de contenedores, la atención se desplaza desde “quién usa el sistema” hacia “cómo se organiza internamente Foundly en aplicaciones y fuentes de datos”. El *container diagram* muestra los elementos principales de la arquitectura, sus responsabilidades y la forma en que se comunican entre sí y con sistemas externos.

La arquitectura lógica de Foundly se estructura en los siguientes contenedores:

- **Landing Page:** aplicación web estática que presenta la propuesta de valor de Foundly, guía a los usuarios y actúa como punto de entrada al sistema. Está desarrollada con tecnologías web estándar (HTML, CSS y JavaScript).

- **Single Page Application (SPA):** aplicación web principal implementada en **Angular**, donde interactúan los emprendedores y colaboradores. Este contenedor gestiona la experiencia de usuario, vistas, navegación y comunicación con el backend.

- **API Application:** backend monolítico desarrollado en **Spring Boot (Java)**, que expone una API REST y encapsula la lógica de negocio del sistema. Está organizado por módulos alineados a los bounded contexts, como IAM, Profile, Project, Task, Milestone, Contribution, Subscription, Notification, IoT, Analytics y Shared.

- **Database:** base de datos relacional **MySQL**, donde se persiste la información estructurada del sistema, incluyendo usuarios, proyectos, tareas, hitos, contribuciones, métricas IoT, reportes y notificaciones.

En el diagrama se observa que:

- Los usuarios (emprendedores y colaboradores) acceden inicialmente a la **Landing Page**, desde donde son redirigidos a la **SPA** mediante acciones de autenticación o registro.

- La **SPA** se comunica exclusivamente con la **API Application** mediante peticiones HTTP/HTTPS utilizando mensajes en formato JSON bajo un estilo arquitectónico REST.

- La **API Application** gestiona la lógica del sistema y realiza operaciones de lectura y escritura en la **Database**, asegurando la persistencia de los datos.

- La **API Application** se integra con sistemas externos como:
  - **Stripe**, para el procesamiento de pagos y contribuciones.
  - **Cloudinary**, para el almacenamiento de imágenes y archivos.
  - **Auth0**, para la autenticación y gestión de identidad de usuarios.
  - **IoT Devices**, que envían métricas en tiempo real para el monitoreo de proyectos.

Esta vista permite entender cómo se distribuyen las responsabilidades entre la capa de presentación (Landing Page y SPA), la capa de lógica de negocio (API Application) y la capa de persistencia (Database), así como las integraciones externas que enriquecen la funcionalidad de Foundly.

<img src="resources/Images/Chapter-4/C4 MODEL/structurizr-109610-Container-001.svg" alt="Contenedor">

### 4.6.4. Software Architecture Components Diagrams

En el nivel de componentes se detalla la descomposición interna de los contenedores, mostrando los bloques estructurales que los conforman y las relaciones entre ellos. En esta sección se pone especial énfasis en el contenedor **API Application**, ya que es donde reside la mayor parte de la lógica de negocio del sistema Foundly.

El *component diagram* de la API Application organiza la arquitectura interna siguiendo los **bounded contexts definidos en el dominio**, donde cada módulo backend representa un componente principal dentro del sistema:

- **IAM Module:** se encarga de la autenticación y gestión de usuarios, incluyendo registro, inicio de sesión, roles, generación de tokens y seguridad del acceso al sistema.

- **Profile Module:** gestiona la información personal de los usuarios, permitiendo la actualización de perfiles, biografías e imágenes.

- **Project Module:** administra la creación, publicación y gestión de proyectos, incluyendo la participación de colaboradores y el ciclo de vida del proyecto.

- **Task Module:** maneja las tareas individuales asociadas a los proyectos, permitiendo su asignación, seguimiento y validación.

- **Milestone Module:** gestiona los hitos del proyecto y sus tareas grupales (**MilestoneTask**), representando etapas clave del progreso del proyecto.

- **Contribution Module:** gestiona los aportes económicos realizados por los usuarios a los proyectos, incluyendo la integración con el sistema de pagos.

- **Subscription Module:** administra los planes y suscripciones de los usuarios, controlando el acceso a funcionalidades premium del sistema.

- **Notification Module:** gestiona el envío de notificaciones a los usuarios, informando sobre eventos relevantes como tareas, hitos o cambios en proyectos.

- **IoT Module:** se encarga de la recepción y gestión de métricas provenientes de dispositivos IoT, permitiendo el monitoreo en tiempo real de los proyectos.

- **Analytics Module:** procesa las métricas obtenidas del módulo IoT para generar reportes e insights que apoyan la toma de decisiones.

- **Shared Module:** proporciona componentes compartidos, utilidades, clases base y servicios transversales utilizados por los demás módulos, promoviendo la reutilización y consistencia del sistema.

En el diagrama se refleja cómo:

- La **SPA** consume los servicios expuestos por la API Application mediante endpoints REST organizados por cada módulo del sistema.

- Cada módulo backend encapsula su propia lógica de negocio y accede a la **Database** para persistir y consultar la información correspondiente a su contexto.

- Algunos módulos se integran con sistemas externos:
  - **IAM Module** con el servicio de autenticación (Auth0).
  - **Contribution y Subscription Module** con el sistema de pagos (Stripe).
  - **Notification Module** con servicios de mensajería o correo electrónico.
  - **IoT Module** con dispositivos físicos que envían métricas en tiempo real.

- El **Analytics Module** consume datos del IoT Module para generar reportes e insights, estableciendo una relación directa entre captura de datos y análisis.

- Todos los módulos backend reutilizan funcionalidades comunes proporcionadas por el **Shared Module**, lo que mejora la cohesión del sistema y reduce la duplicación de código.

De esta manera, el component diagram permite visualizar cómo la API Application se descompone en módulos alineados al dominio, mostrando claramente las responsabilidades de cada uno y la forma en que colaboran para implementar la funcionalidad completa de Foundly.

<img src="resources/Images/Chapter-4/C4 MODEL/structurizr-109610-Component-001.svg" alt="Conmponente">

## 4.7. Software Object-Oriented Design
### 4.7.1. Class Diagrams
## 4.8. Database Design
### 4.8.1. Database Diagram
