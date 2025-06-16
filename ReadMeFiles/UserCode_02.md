# ➕ Simple Alien Form using Spring Boot and JSP

This project is a basic example of a Spring Boot web application that:

* Accepts an Alien ID and Name from an HTML form
* Submits them to a Spring controller
* Binds them to a Java object
* Displays the result using JSP

---

## 📁 Project Structure

```
src
├── main
│   ├── java
│   │   └── com.amantyatech.springbootwebapplication
│   │       ├── SpringBootWebApplication.java
│   │       └── controller
│   │           ├── AlienController.java
│   │           └── Alien.java
│   └── webapp
│       └── WEB-INF
│           └── views
│               ├── index1.jsp
│               └── result1.jsp
└── resources
    └── application.properties
```

#### 📄 `application.properties`:

```properties
spring.application.name=SpringBootWebApplication
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

---

## 🚀 How It Works

### 1. 🧾 `index1.jsp` (Input Form)

* Contains two fields: `aid` (Alien ID) and `aname` (Alien Name)
* Submits form data via POST to `/addAlien`

```html
<form action="addAlien" method="post">
    <input type="text" id="aid" name="aid" placeholder="Enter aid"><br><br>
    <input type="text" id="aname" name="aname" placeholder="Enter aname"><br><br>
    <input type="submit" value="Submit">
</form>
```

---

### 2. 💡 `Alien.java` (POJO Class)

```java
public class Alien {

    private int aid;
    private String aname;

    // Getters and Setters + toString()
}
```

---

### 3. 🧠 `AlienController.java` (Spring Controller)

#### WAY 01: 
- when there are limit no. of filed like aid + aname only.
```java
@Controller
public class HelloController {

    @GetMapping("home")
    public String home() {
        return "index1";
    }

    @PostMapping("addAlien")
    public ModelAndView addAlien(@RequestParam int aid, @RequestParam String aname, ModelAndView mv) {
        Alien a1 = new Alien();
        alien.setAid(aid);
        alien.setAname(aname);
        mv.addObject("alien", alien);
        mv.setViewName("result1");
        return mv;
    }
}
```

#### WAY 02: Need for ModelAttribute
- when there n no. of filed like aid + aname + many more only.
```java
    @RequestMapping("addAlien")
    public String addAlien(@ModelAttribute("alien") Alien alien) {
        return "result1";
    }
```
- @ModelAttribute("alien") is optional is u use excate name everywhere in code.
```java
    @RequestMapping("addAlien")
    public String addAlien(Alien alien) {
        return "result1";
    }
```

---

### 4. 📄 `result1.jsp` (Output View)

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Alien Result</title>
</head>
<body>
    <h2>Alien id is: ${alien.aid}</h2>
    <h2>Alien name is: ${alien.aname}</h2>
</body>
</html>
```

---

## 🧪 Example

### ✅ Input:

```
aid: 101
aname: Vivek Chauhan
```

### ✅ Output:

```
Alien id is: 101
Alien name is: Vivek Chauhan
```

---
#### Need for ModelAttribute
- when there n no. of filed like aid + aname + many more only.
```java
@ModelAttribute("course")
public String courseName(){
    return "Java Full Stack";
}

@RequestMapping("addAlien")
public String addAlien(@ModelAttribute Alien alien) {
    return "result1";
}
```
- @ModelAttribute("alien") is optional is u use excate name everywhere in code.
```jsp
    <h2>Alien ID: ${alien.aid}</h2>
    <h2>Alien Name: ${alien.aname}</h2>
    <h2>${alien.aname} is enrolled in: ${course}</h2>
```
#### ✅ Output:

```html
Alien id is: 101
Alien name is: Vivek Chauhan
Vivek Chauhan is enrolled in: Java Full Stack
```