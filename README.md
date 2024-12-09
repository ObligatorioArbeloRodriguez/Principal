
![banner](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/Banner.jpeg)

# **OBLIGATORIO \- Certificado en DevOps (Electiva)**
**Analista en Tecnologías de la Información**

FRANCISCO RODRIGUEZ (299896) - LUCAS ARBELO (300805)     


**Docente: Federico Barceló**


**Fecha de entrega (09/12/2024)**




## Introducción:

Este obligatorio pretende brindar un plan bastante detallado (aunque no integral) de gestión de código, infraestructura y manejo de metodologías DevOps. Se buscó desarrollar un plan que pueda ser atractivo de implementar para una empresa que ha detectado fallas e ineficiencias en su operativa actual y que busca un primer acercamiento al paradigma DevOps para solucionar las problemáticas detectadas. Por esta razón, se priorizaron soluciones y herramientas que fueran lo más simples e intuitivas posibles. 

Se presentarán y fundamentarán las decisiones tomadas para la realización del obligatorio, así como se detallarán problemáticas encontradas, posibles áreas de mejora y utilización de inteligencia artificial generativa (particularmente ChatGPT) en algunas etapas del proceso. 

##  Solución Planteada

Para solucionar las problemáticas de la empresa, se optó por la siguiente solución:

Se fomentará un manejo de metodologías ágiles acordes al contexto organizacional de la empresa, buscando la estandarización de procesos y la reducción del *Time-To-Market*. 

Las **tareas**, así como su asignación, progreso y cumplimiento, se manejarán mediante un tablero Kanban, lo que permitirá una mayor agilidad, trazabilidad y organización de las distintas tareas de lso proyectos de la empresa. En este obligatorio, se utilizó específicamente para el área DevOps, pero se buscará estimular a la empresa a expandir su utilización a los distintos equipos.

El código será gestionado mediante una **herramienta de control de versione**s y un **esquema de repositorios centralizados con un esquema de ramas definido.** Esto permitirá, por un lado, un manejo integral, organizado y centralizado del código. De esta forma, se fomentarán la colaboración y la revisión del trabajo de los pares para una mayor calidad del código contribuido.Además, como se mencionará más adelante, la existencia de repositorios centralizados permitirá la implementación de herramientas y prácticas DevOps en los procesos de la empresa y aumentará la calidad del software final.

La **infraestructura será enteramente desplegada en la nube**, lo que garantizará una reducción de costos, simplificará tareas y reducirá labores de mantenimiento del personal de la empresa. También  se utilizará **Infraestructura como Código** (IaC) para lograr una homogenización en las arquitecturas y servicios utilizados. Además, este enfoque asegura la eficiencia, permitiendo reproducir el mismo esquema de infraestructura cuantas veces sea necesario, ya que se contará con los “planos” de dicha infraestructura en un formato verificable, reproducible y fácilmente mejorable y adaptable.  

Se utilizará la tecnología de **contenedores** para facilitar la portabilidad y el despliegue de aplicaciones sin importar el entorno, sistema operativo, dependencias y demás variables que pudiera haber entre los ambientes de los distintos miembros del equipo. Estos contenedores, como se explicará más adelante, serán manejados por un **orquestador de contenedores** que velará por la alta disponibilidad, escalabilidad, seguridad y buena salud de las soluciones desplegadas.

Se diseñará e implementará un **flujo de integración y despliegue continuo** en el que, mediante automatizaciones y procesos previamente definidos según las prácticas habituales del equipo, que buscarán agilizar y estandarizar el manejo del código una vez enviado por los desarrolladores y aprobado por el equipo. Como parte de este proceso, se incluirán herramientas de **testing automatizado y aprobaciones manuales** que establecerán estándares mínimos que el código debe cumplir para su despliegue

Se buscará fomentar la innovación, la adopción de tecnologías modernas y probadas en el mercado, y allanar el camino para futuras mejoras.

##  Herramientas

### Tablero Kanban 

**Jira**: Lo elegimos por su facilidad de uso y su interfaz intuitiva, que permite al equipo gestionar tareas y mantener un flujo de trabajo organizado sin complicaciones, considerando además que son una tecnología y metodología nuevas para el equipo. Al tener versión web, los distintos miembros del equipo pueden entrar sin problemas desde cualquier dispositivo. 

### Herramienta de Control de Versiones 

**Git integrado con GitHub**: Su excelencia en la gestión de código, su flexibilidad en el manejo de estructuras de ramas y su integración sencilla con la mayoría de IDEs y sistemas operativos  y herramientas de CI/CD lo convierten en una opción ideal para facilitar el desarrollo colaborativo y los despliegues automatizados.

