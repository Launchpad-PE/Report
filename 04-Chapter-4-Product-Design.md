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

**Shared**

### Shared Module – Class Diagram Description

El diagrama de clases del módulo **Shared** representa el conjunto de componentes transversales reutilizables dentro del sistema Foundly. Este módulo concentra elementos comunes del dominio que son utilizados por múltiples bounded contexts, promoviendo la consistencia, reutilización y desacoplamiento en la arquitectura.

El diseño sigue principios de **Domain-Driven Design (DDD)**, proporcionando clases base, value objects, utilidades y eventos de dominio.

#### Componentes principales

- **BaseEntity:** clase base para todas las entidades del sistema. Contiene atributos comunes como `id`, `createdAt` y `updatedAt`, permitiendo estandarizar el manejo de entidades en todos los contextos.

- **AggregateRoot:** representa la raíz de agregado en DDD. Todas las entidades principales del dominio (como User, Project, etc.) heredan de esta clase, asegurando control sobre las invariantes del agregado.

#### Value Objects

- **Email:** encapsula el valor del correo electrónico y su validación mediante el método `validate()`, garantizando consistencia en el dominio.

- **Password:** representa la contraseña del usuario en su forma segura (hash). Incluye lógica para comparar contraseñas mediante `matches()`.

- **UserId y ProjectId:** identificadores tipados que encapsulan valores primitivos (Long), evitando el uso directo de tipos básicos y reduciendo errores en el dominio.

- **Money:** representa valores monetarios incluyendo monto y moneda, facilitando el manejo de transacciones en el sistema.

- **DateRange:** encapsula un rango de fechas (`startDate`, `endDate`), útil para representar periodos en diferentes contextos como suscripciones o hitos.

#### Eventos de dominio

- **DomainEvent:** clase base para eventos del dominio, incluyendo la fecha de ocurrencia (`occurredOn`).

- **UserRegisteredEvent:** evento que se dispara cuando un usuario se registra en el sistema.

- **ProjectCreatedEvent:** evento que representa la creación de un proyecto.

- **ContributionMadeEvent:** evento generado cuando un usuario realiza una contribución económica.

Estos eventos permiten implementar arquitecturas reactivas o basadas en eventos, facilitando la integración entre módulos.

#### Manejo de excepciones

- **DomainException:** clase base para excepciones del dominio.

- **ValidationException:** representa errores relacionados con validaciones de reglas de negocio.

Estas clases permiten manejar errores de manera estructurada y coherente en todo el sistema.

#### Utilidades

- **UUIDGenerator:** proporciona la generación de identificadores únicos.

- **DateUtils:** ofrece funciones relacionadas con fechas, como la obtención de la fecha actual.

#### Importancia del módulo Shared

El módulo Shared cumple un rol fundamental en la arquitectura, ya que:

- Evita la duplicación de código entre bounded contexts.
- Centraliza reglas comunes del dominio.
- Mejora la consistencia en la modelación del sistema.
- Facilita la mantenibilidad y escalabilidad de la solución.

De esta manera, el Shared Module actúa como la base sobre la cual se construyen los demás módulos del sistema Foundly, asegurando cohesión y estandarización en toda la arquitectura.

<img src="resources/Images/Chapter-4/Diagrma de clases/Shared/Shared.png" alt="Shared">

**IAM (Identify Acces Management):**

El diagrama de clases del módulo **IAM (Identity and Access Management)** representa la estructura interna encargada de la autenticación, gestión de usuarios y control de acceso dentro del sistema Foundly.

Este módulo sigue los principios de **Domain-Driven Design (DDD)** y una separación clara entre comandos (*commands*), consultas (*queries*), servicios de aplicación y lógica de dominio.

#### Componentes principales

- **IAMController:** actúa como punto de entrada del sistema, exponiendo endpoints REST para operaciones como registro (`register()`), inicio de sesión (`login()`) y recuperación de contraseña (`resetPassword()`). Este componente recibe las solicitudes del cliente (SPA) y las delega al facade correspondiente.

- **IAMFacade:** funciona como una capa de orquestación que simplifica la interacción entre el controlador y los servicios de aplicación. Centraliza las operaciones principales del módulo como `register()` y `login()`.

#### Manejo de comandos (Command Side)

- **RegisterUserCommand:** encapsula los datos necesarios para registrar un usuario (email y password).
- **ResetPasswordCommand:** contiene la información requerida para actualizar la contraseña del usuario.

- **IAMCommandService:** ejecuta la lógica asociada a los comandos, como el registro de usuarios y el cambio de contraseña. Este servicio interactúa con:
  - **UserRepository:** para persistir los datos del usuario.
  - **PasswordHasher:** para asegurar el almacenamiento seguro de contraseñas mediante hashing.

