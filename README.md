![Star Badge](https://img.shields.io/static/v1?label=%F0%9F%8C%9F&message=If%20Useful&style=style=flat&color=BC4E99)
![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)
[![View My Profile](https://img.shields.io/badge/View-My_Profile-green?logo=GitHub)](https://github.com/pratham2402)
[![View Repositories](https://img.shields.io/badge/View-My_Repositories-blue?logo=GitHub)](https://github.com/pratham2402?tab=repositories)

[![forthebadge](https://forthebadge.com/images/badges/made-with-java.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/powered-by-overtime.svg)](https://forthebadge.com)

# SocialSphere

A simple, Facebook-like social media web application built using **Java Servlets**, **JSP**, **JDBC**, and **H2 Database**. SocialSphere allows users to register, log in, create posts, view all posts, and comment on others' posts — all through a minimal HTML interface.

---

## 🚀 Features

- ✅ User Registration with email, username, and password
- ✅ User Login and authentication
- ✅ Create and publish text-based posts
- ✅ View posts from all users
- ✅ Comment on existing posts
- ✅ Data persistence using JDBC and H2 database

---

## 🛠️ Tech Stack

| Layer         | Technology       |
|---------------|------------------|
| Frontend      | HTML (No CSS/JS) |
| Server-side   | Java Servlets, JSP |
| Database      | H2 Database       |
| DB Access     | JDBC              |
| IDE           | IntelliJ IDEA / Eclipse |
| Web Server    | Apache Tomcat 11 |

---

## 🗂️ Project Structure

```
SocialSphere/
├── src/
│   ├── main/
│   │   ├── java/         # Java Servlet classes
│   │   └── webapp/
│   │       ├── WEB-INF/  # web.xml configuration
│   │       └── *.jsp     # JSP pages
├── .gitignore
├── pom.xml (if using Maven)
└── README.md
```

---

## ⚙️ Setup Instructions

1. **Clone the repo**:
   ```bash
   git clone https://github.com/pratham2402/SocialSphere.git
   ```

2. **Open in IntelliJ or Eclipse** and configure:
   - Java SDK (1.8 or higher)
   - Apache Tomcat server

3. **Run H2 Database** (Embedded or Server mode)

4. **Deploy to Tomcat**

5. Access app at:  
   `http://localhost:8080/SocialSphere/`

---

## 📝 Functional Requirements

- **Registration**: Validate unique username and store credentials.
- **Login**: Authenticate using stored user data.
- **Post Creation**: Allow logged-in users to submit posts.
- **Post Viewing**: Display all user posts chronologically.
- **Commenting**: Allow users to comment on any post.

---

## 📦 Dependencies (if using Maven)

```xml
<dependencies>
    <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
        <version>2.1.214</version>
    </dependency>
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>4.0.1</version>
        <scope>provided</scope>
    </dependency>
</dependencies>
```

---

## 📄 License

This project is for educational purposes only.

---

## 🙌 Acknowledgments

Project built as part of Java EE practice to strengthen understanding of Servlets, JSP, and JDBC integration.