### Herramienta de IaC 

**TERRAFORM.** Tiene integraciones con prácticamente todas las herramientas y servicios más utilizados en el mundo del desarrollo, está bien documentado y se mantiene al día con los desarrollos de los distintos proveedores. Esto, sumado a que es la herramienta dominante en el rubro a día de hoy, nos hicieron elegirlo como nuestra herramienta para IaC.

### Herramienta de CI/CD

**GitHub Actions**: Optamos por esta herramienta debido a su integración nativa con GitHub, lo que hace que configurar y ejecutar pipelines sea rápido y eficiente. Además, permite visualizar fácilmente el transcurso y el resultado de los trabajos realizados y simplifica enormemente el manejo seguro de credenciales.

### Cloud Provider 

**Amazon Web Services (AWS)**: Su amplia gama de servicios, su confiabilidad como líder en soluciones de nube, el hecho de que tenga soluciones integradas entre sí para gestionar todos los componentes y procesos que se necesitan en la infraestructura, sus costos transparentes y su alta confiabilidad y abundancia de documentación nos hicieron elegir esta herramienta.

### Contenedores

**DOCKER.** Es la herramienta líder en el mercado, es fácil de aprender y de utilizar y es potente y eficaz.

### Orquestador

**ECS**: Decidimos usar Amazon Elastic Container Service ya que nos permite ejecutar y gestionar contenedores de manera eficiente y su curva de aprendizaje algo menor que las alternativas (al tratarse de un servicio mayormente PaaS) lo hace ideal para un equipo que recién está adoptando metodologías DevOps.

### Herramienta de Análisis de Código Estático

**SonarCloud**: Fue recomendada durante el curso, es gratuita, y presenta los resultados de forma clara y visualmente atractiva, lo que la convierte en una excelente opción para implementar buenas prácticas de calidad de código. Además, evalúa aspectos muy diversos que refieren a la calidad del código y tiene niveles de exigencia configurables para dar las pruebas por aprobadas o no (quality gates). 

### Herramienta para Análisis de Prueba Extra 

**Selenium**: Lo seleccionamos para realizar pruebas automáticas a la aplicación de FrontEnd, ya que es una herramienta versátil y ampliamente utilizada en la industria para validar interfaces y funcionalidades. Además, es fácilmente integrable a pipelines CI/CD. 

### Elección de Servicio Serverless 

**AWS API GATEWAY**: Puede diseñarse mediante infraestructura como código al tiempo que se diseña el resto de la misma, y aporta un componente de seguridad extra a las aplicaciones ya que, tratándose de microservicios, asegura un punto de entrada único a los servicios desde el punto de vista del usuario final.

>*NOTA: Ver Sección de Problemáticas. Finalmente, NO se utiliza API Gateway y se utiliza un **AWS Lambda** que notifica vía Telegram cuando se suben archivos a alguno de los S3 Buckets del proyecto (tanto al de prod, como al de test y al de build). Esto se configuró con un bot de Telegram y asociando un recurso de AWS Lambda asociado a los S3 buckets, utilizando código en Python.*

## Estrategia (Kanban)

La estrategia utilizada se basó en la rúbrica que nos planteó el profesor en clase, realizando sprints semanales para lograr los objetivos a tiempo.

Sprint 1 (captura del 15/11):  
![sprint1](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/Sprint1.png)
Sprint 2 (captura del 20/11):  
![sprint2](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/Sprint2.jpeg)

Sprint 3 (captura del 26/11):
![sprint3](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/Sprint3.png)

Sprint 4 (captura del 9/12):
![sprint4](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/Sprint4.jpeg)

>*Nota: Al haber cerrado los sprints anteriores, no mostramos el progreso en ellos, pero las tareas correspondientes a cada sprint previo fueron finalizadas.*



## Diseño de Infraestructura (Utilizando IaC)

Se utilizó la documentación provista por Hashicorp para manejar la configuración de **providers** con la versión mas reciente de AWS para Terraform (5.78.0).

Se crearon cuatro **repositorios de ECR**, uno por aplicativo. 