#### Manejo de consultas (Query Side)

- **LoginUserQuery:** representa la solicitud de autenticación del usuario.
- **GetUserByEmailQuery:** permite recuperar información del usuario a partir de su correo electrónico.

- **IAMQueryService:** maneja las operaciones de lectura, incluyendo:
  - Validación de credenciales.
  - Obtención de usuarios.
  - Generación de tokens mediante el **TokenService**.

#### Dominio

- **User (Aggregate Root):** entidad principal del módulo, que encapsula los atributos del usuario (id, email, password, rol y fecha de creación) y comportamientos como `register()` y `changePassword()`. Representa la raíz de agregado del contexto IAM.

- **PasswordHasher:** componente encargado de generar y verificar hashes de contraseñas, garantizando seguridad en el almacenamiento.

- **TokenService:** responsable de generar tokens de autenticación (por ejemplo, JWT), los cuales permiten la gestión de sesiones seguras.

#### Persistencia

- **UserRepository:** interfaz que define las operaciones de acceso a datos para la entidad User, como guardar un usuario o buscarlo por email. Permite desacoplar la lógica de dominio de la infraestructura.

#### Flujo general

1. El usuario envía una solicitud (registro o login) a través del **IAMController**.
2. El controlador delega la operación al **IAMFacade**.
3. Dependiendo del caso:
   - Para comandos → se utiliza el **IAMCommandService**.
   - Para consultas → se utiliza el **IAMQueryService**.
4. Los servicios interactúan con el **UserRepository** para persistencia y recuperación de datos.
5. En el caso de autenticación, el **TokenService** genera un token seguro para el usuario.
6. Las contraseñas son gestionadas de forma segura mediante el **PasswordHasher**.

Este diseño permite una clara separación de responsabilidades, facilita la mantenibilidad del sistema y asegura la escalabilidad del módulo IAM dentro de la arquitectura de Foundly.

<img src="resources/Images/Chapter-4/Diagrma de clases/Iam/IAM.png" alt = "Iam">

**Profile Management:**

El diagrama de clases del módulo **Profile** representa la estructura encargada de la gestión de la información personal de los usuarios dentro del sistema Foundly.

Este módulo sigue los principios de **Domain-Driven Design (DDD)** y aplica una separación clara entre comandos (*commands*) y consultas (*queries*), permitiendo una mejor organización y escalabilidad del sistema.

#### Componentes principales

- **ProfileController:** actúa como punto de entrada del módulo, exponiendo endpoints REST para la gestión del perfil del usuario. Recibe las solicitudes desde la SPA y las delega al facade correspondiente.

- **ProfileFacade:** funciona como una capa de orquestación que simplifica la interacción entre el controlador y los servicios del dominio. Coordina las operaciones de actualización y consulta del perfil.

#### Dominio

- **Profile (Aggregate Root):** entidad principal del módulo que representa la información del perfil del usuario. Contiene atributos como `id`, `userId`, `name`, `bio` e `imageUrl`, así como el comportamiento `updateProfile()`. Esta entidad actúa como la raíz del agregado, garantizando la consistencia de los datos del perfil.

- **ProfileId:** value object que encapsula el identificador del perfil, evitando el uso directo de tipos primitivos y mejorando la seguridad del dominio.

#### Manejo de comandos (Command Side)

- **UpdateProfileCommand:** encapsula los datos necesarios para actualizar el perfil del usuario (userId, nombre y biografía).

- **ProfileCommandService:** ejecuta la lógica de modificación del perfil, aplicando las reglas de negocio necesarias y persistiendo los cambios mediante el repositorio.

#### Manejo de consultas (Query Side)

- **GetProfileQuery:** representa la solicitud para obtener la información del perfil de un usuario.

- **ProfileQueryService:** se encarga de las operaciones de lectura, recuperando la información del perfil desde la capa de persistencia.

#### Persistencia

- **ProfileRepository:** interfaz que define las operaciones de acceso a datos para el perfil, como guardar (`save`) y buscar por usuario (`findByUser`). Permite desacoplar la lógica del dominio de la infraestructura.

#### Flujo general

1. El usuario realiza una solicitud desde la **SPA** hacia el **ProfileController**.
2. El controlador delega la operación al **ProfileFacade**.
3. Dependiendo del tipo de operación:
   - Para actualización → se utiliza el **ProfileCommandService**.
   - Para consulta → se utiliza el **ProfileQueryService**.
4. Los servicios interactúan con el **ProfileRepository** para persistir o recuperar información.
5. La entidad **Profile** asegura la consistencia del dominio mediante su comportamiento interno.

