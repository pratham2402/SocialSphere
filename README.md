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

| Layer         | Technology              |
|---------------|-------------------------|
| Frontend      | HTML, CSS               |
| Server-side   | Java Servlets, JSP      |
| Database      | H2 Database             |
| DB Access     | JDBC                    |
| IDE           | IntelliJ IDEA / Eclipse |
| Web Server    | Apache Tomcat 11        |
| Build Tool    | Maven                   |

---

## 🗂️ Project Structure

```
SocialSphere/
├── db/                         # H2 database files
│   ├── SocialSphereDB.mv.db
│   └── SocialSphereDB.trace.db
├── src/
│   └── main/
│       ├── java/
│       │   ├── DAO/            # Data Access Objects
│       │   ├── models/         # Entity classes
│       │   ├── servlets/       # Main Controller Servlet
│       │   └── utils/          # Utility classes (DBUtil)
│       ├── resources/          # Resources (if any)
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml     # Servlet configuration
│           ├── createpost.jsp
│           ├── home.jsp
│           ├── login.jsp
│           ├── register.jsp
│           └── welcome.jsp
├── .gitignore
├── pom.xml
├── README.md
└── target/                     # Build output (ignored)
```

---

## ⚡ Getting Started

### Prerequisites
- Java 8 or above
- Maven
- Apache Tomcat 11 (or compatible)

### Setup & Run
1. **Clone the repository:**
   ```bash
   git clone https://github.com/pratham2402/SocialSphere.git
   cd SocialSphere
   ```
2. **Build the project:**
   ```bash
   mvn clean package
   ```
3. **Deploy the WAR file:**
   - Deploy `target/SocialSphere.war` to your Tomcat server's `webapps` directory.
4. **Access the app:**
   - Open [http://localhost:8080/SocialSphere](http://localhost:8080/SocialSphere) in your browser.

---

## 📝 Usage
- Register a new account.
- Log in with your credentials.
- Create, view, and comment on posts.

---

## 🤝 Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## 📄 License
This project is open source and available under the [MIT License](LICENSE).