>NOTA: Se utilizó **Terraform Workspaces** para poder crear las infraestructuras para los tres ambientes, pero utilizando variables simples para no crear archivos .tfvars. Por esta razón, se implementó un chequeo mediante el cual se crearán los ECRs solamente si se está en el workspace default. Nuestro flujo de trabajo implica crear la infra de DEV en el workspace default, luego crear un workspace “test” para crear la infra del ambiente TEST y luego pasar a un workspace “prod” para crear la infra del ambiente PROD (los nombres de los workspaces pueden variar, el único que se chequea es “default”, que debe ser usado para alguno de los ambientes, pues, como se aclaró, es cuando se crean los repositorios ECR. 

Se crearon tres **clusters** para alojar los aplicativos de backend (un cluster por ambiente).

Se crean cuatro **Services** por aplicativo para cada cluster. En el cluster de DEV, por ejemplo, habrá un servicio nombreAplicativo-dev para cada uno de los aplicativos.

A cada service se le asigna una **task definition** para que ECS sepa cómo crear el container de cada aplicativo, hosteados en Fargate, qué recursos asignarles y cuantas instancias asegurar tener en todo momento. NOTA: tras consulta al docente, se decide no hacer definición de Health checks por no ser requisito para el obligatorio).

Se creó un **load balancer** por ambiente, con listeners para cada aplicativo desplegado en ese ambiente. Se optó por un solo load balancer, pues, tras investigar (ver seccion de IAG), vimos que el load balancer tiene un costo, y que, al tener pocos aplicativos, podían  cubrirse las necesidades con uno solo por ambiente (3 LBs) en vez de uno por aplicativo por ambiente (12 LBs), para reducción de costos y de complejidad de infraestructura.

Se definió una política de autoscaling para cada servicio, basado en la utilización promedio de CPUs.

Se definió un API GATEWAY para centralizar los microservicios en un unico punto de entrada. Como se indicará más adelante, este punto no se ha podido probar debido a que al momento, tenemos error de networking entre ECR y ECS.

Con respecto a Networking, inicialmente optamos por la siguiente configuración:

Una **vpc** con dos **subnets**, una publica y una privada. La publica tiene acceso a internet mediante un Internet gateway. A su vez, se creaban **security groups** y **target groups** conectados a la vpc. Inicialmente, los servicios estaban configurados para NO asignar IPs publicas a las tareas.

Posteriormente, y ante problemas de conexion entre ECR y ECS, investigamos y vimos que tendríamos dos alternativas. Por un lado ,si seguimos optando por usar una subnet privada y una publica, deberemos implementar un *NAT Gateway* para poder darle salida a internet a las tasks (que no tendrían IP publica) para que puedan acceder a las imágenes del repositorio. En caso contrario, el docente sugirió utilizar la vpc por defecto de la cuenta de AWS Academy. *Daremos mas detalles sobre esto en la sección de problemáticas.*

Se crearon tres **bucketsS3**  con políticas de no bloquear acceso publico y habilitar contenido estático.

Evidencia de funcionamiento de TF:  

