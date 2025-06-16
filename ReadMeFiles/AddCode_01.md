# ➕ Simple Add Number Form using Spring Boot and JSP

This project is a basic example of a Spring Boot application that:
- Accepts two numbers from an HTML form
- Submits them to a Spring controller
- Adds the numbers
- Displays the result using JSP

---

## 📁 Project Structure

```
src
├── main
│   ├── java
│   │   └── com.amantyatech.springbootwebapplication
│   │       └── SpringBootWebApplication.java
│   │       └── controller
│   │           └── HelloController.java
│   └── webapp
│       └── WEB-INF
│           └── views
│               ├── index.jsp
│               └── result.jsp
└── resources
    └── application.properties
````
#### application.properties :
````
spring.application.name=SpringBootWebApplication
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
````
---

## 🚀 How It Works

### 1. 📄 `index.html` (Input Form)

- Contains two number fields and a submit button.
- Sends a POST request to `/add`.

```html
<form action="add" method="post">
    <input type="number" name="num1" placeholder="Number 1"><br><br>
    <input type="number" name="num2" placeholder="Number 2"><br><br>
    <input type="submit" value="Submit">
</form>
````

---

### 2. 🧠 `AddController.java` (Spring Controller)
#### WAY 01 :
* Accepts form data using `HttpServletRequest`
* Adds `num1` and `num2`
* Stores the sum in session
* Redirects to `result.jsp`

```java
@PostMapping("add")
public String AddResult(HttpServletRequest req, HttpSession session) {
    int i = Integer.parseInt(req.getParameter("num1"));
    int j = Integer.parseInt(req.getParameter("num2"));
    int sum = i + j;

    session.setAttribute("sum", sum);
    return "result.jsp";
}
```
#### WAY 02:
```java
@RequestMapping("add")
public String AddResult(int num1, int num2, HttpSession session) {
    int sum = num1 + num2;
    
    session.setAttribute("sum", sum);
    return "result.jsp";
}
```
#### WAY 03: @RequestParam("actual_name") int custom_name;
```java
@RequestMapping("add")
public String AddResult(@RequestParam("num1") int number, int num2, HttpSession session) {
    int sum = number + num2;

    session.setAttribute("sum", sum);
    return "result.jsp";
}

```
#### WAY 04: Model Object
```java
@RequestMapping("add")
public String AddResult(int num1, int num2, Model model) {
    int sum = num1 + num2;
    
    model.addAttribute("sum", sum);
    return "result.jsp";
}
```
#### WAY 05: Prefix and Suffix
```java
@PostMapping("/add")
public String AddResult(int num1, int num2, Model model) {
    int sum = num1 + num2;

    model.addAttribute("sum", sum);
    return "result"; // Without .jsp, as suffix is auto-added
}
```
#### WAY 06: Model and View
```java
@PostMapping("add")
public ModelAndView add(@RequestParam int num1, @RequestParam int num2, ModelAndView mv) {
    int result = num1 + num2;
    mv.addObject("result", result);
    mv.setViewName("result");
    return mv;
}
// result.jsp
// <h2>Result is: ${result}</h2>
```
---

### 3. 🧾 `result.jsp` (Result Display)

* Displays the sum from session attribute.

```jsp
        <h2> Result is (Session): <%=  session.getAttribute("sum") %></h2>
        <h2> Result is (JSTL): ${sum}</h2>
```

---
## 🧪 Example

Input:

```
num1 = 10
num2 = 20
```

Output:

```
Result is: 30
```
---