Este diseño permite una clara separación de responsabilidades, facilita la mantenibilidad del sistema y asegura que la gestión de perfiles se mantenga desacoplada de otros módulos del sistema.

<img src="resources/Images/Chapter-4/Diagrma de clases/Profile/Profile.png" alt = "Profile">

**Project Management:**

El diagrama de clases del módulo **Project** representa la estructura encargada de la creación, gestión y ciclo de vida de los proyectos dentro de la plataforma Foundly.

Este módulo sigue los principios de **Domain-Driven Design (DDD)**, donde la entidad **Project** actúa como *Aggregate Root*, y se aplica el patrón **CQRS (Command Query Responsibility Segregation)** para separar las operaciones de escritura y lectura.

#### Componentes principales

- **ProjectController:** actúa como punto de entrada del módulo, exponiendo endpoints REST para operaciones como creación de proyectos, postulación, aceptación de miembros, activación de monitoreo IoT y finalización del proyecto.

- **ProjectFacade:** capa de orquestación que coordina la interacción entre el controlador y los servicios de aplicación, simplificando el acceso a las funcionalidades del módulo.

#### Dominio

- **Project (Aggregate Root):** entidad principal del módulo que encapsula la información y comportamiento del proyecto. Incluye atributos como `id`, `name`, `description`, `status`, `ownerId` y `members`.  
  Además, define comportamientos clave como:
  - `create()`
  - `addMember()`
  - `removeMember()`
  - `activateIoT()`
  - `complete()`

- **ProjectId:** value object que representa el identificador del proyecto.

- **ProjectName:** value object que encapsula el nombre del proyecto.

- **ProjectStatus (enum):** define los estados posibles del proyecto:
  - `DRAFT`
  - `ACTIVE`
  - `COMPLETED`

#### Manejo de comandos (Command Side)

- **CreateProjectCommand:** contiene los datos necesarios para crear un proyecto (nombre, descripción y propietario).

- **ApplyToProjectCommand:** permite que un usuario solicite unirse a un proyecto.

- **AcceptMemberCommand:** representa la aceptación de un colaborador dentro del proyecto.

- **ActivateIoTCommand:** activa el monitoreo IoT asociado al proyecto.

- **CompleteProjectCommand:** marca el proyecto como finalizado.

- **ProjectCommandService:** ejecuta la lógica de negocio relacionada con la modificación del estado del proyecto, gestionando el flujo completo del ciclo de vida.

#### Manejo de consultas (Query Side)

- **GetProjectByIdQuery:** permite obtener un proyecto específico.

- **GetProjectsByUserQuery:** permite listar los proyectos asociados a un usuario.

- **GetAllProjectsQuery:** permite obtener todos los proyectos disponibles.

- **ProjectQueryService:** gestiona las operaciones de lectura del sistema, accediendo a la información persistida sin modificar el estado del dominio.

#### Persistencia

- **ProjectRepository:** interfaz que define las operaciones de acceso a datos del agregado Project, incluyendo:
  - `save(project)`
  - `findById(projectId)`
  - `findByUser(userId)`

Este repositorio desacopla la lógica de dominio de la infraestructura de persistencia.

#### Flujo general

1. El usuario interactúa desde la **SPA** enviando una solicitud al **ProjectController**.
2. El controlador delega la operación al **ProjectFacade**.
3. Dependiendo de la operación:
   - Para cambios de estado → se utiliza el **ProjectCommandService**.
   - Para consultas → se utiliza el **ProjectQueryService**.
4. El **ProjectCommandService** aplica las reglas de negocio sobre el agregado **Project**.
5. El **ProjectRepository** persiste o recupera la información desde la base de datos.
6. Las transiciones de estado del proyecto (DRAFT → ACTIVE → COMPLETED) son controladas por el dominio.

Este diseño permite encapsular toda la lógica del ciclo de vida del proyecto dentro de un único agregado, asegurando consistencia, mantenibilidad y alineación con los principios de arquitectura basada en dominios.

<img src="resources/Images/Chapter-4/Diagrma de clases/Project/Project.png" alt = "Project">

**Subscription Management:**

El diagrama de clases del módulo **Subscription** representa la estructura encargada de la gestión de planes y suscripciones de los usuarios dentro de la plataforma Foundly.

Este módulo sigue los principios de **Domain-Driven Design (DDD)** y aplica el patrón **CQRS (Command Query Responsibility Segregation)**, separando claramente las operaciones de escritura y lectura.

#### Componentes principales

- **SubscriptionController:** actúa como punto de entrada del módulo, exponiendo endpoints REST para operaciones como crear suscripciones, cancelarlas, renovarlas y consultar el estado de la suscripción de un usuario.

