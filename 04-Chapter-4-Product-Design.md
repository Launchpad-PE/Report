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
### 4.6.1. Design-Level Event Storming
### 4.6.2. Software Architecture Context Diagram
### 4.6.3. Software Architecture Container Diagrams
### 4.6.4. Software Architecture Components Diagrams
## 4.7. Software Object-Oriented Design
### 4.7.1. Class Diagrams
## 4.8. Database Design
### 4.8.1. Database Diagram

Nuestro diagrama de base de datos representa cómo se organiza toda la información dentro de la plataforma **Foundly**.

En el centro del sistema se encuentran los **usuarios**, quienes pueden crear proyectos, participar en ellos y realizar contribuciones. Cada usuario cuenta con un perfil y un rol dentro de la plataforma.

Los **proyectos** son el núcleo del sistema. A partir de ellos se conectan múltiples funcionalidades:
- Los usuarios pueden unirse como miembros.
- Se pueden realizar **contribuciones económicas** para financiarlos.
- Se gestionan **tareas individuales**.
- También existen **hitos (milestones)** que agrupan trabajo colaborativo.

Además, el sistema incorpora un componente innovador: el módulo **IoT**, donde se registran datos provenientes de dispositivos como sensores. Esta información es utilizada por el módulo de **Analytics**, el cual genera reportes e insights que ayudan a comprender mejor el comportamiento de los proyectos.

También se incluyen funcionalidades complementarias como:
- **Suscripciones**, para gestionar los planes de los usuarios.
- **Notificaciones**, que mantienen informados a los usuarios sobre eventos importantes dentro de la plataforma.

En conjunto, este diseño permite que toda la información esté conectada de manera ordenada, facilitando la interacción entre usuarios, proyectos y datos, y asegurando que el sistema sea escalable y fácil de mantener.

**Diagrama de Base de datos Completo:**
<img src="resources/Images/Chapter-4/Base de datos/Base de datos general/Base de datos.png" alt ="Data Base General">

<h3><strong>Diagrama de base de datos dividido por contextos:</strong></h3>

A continuación, se presenta la organización de la base de datos segmentada por **bounded contexts**, siguiendo los principios de **Domain-Driven Design (DDD)**.

En lugar de manejar una única estructura monolítica, el diseño de la base de datos se divide en diferentes contextos, donde cada uno representa una parte específica del dominio del sistema Foundly. Esto permite una mejor organización, separación de responsabilidades y mayor claridad en la gestión de la información.

Cada bounded context agrupa sus propias tablas, las cuales están directamente relacionadas con sus funcionalidades dentro del sistema. Por ejemplo, existen contextos dedicados a la gestión de usuarios, proyectos, contribuciones, tareas, IoT y analytics, entre otros.

Esta segmentación facilita:
- La comprensión del sistema.
- La mantenibilidad del código y la base de datos.
- La escalabilidad del sistema a futuro.
- La independencia entre módulos.

En las siguientes secciones se detallan los diagramas de base de datos correspondientes a cada bounded context, mostrando sus tablas, atributos y relaciones principales.

<h4>IAM</h4>

<img src="resources/Images/Chapter-4/Base de datos/bounden-context/IAM/IAM.png" alt="IAM Data Base">

El bounded context **IAM (Identity and Access Management)** es el encargado de gestionar la identidad de los usuarios dentro de la plataforma Foundly, incluyendo su registro, autenticación y control de acceso.

En este contexto se definen las siguientes tablas principales:

- **users:** almacena la información básica de los usuarios del sistema, como su correo electrónico, contraseña y fecha de creación. Esta tabla representa a todos los usuarios que interactúan con la plataforma.

- **roles:** contiene los diferentes roles que pueden tener los usuarios dentro del sistema, permitiendo definir distintos niveles de acceso y responsabilidades.

La relación entre estas tablas permite asignar un rol a cada usuario, lo que facilita la gestión de permisos y el control de acceso a las funcionalidades del sistema.

Este diseño asegura que la autenticación y autorización estén centralizadas, proporcionando una base sólida para la seguridad de la plataforma.

<h4>Profile</h4>

<img src="resources/Images/Chapter-4/Base de datos/bounden-context/Profile/Profile.png" alt ="Profile Data Base">

El bounded context **Profile** es el encargado de gestionar la información personal y pública de los usuarios dentro de la plataforma Foundly.

En este contexto se define la siguiente tabla:

- **profiles:** almacena los datos del perfil de cada usuario, como su nombre, biografía e imagen. Esta información complementa los datos básicos almacenados en el módulo IAM, permitiendo una mejor representación del usuario dentro de la plataforma.

Cada perfil está asociado a un usuario mediante el campo `user_id`, lo que establece una relación directa entre la identidad del usuario y su información personal.

Este diseño permite separar claramente la gestión de autenticación (IAM) de la información del perfil, facilitando la organización del sistema y permitiendo una mayor flexibilidad en la evolución de cada módulo.

<h4>Subscription</h4>

<img src="resources/Images/Chapter-4/Base de datos/bounden-context/Subscription/Subscription.png" alt="Subscription Data Base">


El bounded context **Subscription** es el encargado de gestionar los planes y suscripciones de los usuarios dentro de la plataforma Foundly.

En este contexto se definen las siguientes tablas:

- **plans:** almacena los tipos de planes disponibles en la plataforma, como por ejemplo *Free* y *Premium*. Cada plan incluye información como su nombre, precio y descripción.

