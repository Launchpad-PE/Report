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

<img src="resources/Images/Chapter-4/Diagrma de clases/Profile/Profile.png" alt = "Profile">

**Project Management:**

<img src="resources/Images/Chapter-4/Diagrma de clases/Project/Project.png" alt = "Project">

**Subscription Management:**

<img src="resources/Images/Chapter-4/Diagrma de clases/Subscription/Subscription.png" alt = "Subscription">

**Notification Management:**

<img src="resources/Images/Chapter-4/Diagrma de clases/Notification/Notification.png" alt = "Notification">

**Milestone Management:**

<img src="resources/Images/Chapter-4/Diagrma de clases/Milestone/Milestone.png" alt = "Milestone">

**Task Management:**

<img src="resources/Images/Chapter-4/Diagrma de clases/Task/Task.png" alt = "Task">

**Contribution Management:**

<img src="resources/Images/Chapter-4/Diagrma de clases/Contribution/Contribution.png" alt = "Contribution">

**IOT:**

<img src="resources/Images/Chapter-4/Diagrma de clases/Iot/Iot.png" alt = "Iot">

**Analytics:**

<img src="resources/Images/Chapter-4/Diagrma de clases/Analytics/Analytics.png" alt = "Analytics">

## 4.8. Database Design
### 4.8.1. Database Diagram