- **SubscriptionFacade:** capa de orquestación que centraliza las operaciones principales del módulo, delegando la lógica a los servicios correspondientes.

#### Dominio

- **Subscription (Aggregate Root):** entidad principal que representa la suscripción de un usuario. Contiene atributos como `id`, `userId`, `plan`, `status`, `startDate` y `endDate`.  
  Además, encapsula comportamientos clave:
  - `activate()`
  - `cancel()`
  - `expire()`

- **SubscriptionId:** value object que encapsula el identificador de la suscripción.

- **PlanType (enum):** define los tipos de planes disponibles:
  - `FREE`
  - `PREMIUM`

- **SubscriptionStatus (enum):** define los estados de la suscripción:
  - `ACTIVE`
  - `CANCELED`
  - `EXPIRED`

#### Manejo de comandos (Command Side)

- **CreateSubscriptionCommand:** contiene la información necesaria para crear una suscripción (usuario y tipo de plan).

- **CancelSubscriptionCommand:** representa la cancelación de una suscripción existente.

- **RenewSubscriptionCommand:** permite renovar una suscripción activa o expirada.

- **SubscriptionCommandService:** ejecuta la lógica de negocio relacionada con la creación, cancelación y renovación de suscripciones.  
  Este servicio interactúa con:
  - **SubscriptionRepository:** para persistencia.
  - **BillingGateway:** para procesar pagos.

#### Manejo de consultas (Query Side)

- **GetSubscriptionQuery:** permite obtener la suscripción asociada a un usuario.

- **SubscriptionQueryService:** se encarga de recuperar la información de suscripciones desde la base de datos.

#### Persistencia

- **SubscriptionRepository:** interfaz que define las operaciones de acceso a datos para la entidad Subscription, como:
  - `save(subscription)`
  - `findByUser(userId)`
  - `findById(subscriptionId)`

#### Integración con sistemas externos

- **BillingGateway:** interfaz que define la operación de cobro (`charge`), desacoplando la lógica del dominio del proveedor de pagos.

- **StripeBillingService:** implementación concreta del gateway que integra el sistema con **Stripe** para procesar pagos de suscripciones.

#### Flujo general

1. El usuario realiza una acción desde la **SPA** (crear, cancelar o renovar suscripción).
2. La solicitud llega al **SubscriptionController**.
3. El controlador delega la operación al **SubscriptionFacade**.
4. Dependiendo de la operación:
   - Para cambios → se utiliza el **SubscriptionCommandService**.
   - Para consultas → se utiliza el **SubscriptionQueryService**.
5. El **SubscriptionCommandService** interactúa con el **BillingGateway** para procesar pagos cuando es necesario.
6. Los datos se persisten mediante el **SubscriptionRepository**.
7. El agregado **Subscription** garantiza la consistencia del estado de la suscripción.

Este diseño permite desacoplar la lógica de negocio del proveedor de pagos, facilitar la escalabilidad del sistema y mantener un control claro sobre el ciclo de vida de las suscripciones dentro de Foundly.

<img src="resources/Images/Chapter-4/Diagrma de clases/Subscription/Subscription.png" alt = "Subscription">

**Notification Management:**

El diagrama de clases del módulo **Notification** representa la estructura encargada de la gestión y envío de notificaciones dentro del sistema Foundly, permitiendo informar a los usuarios sobre eventos relevantes como tareas, hitos, postulaciones y estados de proyectos.

Este módulo sigue los principios de **Domain-Driven Design (DDD)** y aplica el patrón **CQRS**, separando las operaciones de escritura (envío y actualización) de las operaciones de lectura (consulta de notificaciones).

#### Componentes principales

- **NotificationController:** actúa como punto de entrada del módulo, exponiendo endpoints REST para:
  - Enviar notificaciones (`send()`)
  - Obtener notificaciones de un usuario (`getByUser()`)
  - Marcar notificaciones como leídas (`markAsRead()`)

- **NotificationFacade:** capa de orquestación que centraliza las operaciones del módulo, delegando las acciones a los servicios de comandos y consultas.

#### Dominio

- **Notification (Aggregate Root):** entidad principal que representa una notificación. Contiene atributos como `id`, `userId`, `message`, `type` e `isRead`.  
  Incluye comportamiento como:
  - `markAsRead()`

- **NotificationId:** value object que encapsula el identificador de la notificación.

- **NotificationType (enum):** define los tipos de eventos que generan notificaciones:
  - `TASK_NEW`
  - `TASK_COMPLETED`
  - `MILESTONE_NEW`
  - `MILESTONE_COMPLETED`
  - `TASK_OVERDUE`
  - `MILESTONE_OVERDUE`
  - `NEW_APPLICANT`
  - `APPLICANT_ACCEPTED`
  - `APPLICANT_REJECTED`