- **subscriptions:** registra las suscripciones activas o históricas de los usuarios. Contiene información sobre el usuario, el plan seleccionado, el estado de la suscripción y sus fechas de inicio y fin.

La relación entre estas tablas permite que un usuario esté asociado a un plan específico a través de una suscripción.

Este diseño facilita la gestión de modelos de negocio basados en suscripciones, permitiendo controlar el acceso a funcionalidades según el plan contratado y mantener un historial claro del estado de cada suscripción.

<h4>Project</h4>

<img src="resources/Images/Chapter-4/Base de datos/bounden-context/Proyect/Proyect.png" alt="Project">

El bounded context **Project** es el encargado de gestionar los proyectos dentro de la plataforma Foundly, los cuales representan la unidad central donde se desarrollan ideas, colaboraciones y financiamiento.

En este contexto se definen las siguientes tablas:

- **projects:** almacena la información principal de cada proyecto, incluyendo su nombre, descripción, estado, el usuario creador (`owner_id`) y la fecha de creación.

- **project_members:** permite gestionar la participación de usuarios dentro de los proyectos. Esta tabla establece una relación entre usuarios y proyectos, indicando qué usuarios forman parte de cada proyecto.

La relación entre ambas tablas permite que un proyecto tenga múltiples miembros y que un usuario pueda participar en varios proyectos, representando una relación de muchos a muchos.

Este diseño facilita la colaboración dentro de la plataforma, permitiendo organizar equipos de trabajo y gestionar la participación de los usuarios en los distintos proyectos.

<h4>Milestone</h4>

<img src="resources/Images/Chapter-4/Base de datos/bounden-context/Milestones/Milestones.png" alt="Milestones">

El bounded context **Milestone** es el encargado de gestionar el trabajo colaborativo dentro de los proyectos, organizándolo en hitos y tareas asociadas a dichos hitos.

En este contexto se definen las siguientes tablas:

- **milestones:** representa los hitos de un proyecto. Cada hito agrupa un conjunto de actividades que deben completarse para alcanzar un objetivo específico dentro del proyecto. Contiene información como título, descripción, estado y fecha límite.

- **milestone_tasks:** almacena las tareas asociadas a cada hito. Estas tareas representan el trabajo específico que deben realizar los colaboradores para cumplir con el hito. Incluyen información como el usuario asignado, estado, progreso, comentarios y fechas.

La relación entre ambas tablas permite que un hito tenga múltiples tareas asociadas, facilitando la organización del trabajo en equipo y el seguimiento del avance.

Este diseño separa claramente las tareas colaborativas (milestone_tasks) de las tareas individuales del sistema, permitiendo una mejor gestión del trabajo grupal dentro de los proyectos.

<h4>Task</h4>

<img src="resources/Images/Chapter-4/Base de datos/bounden-context/Task/Task.png" alt="Task">

El bounded context **Task** es el encargado de gestionar las tareas individuales dentro de los proyectos en la plataforma Foundly.

En este contexto se define la siguiente tabla:

- **tasks:** almacena las tareas asignadas a usuarios dentro de un proyecto. Cada tarea contiene información como el proyecto al que pertenece (`project_id`), el usuario asignado (`assigned_to`), el título, descripción, estado, fecha límite y evidencia asociada.

Estas tareas representan actividades individuales que cada usuario debe completar de manera independiente, a diferencia de las tareas colaborativas gestionadas en el módulo de Milestones.

La relación con la tabla **projects** permite organizar las tareas dentro del contexto de un proyecto específico, mientras que el campo `assigned_to` vincula la tarea con el usuario responsable.

Este diseño permite gestionar de forma clara y estructurada el trabajo individual dentro de los proyectos, facilitando el seguimiento del progreso y la asignación de responsabilidades.

<h4>Notification</h4>

<img src="resources/Images/Chapter-4/Base de datos/bounden-context/Notification/Notification.png" alt = "Notification">

El bounded context **Notification** es el encargado de gestionar las notificaciones dentro de la plataforma Foundly, permitiendo mantener informados a los usuarios sobre eventos relevantes.

En este contexto se definen las siguientes tablas:

- **notification_types:** almacena los diferentes tipos de notificaciones que existen en el sistema, como por ejemplo tareas nuevas, tareas completadas, hitos o actualizaciones importantes. Cada tipo incluye un nombre y una descripción.

- **notifications:** registra las notificaciones enviadas a los usuarios. Contiene información como el usuario destinatario (`user_id`), el tipo de notificación (`type_id`), el mensaje, su estado de lectura (`is_read`) y la fecha de creación.

La relación entre ambas tablas permite clasificar cada notificación según su tipo, facilitando la organización y el manejo de distintos eventos dentro del sistema.

Este diseño permite gestionar de manera eficiente la comunicación con los usuarios, asegurando que reciban información relevante sobre lo que ocurre en sus proyectos y actividades.

<h4>Contribution</h4>

<img src = "resources/Images/Chapter-4/Base de datos/bounden-context/contribution/contribution.png" alt= "Contribution">

<h4>Iot</h4>
 <img src="resources/Images/Chapter-4/Base de datos/bounden-context/Iot/Iot.png" alt="Iot">

 
<h4>Analytics</h4>
<img src="resources/Images/Chapter-4/Base de datos/bounden-context/Analytics/Analytics.png" alt ="Analytics">