![terraform1](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/terraform1.jpg])![terraform2]([https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/terraform2.jpg])![terraform3]([https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/terraform3.jpg])![terraform4]([https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/terraform4.jpg])![Lambda]([https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/Lambda.jpeg)


## Estrategia de ramas:

En primer lugar, se resolvió utilizar un repositorio GitHub por cada microservicio y un repositorio específico para DevOps.  

En los repositorios de código, se optó por seguir un esquema **TRUNK-BASED**. 
En estos esquemas, se trabaja con una rama principal (main) que es la única desplegada en el pipeline de CICD y llevada a producción. 
Se vale de ramas efímeras que se van integrando a la rama principal una vez las funcionalidades que presentan se consideran finalizadas. 
>Optamos por este esquema porque, al estar la empresa transicionando a estas nuevas metodologías, nos pareció más fácil de entender e incorporar, dándole a los miembros de equipo la posibilidad de familiarizarse con el trabajo colaborativo en repositorios. En caso de decidirse a futuro pasar a un esquema más complejo como GitFlow, el equipo ya tendrá conocimientos mayores y podrá hacerlo con menor dificultad y mayor tasa de éxito.  

![TrunkbaseCODE](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/TrunkbaseCODE.png)

En el repositorio DevOps, optamos por un esquema **TRUNK-BASED** también.

En este repositorio no se sube código de producción sino que es el lugar en el que se centralizan los archivos y configuraciones que se utilizarán en los distintos pipelines CI/CD, como Dockerfiles y archivos YAML para GitHub Actions. 
 
Debido a esto, no nos pareció necesaria una estructura más compleja y orientada a desarrollo como puede ser GitFlow.  

>Además, se utilizó un esquema de **feature-branch** en el que se desarrollan las nuevas funcionalidades en ramas específicas, que luego deben ser integradas a la rama principal mediante pull requests que impliquen aprobación de otros miembros del equipo.
 Esto permite una verificación cruzada y aumenta la calidad del trabajo final. 

![TrunkbaseDEVOPS](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/TrunkbaseDEVOPS.png)

## Pipelines y procesos:

Aplicativos Backend:

En nuestros aplicativos backend, el flujo es el siguiente.

1. En cada push que se realiza a la rama main, el código es enviado a SonarCloud para una evaluación de código estático. El detalle de los resultados puede verse en el sitio web de SonarCloud de nuestra organización, pero se utilizó un Quality Gate para garantizar una calidad mínima del código.

2.  Si el código cumple con el quality gate especificado, el pipeline pasa a la siguiente etapa, que consiste en hacer el build de la aplicación (en este caso, usando Maven para realizar archivos .jar, siendo aplicativos Java) y armar una imagen Docker con la misma. Para esta sección se utiliza una práctica de Docker in docker, en el que se usa un contenedor para realizar el build de la app (pesado debido a dependencias necesarias) y luego otro contenedor minimalista en el que se busca empaquetar la aplicación solo con las dependencias esenciales para su despliegue y ejecución.

3. Se le pone un tag a esa imagen de Docker y se la envía al repositorio de imágenes docker de Amazon, ECR, donde será alojada. 

4. La aplicación se despliega en ECS y se disponibiliza en ambientes DEV y TEST, pidiendo aprobación manual para realizar el despliegue al ambiente de producción. 

5. Una vez dada dicha aprobación, se despliega y disponibiliza en el ambiente PROD. 

En los tres ambientes, se incluye un API Gateway que cumple la función de ser el único punto de ingreso al aplicativo. 

>Se optó por manejar un cluster de ECS por ambiente (dev, test y prod). Cada cluster cuenta con un servicio (Service) correspondiente a cada aplicativo, que contará con una Task Definition para disponibilizar el aplicativo en contenedores, monitorear su estado, su carga y su tráfico, escalando horizontalmente par tolerar una mayor o menor demanda mediante políticas de autoscaling predefinidas.   

![CICD_BE.png](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/CICD_BE.png)

Aplicativo Frontend React:

NOTA: *El archivo .yml utilizado por el pipeline de frontend no fue ubicado en el repo centralizado ya que solo es utilizado por si mismo. Se encuentra en el repositorio FE-React bajo el nombre main.yml.*

1. En cada push que se realiza a la rama main, el código es enviado a SonarCloud para una evaluación de código estático.

2.  Si el código cumple con el quality gate especificado, el pipeline pasa a la siguiente etapa, que consiste en hacer el build de la aplicación, en este caso utilizando Node.JS. 

3. Luego de hecho el build, se pasa a un test automatizado en Selenium, que simula la ejecución del aplicativo en un navegador web y realiza pruebas básicas para comprobar funcionamiento (se eligieron pruebas relativamente sencillas ya que no teníamos experiencia con los tests de Selenium y la aplicación era relativamente básica en cuanto a funcionalidad. Se evalúa el mensaje del encabezado del sitio web, la existencia de ciertos links y headers). La herramienta tiene potencial para evaluar  las aplicaciones de maneras bastante más exhaustivas. 

4. Si se pasa el test, se hará el despliegue a los ambientes DEV y TEST, que en este caso, se hará en buckets de S3 habilitados a alojar contenido web estático. 

5. Se pedirá aprobación manual, y, cuando se otorgue, se realizará el despliegue al S3 bucket correspondiente al ambiente de producción.

![CICD_FE.png](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/CICD_FE.png)

##  Herramientas de Testing

###  Análisis Sonar

>[Nuestra Organizacion de Sonar](https://sonarcloud.io/organizations/obligatorioarbelorodriguez/projects)  

A continuación se muestran los resultados obtenidos:

#### FRONTEND

Como se ve en las imágenes, el aplicativo FrontEnd pasa por tests, mostrando 26 puntos de mejora, pero ninguno de ellos reviste mayor severidad. La práctica totalidad de los puntos mejorables refieren a la mantenibilidad de la aplicación y aspectos de consistencia en lo que refiere a prácticas de Clean Code.  

![FESonar1](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/FESonar1.jpeg)
![FESonar2](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/FESonar2.jpeg)
![FESonar3](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/FESonar3.jpeg)
#### BACKEND:

Con respecto a los aplicativos de backend, todos pasan el Quality Gate por defecto de SonarCloud, mostrando puntos de mejora bastante similares. Se encontraron algunos problemas menores como malas prácticas de formateo o métodos que devuelven vacío en caso de no cumplirse un condicional (no hacen nada). En todos los aplicativos se detectaron algunos problemas de seguridad de baja importancia, como el logging innecesario de datos del usuario. 

    ORDERS:


![OrdersSonar1.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/OrdersSonar1.jpeg)
![OrdersSonar2.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/OrdersSonar2.jpeg)
![OrdersSonar3.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/OrdersSonar3.jpeg)

    PAYMENTS

![PaymentsSonar1](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/PaymentsSonar1.jpeg)
![PaymentsSonar2](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/PaymentsSonar2.jpeg)

    PRODUCTS

![ProductsSonar1.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/ProductsSonar1.jpeg)

    SHIPPING

![ShippingSonar1.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/ShippingSonar1.jpeg)
![ShippingSonar2.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/ShippingSonar2.jpeg)

###  Test Selenium 

Los test de selenium, los usamos para el aplicativo FE, el cual consiste en una prueba de UI.  
El mismo está incluido en el Pipeline de GH Actions.

![selenium pipeline](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/selenium%20pipeline.jpg)

![selenium código](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/selenium%20test.png)


## Uso de IA

*Se aclarará que se utilizó ChatGPT para algunas cosas.*

En los YML, para dos cosas: 
1. Para revisar problemas de indentación, llaves, etc., que daban error en VSC y no nos dábamos cuenta.  
2. Para ver cómo parametrizar el pipeline de repo Principal (manejo de inputs y secrets provenientes de otros repos)

Ejemplo:
![GPT1.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/GPT1.jpeg)

 En el Dockerfile principal (utilizado por todos los aplicativos BE menos Orders) para corregir errores al querer utilizar Docker-in-Docker (manejo de “AS builder”).  
      
  En Terraform se usó con más intensidad. 

> diseño de API gateway:

![GPT2.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/GPT2.jpeg)

![GPT3.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/GPT3.jpeg)
> (luego de pasarle nuestro API GATEWAY:):

![GPT4.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/GPT4.jpeg)
En este caso lo utilizamos para validar nuestra solución. Si bien nos recomendó utilizar dos resources de api gateway para products (porque puede recibir un parametro de ID producto), optamos por dejar un solo GET. 

Adicionalmente, lo usamos para:

 - Entender como se hacía el pasaje de datos entre módulos distintos (outputs, variables y “pasamanos” en main)


- Para entender las distintas maneras de completar el template brindado por el equipo docente y que opción nos convenía mas (por Ejemplo, hacer subnets públicas únicamente y asignar IPs a los Services, o hacer subnets públicas y privadas usando un NAT sin exponer los Services mediante una IP pública).  
- En la creación del Autoscaling y entender que es cada valor que se pide.

- Creación de repositorios ECR   
- Ajustes en el load balancer y resolver si utilizábamos uno por ambiente (como definimos finalmente) o un load balancer por aplicativo.   
- Manejo de target groups y configuración de security groups.  
- Organización de archivos .tf. Ejemplo:
  ![GPT5.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/GPT5.jpeg)
- entendimiento de diferencias entre EKS y ECS, ejemplo:

![GPT6.jpeg](https://github.com/ObligatorioArbeloRodriguez/Principal/blob/main/images/GPT6.jpeg)

>NOTA: No se adjuntan capturas de todos los usos que se le dió para no generar un archivo tan extenso con elementos que no aportan demasiado. 



## Problemáticas

###  Pasaje de ECR a ECS

Tuvimos dificultades con la configuración de networking, y no logramos que las task definitions del ECS puedan hacer pull de la imagen de docker de los aplicativos.   

Originalmente quisimos trabajar con subnet públicas y privadas, creando todo nosotros, incluyendo VPCs, subnets, internet gateways, security groups, etc. La dificultad que tuvimos, creemos, fue que no habíamos creado el NAT para darle acceso a internet a los servicios que no generaban IP publica.

Luego probamos abrir los puertos y no usar la subnet privada, solamente usando las públicas, pero tampoco tuvimos éxito. Finalmente, por recomendación docente, intentamos utilizar la VPC y subnets públicas creadas por defecto por AWS, pero por razones de tiempo no pudimos finalizar la implementación sin que diera errores. Como evidencia de ello, mantenemos la rama /feature/default-v1.

###  API Gateway / Lambda

Si bien mantuvimos en el repositorio las instrucciones de creación del API Gateway, no pudimos probarlo debido a la problemática anterior. Es posible que tenga errores por no haber podido debuggear. 

Por esta razón, para asegurar el cumplimiento del requerimiento de utilización de serverless, optamos por implementar otro servicio que, como se explicó en la sección Herramientas, consiste en un servicio Lambda que notifica vía bot de Telegram mediante API, cuando se suben archivos a los buckets S3. Notificará a un grupo creado por el usuario de Telegram, que incluye al bot. 