Este enum permite categorizar las notificaciones y facilitar su procesamiento.

#### Manejo de comandos (Command Side)

- **SendNotificationCommand:** encapsula la información necesaria para enviar una notificación (usuario, mensaje y tipo).

- **MarkAsReadCommand:** representa la acción de marcar una notificación como leída.

- **NotificationCommandService:** ejecuta la lógica de envío y actualización de notificaciones.  
  Este servicio interactúa con:
  - **NotificationRepository:** para persistencia.
  - **NotificationSender:** para el envío real de la notificación.

#### Manejo de consultas (Query Side)

- **GetNotificationsQuery:** permite obtener las notificaciones asociadas a un usuario.

- **NotificationQueryService:** se encarga de recuperar las notificaciones desde la base de datos.

#### Persistencia

- **NotificationRepository:** interfaz que define las operaciones de acceso a datos, incluyendo:
  - `save(notification)`
  - `findByUser(userId)`
  - `findById(notificationId)`

#### Integración con servicios externos

- **NotificationSender:** interfaz que define el contrato para el envío de notificaciones.

- **EmailService:** implementación concreta que permite enviar notificaciones mediante correo electrónico.

Este diseño permite extender fácilmente el sistema para soportar otros canales como SMS o notificaciones push.

#### Flujo general

1. Un evento del sistema (por ejemplo, una tarea completada) genera una solicitud de notificación.
2. La solicitud llega al **NotificationController**.
3. El controlador delega la operación al **NotificationFacade**.
4. Para el envío:
   - Se utiliza el **NotificationCommandService**.
   - Se persiste la notificación en el **NotificationRepository**.
   - Se envía mediante el **NotificationSender**.
5. Para consultas:
   - Se utiliza el **NotificationQueryService**.
6. El usuario puede marcar notificaciones como leídas, actualizando su estado en el dominio.

Este diseño permite desacoplar el envío de notificaciones de su almacenamiento, facilita la extensibilidad del sistema y asegura una gestión eficiente de eventos relevantes dentro de Foundly.

<img src="resources/Images/Chapter-4/Diagrma de clases/Notification/Notification.png" alt = "Notification">

**Milestone Management:**

El diagrama de clases del módulo **Milestone** representa la estructura encargada de la gestión de los hitos dentro de los proyectos en la plataforma Foundly. Los hitos representan etapas clave del progreso de un proyecto y agrupan tareas colaborativas denominadas **MilestoneTask**.

Este módulo sigue los principios de **Domain-Driven Design (DDD)** y aplica el patrón **CQRS**, separando las operaciones de modificación del estado (commands) de las operaciones de consulta (queries).

#### Componentes principales

- **MilestoneController:** actúa como punto de entrada del módulo, exponiendo endpoints REST para:
  - Crear hitos (`create()`)
  - Agregar tareas al hito (`addTask()`)
  - Completar hitos (`complete()`)
  - Extender fechas límite (`extendDeadline()`)

- **MilestoneFacade:** capa de orquestación que centraliza las operaciones del módulo, delegando la lógica a los servicios correspondientes.

#### Dominio

- **Milestone (Aggregate Root):** entidad principal que representa un hito dentro de un proyecto. Contiene atributos como `id`, `projectId`, `title`, `description`, `status` y `dueDate`.  
  Además, mantiene una colección de tareas grupales:
  - `milestoneTasks: List<MilestoneTask>`

  Incluye comportamientos clave:
  - `create()`
  - `complete()`
  - `extendDeadline()`

- **MilestoneTask:** entidad que representa tareas colaborativas dentro de un hito. A diferencia del módulo Task, estas tareas pertenecen exclusivamente al contexto del hito.  
  Incluye atributos como título, descripción, asignado, estado, progreso y evidencia, así como comportamientos:
  - `updateProgress()`
  - `markAsCompleted()`
  - `addChecklistItem()`
  - `addAttachment()`

- **MilestoneId:** value object que encapsula el identificador del hito.

- **Deadline:** value object que representa la fecha límite del hito.

- **MilestoneStatus (enum):** define los estados del hito:
  - `PENDING`
  - `IN_PROGRESS`
  - `COMPLETED`

#### Manejo de comandos (Command Side)

- **CreateMilestoneCommand:** encapsula los datos necesarios para crear un hito.

- **AddTaskToMilestoneCommand:** permite agregar tareas grupales al hito.

- **CompleteMilestoneCommand:** marca un hito como completado.

- **ExtendMilestoneDeadlineCommand:** permite modificar la fecha límite del hito.

- **MilestoneCommandService:** ejecuta la lógica de negocio relacionada con la gestión de hitos y sus tareas internas.

