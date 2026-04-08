workspace "Foundly - C4 Model" "Diagrama de contexto y contenedores de Foundly" {

    model {
        // Personas
        Emprendedores = person "Emprendedores" "Usuarios que crean y gestionan proyectos."
        Colaboradores = person "Colaboradores" "Usuarios que participan en proyectos."

        // Sistemas externos
        Stripe = softwareSystem "Stripe" "Pasarela de pago utilizada para procesar contribuciones y suscripciones."
        Cloudinary = softwareSystem "Cloudinary" "Servicio para almacenamiento de imágenes y archivos."
        AuthService = softwareSystem "Auth0" "Servicio externo de autenticación y gestión de identidad."
        IoTDevices = softwareSystem "IoT Devices" "Sensores físicos o simulados que capturan datos ambientales."

        // Sistema principal
        Foundly = softwareSystem "Foundly" "Plataforma colaborativa con IoT para gestión de proyectos y financiamiento" {

            LandingPage = container "Landing Page" "Página pública con información del producto y call-to-action" "HTML, CSS, JS"

            SPA = container "Single Page Application" "Aplicación web para usuarios autenticados" "Angular"

            Backend = container "API Application" "Backend monolítico que gestiona la lógica del sistema" "Spring Boot (Java)" {

                // 🔷 PERSISTENCE
                Repository = component "Persistence Layer" "Gestiona el acceso a datos (JPA/Hibernate)" "Spring Data JPA"

                // 🔷 API
                API = component "REST API Controllers" "Expone endpoints REST para la SPA" "Spring MVC"

                // 🔷 SHARED
                Shared = component "Shared Module" "Componentes reutilizables, eventos y utilidades comunes" "Java"

                // 🔐 IAM
                IAM = component "IAM Module" "Gestión de autenticación y usuarios" "Java"

                // 👤 PROFILE
                Profile = component "Profile Module" "Gestión de perfiles de usuario" "Java"

                // 📁 PROJECT
                Project = component "Project Module" "Gestión del ciclo de vida de proyectos" "Java"

                // 🎯 MILESTONE
                Milestone = component "Milestone Module" "Gestión de hitos grupales" "Java"

                // ✅ TASK
                Task = component "Task Module" "Gestión de tareas individuales" "Java"

                // 🔔 NOTIFICATION
                Notification = component "Notification Module" "Gestión de notificaciones del sistema" "Java"

                // 💳 SUBSCRIPTION
                Subscription = component "Subscription Module" "Gestión de planes y suscripciones" "Java"

                // 💰 CONTRIBUTION
                Contribution = component "Contribution Module" "Gestión de aportes y financiamiento" "Java"

                // 📡 IOT
                IoT = component "IoT Module" "Gestión de datos ambientales y monitoreo" "Java"

                // 📊 ANALYTICS
                Analytics = component "Analytics Module" "Procesamiento de métricas e insights" "Java"
            }

            Database = container "Database" "Base de datos relacional del sistema" "MySQL"
        }

        // 🔴 CONTEXTO
        Emprendedores -> Foundly "Gestionan proyectos"
        Colaboradores -> Foundly "Participan en proyectos"

        Foundly -> Stripe "Procesa pagos y contribuciones"
        Foundly -> Cloudinary "Almacena imágenes y archivos"
        Foundly -> AuthService "Gestiona autenticación"

        // 🟡 FLUJO USUARIO
        Emprendedores -> LandingPage "Acceden a la plataforma"
        Colaboradores -> LandingPage "Acceden a la plataforma"

        LandingPage -> SPA "Call to Action (login / registro)"

        SPA -> Backend "Consume API REST (JSON)"

        // 🔵 BACKEND
        Backend -> Database "Lee y escribe datos"
        Backend -> Stripe "Procesa pagos"
        Backend -> Cloudinary "Gestiona archivos"
        Backend -> AuthService "Valida autenticación"
        IoTDevices -> Backend "Envía métricas ambientales en tiempo real"

        // 🔗 API
        SPA -> API "Realiza solicitudes HTTP"
        API -> IAM "Gestiona autenticación"
        API -> Profile "Gestiona perfiles"
        API -> Project "Gestiona proyectos"
        API -> Milestone "Gestiona hitos"
        API -> Task "Gestiona tareas"
        API -> Notification "Gestiona notificaciones"
        API -> Subscription "Gestiona suscripciones"
        API -> Contribution "Gestiona aportes"
        API -> IoT "Gestiona datos IoT"
        API -> Analytics "Consulta métricas"

        // 🔗 SHARED
        IAM -> Shared "Usa utilidades comunes"
        Profile -> Shared "Usa utilidades comunes"
        Project -> Shared "Usa utilidades comunes"
        Milestone -> Shared "Usa utilidades comunes"
        Task -> Shared "Usa utilidades comunes"
        Notification -> Shared "Usa utilidades comunes"
        Subscription -> Shared "Usa utilidades comunes"
        Contribution -> Shared "Usa utilidades comunes"
        IoT -> Shared "Usa utilidades comunes"
        Analytics -> Shared "Usa utilidades comunes"

        // 🔗 REPOSITORY
        IAM -> Repository "Persistencia de usuarios"
        Profile -> Repository "Persistencia de perfiles"
        Project -> Repository "Persistencia de proyectos"
        Milestone -> Repository "Persistencia de hitos"
        Task -> Repository "Persistencia de tareas"
        Notification -> Repository "Persistencia de notificaciones"
        Subscription -> Repository "Persistencia de suscripciones"
        Contribution -> Repository "Persistencia de aportes"
        IoT -> Repository "Persistencia de métricas"
        Analytics -> Repository "Consulta datos"

        Repository -> Database "Operaciones CRUD"

        // 🔥 RELACIONES CLAVE DE NEGOCIO
        Project -> IoT "Activa monitoreo ambiental"
        IoT -> Analytics "Envía métricas para análisis"
    }

    views {

    systemContext Foundly {
        include *
        autolayout lr
    }

    container Foundly {
        include *
        autolayout lr
    }

    component Backend {
        include *
        autolayout lr
    }

    styles {

        // 👤 Personas
        element "Person" {
            background #08427b
            color #ffffff
            shape person
        }

        // 🌐 Sistemas externos
        element "Software System" {
            background #999999
            color #ffffff
        }

        // 📦 Contenedores
        element "Container" {
            background #1168bd
            color #ffffff
        }

        // 🧩 Componentes
        element "Component" {
            background #438dd5
            color #ffffff
        }

        // 🗄️ Base de datos
        element "Database" {
            shape cylinder
        }

        // 🔐 IAM
        element "IAM Module" {
            background #8e44ad
        }

        // 📁 PROJECT
        element "Project Module" {
            background #27ae60
        }

        // 🎯 MILESTONE
        element "Milestone Module" {
            background #2ecc71
        }

        // ✅ TASK
        element "Task Module" {
            background #16a085
        }

        // 📡 IOT
        element "IoT Module" {
            background #e67e22
        }

        // 📊 ANALYTICS
        element "Analytics Module" {
            background #f39c12
        }

        // 💰 CONTRIBUTION
        element "Contribution Module" {
            background #d35400
        }

        // 💳 SUBSCRIPTION
        element "Subscription Module" {
            background #c0392b
        }

        // 🔔 NOTIFICATION
        element "Notification Module" {
            background #2980b9
        }

        // 👤 PROFILE
        element "Profile Module" {
            background #3498db
        }

        // 🔷 SHARED
        element "Shared Module" {
            background #7f8c8d
        }

        // 🧱 PERSISTENCE
        element "Persistence Layer" {
            background #2c3e50
        }

    }

    theme default
}
}