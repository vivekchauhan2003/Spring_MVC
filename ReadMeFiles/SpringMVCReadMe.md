# SpringMVCFullAndFinal

A simple Spring MVC web application demonstrating form handling, model attribute binding, and view resolution using JSP.

## 📁 Project Structure

```

SpringMVCFullAndFinal/
├── src/
│   └── main/
│       ├── java/
│       │   └── com.amantyatech.SpringMVCFullAndFinal.controller/
│       │       ├── Alien.java
│       │       └── HelloController.java
│       ├── resources/
│       └── webapp/
│           └── WEB-INF/
│               ├── views/
│               │   ├── index1.jsp
│               │   └── result1.jsp
│               ├── dispatcher-servlet.xml
│               └── web.xml
├── pom.xml

````

## 🛠 Technologies Used

- Java
- Spring MVC 6.2.6
- JSP
- Maven
- Apache Tomcat

## 📄 Key Files

### 1. `pom.xml`

Maven configuration file that includes:

```xml
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>6.2.6</version>
</dependency>
````

### 2. `dispatcher-servlet.xml`

Spring configuration file that enables:

* Component scanning for `com.amantyatech`
* View resolver pointing to `/WEB-INF/views/` with `.jsp` suffix

```xml
<ctx:component-scan base-package="com.amantyatech"/>
<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"/>
    <property name="suffix" value=".jsp"/>
</bean>
```

### 3. `web.xml`

Defines the `DispatcherServlet` mapping for all URLs (`/`):

```xml
<servlet>
  <servlet-name>dispatcher</servlet-name>
  <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  <load-on-startup>1</load-on-startup>
</servlet>
<servlet-mapping>
  <servlet-name>dispatcher</servlet-name>
  <url-pattern>/</url-pattern>
</servlet-mapping>
```

## 👨‍💻 Java Classes

### `Alien.java`

A simple POJO with `aid` and `aname` fields, used to receive form input via `@ModelAttribute`.

### `HelloController.java`

Handles two routes:

* `/home`: returns `index1.jsp` view
* `/addAlien`: binds form data to `Alien` object and returns `result1.jsp`

Also injects a model attribute:

```java
@ModelAttribute("course")
public String courseName() {
    return "Java Full Stack";
}
```

## 📄 Views

* `index1.jsp`: Input form for `Alien`
* `result1.jsp`: Displays the result after submission

## ▶️ Run Instructions

1. Import as a Maven project in your IDE.
2. Deploy on Apache Tomcat server.
3. Visit `http://localhost:8080/SpringMVCFullAndFinal/home` to access the form.

## ✅ Output Example

* Fill form at `/home`
* Submit to `/addAlien`
* View result at `result1.jsp` with alien data and "Java Full Stack" course info

---