#### Manejo de consultas (Query Side)

- **GetMilestonesByProjectQuery:** permite obtener todos los hitos de un proyecto.

- **GetMilestoneByIdQuery:** permite obtener un hito específico.

- **MilestoneQueryService:** gestiona las operaciones de lectura del módulo.

#### Persistencia

- **MilestoneRepository:** interfaz que define las operaciones de acceso a datos, incluyendo:
  - `save(milestone)`
  - `findByProject(projectId)`
  - `findById(milestoneId)`

#### Relación con otros módulos

- El módulo **Milestone** está directamente relacionado con el módulo **Project**, ya que cada hito pertenece a un proyecto (`projectId`).

- Las **MilestoneTask** son independientes del módulo **Task**, ya que representan trabajo grupal dentro de un hito y no tareas individuales del proyecto.

#### Flujo general

1. El usuario interactúa desde la **SPA** enviando solicitudes al **MilestoneController**.
2. El controlador delega las operaciones al **MilestoneFacade**.
3. Dependiendo del tipo de operación:
   - Para modificaciones → se utiliza el **MilestoneCommandService**.
   - Para consultas → se utiliza el **MilestoneQueryService**.
4. El **MilestoneCommandService** aplica las reglas de negocio sobre el agregado **Milestone**.
5. El **MilestoneRepository** gestiona la persistencia de los datos.
6. Las tareas grupales (**MilestoneTask**) se gestionan dentro del agregado, asegurando consistencia.

Este diseño permite modelar correctamente el trabajo colaborativo dentro de los proyectos, diferenciándolo de las tareas individuales y garantizando una gestión estructurada del progreso mediante hitos.

<img src="resources/Images/Chapter-4/Diagrma de clases/Milestone/Milestone.png" alt = "Milestone">

**Task Management:**

El diagrama de clases del módulo **Task** representa la estructura encargada de la gestión de tareas individuales dentro de la plataforma Foundly. Estas tareas corresponden a actividades personales asignadas a usuarios dentro de un proyecto y son independientes de los hitos (Milestones), los cuales gestionan tareas grupales en un contexto diferente.

Este módulo sigue los principios de **Domain-Driven Design (DDD)** y aplica el patrón **CQRS (Command Query Responsibility Segregation)** para separar operaciones de escritura y lectura.

#### Componentes principales

- **TaskController:** actúa como punto de entrada del módulo, exponiendo endpoints REST para la creación, asignación, envío de evidencias, aprobación y rechazo de tareas.

- **TaskFacade:** capa de orquestación que coordina la interacción entre el controlador y los servicios del dominio.

#### Dominio

- **Task (Aggregate Root):** entidad principal del módulo que representa una tarea individual. Contiene atributos como `id`, `assignedTo`, `title`, `description`, `status`, `dueDate` y `evidence`.  
  Define comportamientos clave:
  - `create()`
  - `assign()`
  - `submitEvidence()`
  - `approve()`
  - `reject()`
  - `extendDeadline()`

- **TaskId:** value object que encapsula el identificador de la tarea.

- **Evidence:** value object que representa la evidencia asociada a la tarea (por ejemplo, una URL de archivo o imagen).

- **TaskStatus (enum):** define los estados de la tarea:
  - `PENDING`
  - `IN_PROGRESS`
  - `SUBMITTED`
  - `APPROVED`
  - `REJECTED`

#### Manejo de comandos (Command Side)

- **CreateTaskCommand:** encapsula los datos necesarios para crear una tarea (título, descripción y usuario asignado).

- **SubmitTaskCommand:** permite que el usuario envíe evidencia de la tarea realizada.

- **ApproveTaskCommand:** representa la aprobación de la tarea.

- **RejectTaskCommand:** representa el rechazo de la tarea.

- **TaskCommandService:** ejecuta la lógica de negocio relacionada con la gestión del ciclo de vida de la tarea.

#### Manejo de consultas (Query Side)

- **GetTasksByIdQuery:** permite obtener información de una tarea específica o listar tareas por usuario.

- **TaskQueryService:** se encarga de recuperar información de tareas desde la base de datos.

#### Persistencia

- **TaskRepository:** interfaz que define las operaciones de acceso a datos, incluyendo:
  - `save(task)`
  - `findById(taskId)`
  - `findByUser(userId)`

#### Relación con otros módulos

- El módulo **Task** está relacionado con el módulo **Project**, ya que las tareas pertenecen a un proyecto y se asignan a usuarios participantes.

- A diferencia del módulo **Milestone**, las tareas aquí definidas son **individuales**, mientras que las tareas grupales se gestionan mediante la entidad **MilestoneTask** dentro del módulo Milestone.

#### Flujo general

1. El usuario interactúa desde la **SPA** enviando solicitudes al **TaskController**.
2. El controlador delega la operación al **TaskFacade**.
3. Dependiendo del tipo de operación:
   - Para modificaciones → se utiliza el **TaskCommandService**.
   - Para consultas → se utiliza el **TaskQueryService**.
4. El **TaskCommandService** aplica las reglas de negocio sobre el agregado **Task**.
5. El **TaskRepository** gestiona la persistencia de los datos.
6. El estado de la tarea evoluciona a lo largo de su ciclo de vida (PENDING → IN_PROGRESS → SUBMITTED → APPROVED/REJECTED).

Este diseño permite modelar correctamente la gestión de tareas individuales dentro del sistema, diferenciándolas claramente del trabajo colaborativo gestionado en los hitos, asegurando una arquitectura coherente y alineada con el dominio.


<img src="resources/Images/Chapter-4/Diagrma de clases/Task/Task.png" alt = "Task">

**Contribution Management:**

El diagrama de clases del módulo **Contribution** representa la estructura encargada de la gestión de aportes económicos realizados por los usuarios hacia los proyectos dentro de la plataforma Foundly.

Este módulo modela el flujo completo de una contribución, desde su creación hasta la confirmación o fallo del pago, siguiendo principios de **Domain-Driven Design (DDD)** y aplicando el patrón **CQRS** para separar operaciones de escritura y lectura.

#### Componentes principales

- **ContributionController:** actúa como punto de entrada del módulo, exponiendo endpoints REST para:
  - Crear contribuciones (`create()`)
  - Confirmar pagos (`confirm()`)
  - Consultar contribuciones por proyecto (`getByProject()`)

- **ContributionFacade:** capa de orquestación que centraliza las operaciones del módulo, delegando la lógica a los servicios correspondientes.

#### Dominio

- **Contribution (Aggregate Root):** entidad principal que representa un aporte económico realizado por un usuario. Contiene atributos como `id`, `projectId`, `userId`, `amount`, `status` y `createdAt`.  
  Define comportamientos clave:
  - `create()`
  - `confirmPayment()`
  - `failPayment()`

- **ContributionId:** value object que encapsula el identificador de la contribución.

- **Money:** value object que representa el monto y la moneda de la contribución, asegurando consistencia en operaciones financieras.

- **ContributionStatus (enum):** define los estados de la contribución:
  - `PENDING`
  - `CONFIRMED`
  - `FAILED`

Estos estados permiten modelar el ciclo de vida del pago.

#### Manejo de comandos (Command Side)

- **CreateContributionCommand:** encapsula los datos necesarios para crear una contribución (proyecto, usuario y monto).

- **ConfirmPaymentCommand:** representa la confirmación exitosa de un pago.

- **FailPaymentCommand:** representa un fallo en el proceso de pago.

- **ContributionCommandService:** ejecuta la lógica de negocio relacionada con el procesamiento de contribuciones.  
  Este servicio interactúa con:
  - **ContributionRepository:** para persistencia.
  - **PaymentGateway:** para procesar pagos externos.

#### Manejo de consultas (Query Side)

- **GetContributionsByProjectQuery:** permite obtener las contribuciones asociadas a un proyecto.

- **GetContributionsByUserQuery:** permite obtener las contribuciones realizadas por un usuario.

- **ContributionQueryService:** gestiona las operaciones de lectura del módulo.

#### Persistencia

- **ContributionRepository:** interfaz que define las operaciones de acceso a datos, incluyendo:
  - `save(contribution)`
  - `findByProject(projectId)`
  - `findByUser(userId)`

#### Integración con sistemas externos

- **PaymentGateway:** interfaz que define el contrato para el procesamiento de pagos (`processPayment`), desacoplando la lógica del dominio del proveedor externo.

- **StripeService:** implementación concreta del gateway que integra el sistema con **Stripe** para ejecutar los pagos.

Este enfoque permite cambiar el proveedor de pagos sin afectar la lógica del dominio.

#### Relación con otros módulos

- El módulo **Contribution** está directamente relacionado con el módulo **Project**, ya que cada contribución está asociada a un proyecto específico.

- También se relaciona con el módulo **User (IAM)** a través del `userId`, representando al usuario que realiza el aporte.

#### Flujo general

1. El usuario realiza una contribución desde la **SPA**.
2. La solicitud llega al **ContributionController**.
3. El controlador delega la operación al **ContributionFacade**.
4. El **ContributionCommandService**:
   - Crea la contribución en estado `PENDING`.
   - Invoca al **PaymentGateway** para procesar el pago.
5. Dependiendo del resultado:
   - Si el pago es exitoso → `CONFIRMED`.
   - Si falla → `FAILED`.
6. La información se persiste mediante el **ContributionRepository**.
7. Las consultas se realizan mediante el **ContributionQueryService**.

Este diseño permite modelar correctamente el flujo de pagos dentro del sistema, desacoplar la lógica del proveedor externo y garantizar consistencia en las transacciones financieras de Foundly.

<img src="resources/Images/Chapter-4/Diagrma de clases/Contribution/Contribution.png" alt = "Contribution">

**IOT:**

El diagrama de clases del módulo **IoT** representa la estructura encargada de la captura, gestión y consulta de métricas provenientes de dispositivos IoT dentro de la plataforma Foundly.

Este módulo permite integrar datos del mundo físico (sensores) con el sistema digital, facilitando el monitoreo en tiempo real de variables como temperatura, humedad, calidad del aire y ruido en los proyectos.

El diseño sigue principios de **Domain-Driven Design (DDD)** y aplica el patrón **CQRS**, separando las operaciones de escritura (registro de métricas) de las operaciones de lectura (consulta de datos).

#### Componentes principales

- **IoTController:** actúa como punto de entrada del módulo, exponiendo endpoints REST para:
  - Recepción de métricas (`receiveMetric()`)
  - Consulta de métricas (`getMetrics()`)

- **IoTFacade:** capa de orquestación que centraliza las operaciones del módulo, delegando la lógica a los servicios correspondientes.

#### Dominio

- **IoTMetric (Aggregate Root):** entidad principal que representa una métrica capturada desde un dispositivo IoT.  
  Contiene atributos como:
  - `id`
  - `projectId`
  - `deviceId`
  - `type`
  - `value`
  - `timestamp`

  Incluye comportamiento:
  - `record()`

- **IoTMetricId:** value object que encapsula el identificador de la métrica.

- **DeviceId:** value object que representa el identificador del dispositivo IoT.

- **MetricType (enum):** define los tipos de métricas capturadas:
  - `TEMPERATURE`
  - `HUMIDITY`
  - `AIR_QUALITY`
  - `NOISE`

- **MetricValue:** value object que representa el valor numérico de la métrica.

- **Timestamp:** value object que representa el momento en que se registra la métrica.

#### Manejo de comandos (Command Side)

- **RecordMetricCommand:** encapsula la información necesaria para registrar una métrica (proyecto, dispositivo, tipo y valor).

- **ActivateMonitoringCommand:** permite activar el monitoreo IoT para un proyecto específico.

- **IoTCommandService:** ejecuta la lógica de negocio relacionada con la recepción y registro de métricas.

#### Manejo de consultas (Query Side)

- **GetMetricsByProjectQuery:** permite obtener métricas asociadas a un proyecto.

- **GetMetricsByTypeQuery:** permite filtrar métricas según su tipo.

- **IoTQueryService:** gestiona las operaciones de lectura de métricas.

#### Persistencia

- **IoTRepository:** interfaz que define las operaciones de acceso a datos, incluyendo:
  - `save(metric)`
  - `findByProject(projectId)`
  - `findByType(type)`

#### Integración con dispositivos externos

- **IoTDeviceGateway:** interfaz que define el contrato para la recepción de datos provenientes de dispositivos físicos.

Este componente desacopla la lógica del dominio de la fuente de datos IoT, permitiendo integrar diferentes tipos de dispositivos o protocolos.

#### Relación con otros módulos

- El módulo **IoT** está directamente relacionado con el módulo **Project**, ya que las métricas se registran en el contexto de un proyecto (`projectId`).

- El módulo **Analytics** consume los datos generados por IoT para procesar información, generar reportes e identificar patrones o insights.

#### Flujo general

1. Un dispositivo IoT envía datos al sistema.
2. La solicitud es recibida por el **IoTController**.
3. El controlador delega la operación al **IoTFacade**.
4. El **IoTCommandService** registra la métrica mediante el agregado **IoTMetric**.
5. La información se persiste a través del **IoTRepository**.
6. Las consultas de métricas se realizan mediante el **IoTQueryService**.
7. Los datos pueden ser consumidos por el módulo **Analytics** para su procesamiento.

Este diseño permite integrar dispositivos IoT de manera desacoplada, manejar grandes volúmenes de datos en tiempo real y proporcionar una base sólida para análisis avanzados dentro de Foundly.

<img src="resources/Images/Chapter-4/Diagrma de clases/Iot/Iot.png" alt = "Iot">

**Analytics:**

<img src="resources/Images/Chapter-4/Diagrma de clases/Analytics/Analytics.png" alt = "Analytics">

## 4.8. Database Design
### 4.8.1. Database Diagram
